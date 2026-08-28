# Rootless Docker — Migration Notes

**Date of investigation:** 2026-08-28
**Goal:** run `make up` without `sudo`, without granting root-equivalent access.
**Decision:** use **real rootless Docker** (`dockerd-rootless`), *not* Omarchy's
"sudoless Docker" docker-group toggle.

---

## Why not the docker group

Omarchy deliberately leaves the install user out of the `docker` group. The reason is
recorded in `/usr/share/omarchy/install/config/docker.sh`: the daemon runs as root and
its socket is root-owned, so group membership is equivalent to passwordless root —
`docker run -v /:/host alpine` rewrites the host with no prompt.

The opt-in toggle exists if we ever want it:

```bash
omarchy setup security sudoless docker      # adds $USER to docker group, needs reboot
omarchy remove security sudoless docker     # reverses it
```

Rootless gets the same convenience without the root-equivalence, and this project's
compose file has nothing that requires the root daemon.

---

## System state as of 2026-08-28 (verified)

| Item | State |
|---|---|
| Docker | 29.7.2, plus docker-buildx 0.36.1, docker-compose 5.5.0 |
| `docker` group | exists (gid 968), **empty** — user not a member |
| `docker.socket` (system) | enabled but **inactive** — root daemon not running |
| `/etc/subuid`, `/etc/subgid` | `dimitri0s:100000:65536` — already provisioned |
| Unprivileged userns | enabled (`kernel.unprivileged_userns_clone = 1`) |
| Kernel | 7.1.9-arch1-2 → native overlayfs works in userns, no fuse-overlayfs perf hit |
| Rootless net driver | no `slirp4netns`/`pasta` installed → rootlesskit 3.1.0 falls back to its **built-in `gvisor-tap-vsock`** |
| `~/.local/share/docker` | does not exist yet — clean slate |
| Omarchy | 4.0.1-1 |
| Passwordless sudo | no, sudo prompts for a password |

The daemon already being disabled is convenient: `dockerd-rootless-setuptool.sh` refuses
to run while a system-wide docker is active, so there is nothing to tear down first.

---

## Why rootless fits `docker-compose.yml`

Every rootless limitation that normally causes trouble is absent:

| Rootless limitation | This project |
|---|---|
| Cannot bind ports < 1024 | Lowest published port is **1025** (mailcrab). 5432, 5050, 6379, 1080 all clear |
| No `--privileged` / added capabilities | None used |
| No host networking | Uses named bridge `water_direct_network` |
| No device mounts, no `docker.sock` mounted into a container | None |
| Bind mounts and uid mapping | Only `./development_assist/pgadmin_database_servers.json`, mode `664` (world-readable), so pgadmin's internal uid 5050 can still read it after subuid mapping |
| cgroup v2 resource limits / AppArmor labels | Not used |

Services are postgres, pgadmin, redis, mailcrab — all passive listeners, all
`restart: "no"`.

---

## ⚠️ Do this FIRST, before switching

Rootless stores volumes under `~/.local/share/docker/volumes`, **not**
`/var/lib/docker/volumes`. Existing data does not carry over.

```bash
sudo ls -la /var/lib/docker/volumes
```

If `water_direct_postgresql_data` holds a dev DB worth keeping, take a dump before
switching (needs the old root daemon running):

```bash
sudo systemctl start docker.socket
make create_database_backup        # -> database_backup.dump
sudo systemctl stop docker.socket docker.service
```

Then after the switch, bring the stack up and `make restore_database_backup`.
Otherwise just plan on `make migrate` plus fixtures against a fresh postgres.

---

## Setup steps

> **Arch is not the upstream flow.** Docker's own docs tell you to run
> `dockerd-rootless-setuptool.sh install`. That script **does not exist on Arch** —
> `docker-rootless-extras` ships the systemd user units directly instead:
>
> ```
> /usr/bin/dockerd-rootless.sh
> /usr/lib/systemd/user/docker.service
> /usr/lib/systemd/user/docker.socket
> /usr/lib/sysctl.d/99-docker-rootless.conf
> ```
>
> So the setuptool step has nothing left to do — skip it and enable the unit.

```bash
# 1. Rootless extras (pulls rootlesskit; slirp4netns/fuse-overlayfs are optdeps we don't need)
omarchy pkg aur add docker-rootless-extras

# 2. Enable and start the per-user daemon (the unit is already on disk)
systemctl --user enable --now docker

# 3. Point the CLI at it — see Environment below.
#    Note: there is no `rootless` docker context to switch to. That context is
#    created by dockerd-rootless-setuptool.sh, which we never run. DOCKER_HOST
#    takes precedence over contexts anyway, so it is the only mechanism needed.
```

Neither `slirp4netns` nor `fuse-overlayfs` is required here: rootlesskit 3.1.0 has
`gvisor-tap-vsock` built in for networking, and kernel 7.1.9 gives native overlayfs
inside a user namespace.

### Environment

`development_assist/docker_compose_wrapper` already supports rootless — it opens with:

```bash
# A remote or rootless daemon is addressed through DOCKER_HOST, never sudo.
if [ -n "${DOCKER_HOST:-}" ]; then
    return 1
fi
```

That check keys off the **env var**, not the docker context, so `DOCKER_HOST` must be
exported for `make up` to skip the sudo path. Add to `~/.bashrc`:

```bash
export DOCKER_HOST="unix:///run/user/1000/docker.sock"
```

For the lazydocker keybinding (Super + Shift + D) — it targets `/var/run/docker.sock`,
and Hyprland keybind dispatchers do not read `.bashrc`. Add to
`~/.config/hypr/hyprland.lua`:

```lua
hl.env("DOCKER_HOST", "unix:///run/user/1000/docker.sock")
```

Then `hyprctl reload && hyprctl configerrors`.

**Caveat:** `hl.env` only seeds the environment Hyprland hands to processes it
spawns, and `hyprctl reload` does *not* re-export it into the already-running
compositor. The lazydocker keybinding picks `DOCKER_HOST` up only after a full
Hyprland restart (log out / back in).

---

## Verification checklist — completed 2026-08-28

- [x] `docker info` reports `rootless`; storage driver `overlayfs` (native, not
      fuse-overlayfs); Docker Root Dir `/home/dimitri0s/.local/share/docker`
- [x] `make up` runs with **no** sudo prompt and no "elevating with sudo" banner
- [x] postgres on `localhost:5432` — `pg_isready` → `accepting connections`
- [x] redis on `localhost:6379` — responds (`NOAUTH`, i.e. alive and still
      password-protected; `REDIS_URL` unchanged)
- [x] pgadmin on `localhost:5050` → HTTP 200, and `/pgadmin4/servers.json` is
      readable inside the container (bind mount survived uid mapping)
- [x] mailcrab UI on `localhost:1080` → HTTP 200; SMTP on `localhost:1025` →
      `220 mailcrab ESMTP`
- [x] Bare `docker exec … pg_dump` (the un-wrapped targets at `makefile:125,131,137`)
      exits 0 with no sudo prompt — rootless fixed them as predicted
- [x] Container names unchanged: `main_app-water_direct_postgresql-1` still valid
- [ ] `make django_runserver` → `http://localhost:8000` (host process, not retested —
      unaffected by the daemon switch)

Port forwarding and container egress were also smoke-tested with a throwaway nginx
container: `127.0.0.1:18080` → HTTP 200, and outbound HTTPS from inside the container
worked, so the built-in `gvisor-tap-vsock` driver is sufficient.

---

## Known caveats

- **Per-session daemon.** The user daemon stops on logout. Fine for on-demand dev with
  `restart: "no"`. If containers should outlive the session:
  `loginctl enable-linger $USER`.
- **Port-forward overhead.** Published-port traffic goes through rootlesskit's port
  forwarder. Not noticeable for local postgres/redis, but non-zero.
- **container → host is the direction that differs.** Rootful gives `172.17.0.1`;
  rootless routes through slirp4netns and `host-gateway` resolves elsewhere. None of the
  four current services call back to the host, so this does not bite today. It would
  matter if we later add something that needs to reach the dev server on 8000 (e.g. a
  webhook-replay container).

---

## Rollback

```bash
systemctl --user disable --now docker
# No `dockerd-rootless-setuptool.sh uninstall` on Arch, and no `rootless` context
# to switch away from — just drop the env vars:
#   - the DOCKER_HOST export in ~/.bashrc
#   - the hl.env line in ~/.config/hypr/hyprland.lua
sudo systemctl start docker.socket           # back to the root daemon + sudo
```

Rootless volume data stays in `~/.local/share/docker` and can be deleted with
`rootlesskit rm -rf ~/.local/share/docker` if a clean removal is wanted.
