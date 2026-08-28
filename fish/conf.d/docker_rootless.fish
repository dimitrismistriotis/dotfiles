# Rootless Docker: address the per-user daemon, never sudo.
#
# Lives in conf.d/ rather than config.fish for two reasons:
#   1. conf.d is sourced for *every* fish session; config.fish wraps its body in
#      `if status is-interactive`, so `fish -c 'make up'` would miss this.
#   2. conf.d is machine-local — link_fish_files only manages config.fish and
#      functions/ — and this socket path is specific to this host.
#
# Set unconditionally (not guarded on the socket existing) so a stopped daemon
# reports "cannot connect ... /run/user/<uid>/docker.sock" instead of silently
# falling back to the root daemon at /var/run/docker.sock.

if set -q XDG_RUNTIME_DIR
    set -gx DOCKER_HOST "unix://$XDG_RUNTIME_DIR/docker.sock"
else
    set -gx DOCKER_HOST "unix:///run/user/"(id -u)"/docker.sock"
end
