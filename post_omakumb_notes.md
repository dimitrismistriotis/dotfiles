# Post Omakumb Notes

Repository: <https://github.com/basecamp/omakub>

## Extensions Installed and Description

Source: <https://github.com/basecamp/omakub/blob/master/install/desktop/set-gnome-extensions.sh>

```shell
gext install tactile@lundal.io
gext install just-perfection-desktop@just-perfection
gext install blur-my-shell@aunetx
gext install space-bar@luchrioh
gext install undecorate@sun.wxg@gmail.com
gext install tophat@fflewddur.github.io
gext install AlphabeticalAppGrid@stuarthayhurst
```

In detail, order maintained from above:

### Tactile

> Tile windows on a custom grid using your keyboard. Type Super-T to show the grid, then type two tiles (or the same tile twice) to move the active window.

<https://extensions.gnome.org/extension/4548/tactile/>

**Comment**: Keep

### Just Perfection

> Tweak Tool to Customize GNOME Shell, Change the Behavior and Disable UI Elements

<https://extensions.gnome.org/extension/3843/just-perfection/>, <https://gitlab.gnome.org/jrahmatzadeh/just-perfection>

```
# Configure Just Perfection
gsettings set org.gnome.shell.extensions.just-perfection animation 2
gsettings set org.gnome.shell.extensions.just-perfection dash-app-running true
gsettings set org.gnome.shell.extensions.just-perfection workspace true
gsettings set org.gnome.shell.extensions.just-perfection workspace-popup false
```

**Comment**: Really like "Blur My Windows" so this one might go off or reconfigured

```shell
gsettings set org.gnome.shell.extensions.just-perfection animation 6
# or
gsettings set org.gnome.shell.extensions.just-perfection animation 7
```

### Blur my Shell

> Adds a blur look to different parts of the GNOME Shell, including the top panel, dash and overview.

<https://extensions.gnome.org/extension/3193/blur-my-shell/>, <https://github.com/aunetx/blur-my-shell>

**Comment**: Keep / ? / Does not matter

```
# Configure Blur My Shell
gsettings set org.gnome.shell.extensions.blur-my-shell.appfolder blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.lockscreen blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.screenshot blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.window-list blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.panel blur false
gsettings set org.gnome.shell.extensions.blur-my-shell.overview blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.overview pipeline 'pipeline_default'
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock brightness 0.6
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock sigma 30
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock static-blur true
gsettings set org.gnome.shell.extensions.blur-my-shell.dash-to-dock style-dash-to-dock 0
```

### Space Bar

> Replaces the top-panel workspace indicator with an i3-like workspaces bar.

<https://extensions.gnome.org/extension/5090/space-bar/>

**Comment**: Does not seem necessary

### Undecorate Window

> Add undecorate item in window menu. Use ALT+Space to show window menu.

<https://extensions.gnome.org/extension/1208/undecorate/>

**Comment**: Keep


### TopHat

> TopHat aims to be an elegant system resource monitor for the GNOME shell. It displays CPU, memory, disk, and network activity in the GNOME top bar.

<https://extensions.gnome.org/extension/5219/tophat/>

**Comment**: Keep

### Alphabetical App Grid

> Alphabetically order the app grid and folders

<https://extensions.gnome.org/extension/4269/alphabetical-app-grid/>

**Comment**: Keep


### Extensions Removed and Description

```shell
gnome-extensions disable tiling-assistant@ubuntu.com
gnome-extensions disable ubuntu-appindicators@ubuntu.com
gnome-extensions disable ubuntu-dock@ubuntu.com
gnome-extensions disable ding@rastersoft.com
```

In detail, order maintained from above:

### Tiling Assistant

> Expand GNOME's 2 column tiling and add a Windows-snap-assist-inspired popup...

<https://extensions.gnome.org/extension/3733/tiling-assistant/>

**Comment**: As is

### Ubuntu AppIndicators

> This a mock extension. It does nothing if installed from extensions.gnome.org. Please use KStatusNotifierItem/AppIndicator Support which provides the same functionalities. This name is used to protect and reserve the name for ubuntu appindicator, available as a system extension on ubuntu. This allow us to not trump updates outside of our QA process via an external upload.

<https://extensions.gnome.org/extension/1301/ubuntu-appindicators/>

**Comment**: If removed stay removed

### Ubuntu Dock

> This a mock extension. It does nothing if installed from extensions.gnome.org. Please use dash to dock which provides the same functionalities with different defaults. This name is used to protect and reserve the name for ubuntu dock, available as a system extension on ubuntu. This allow us to not trump updates outside of our QA process via an external upload.

<https://extensions.gnome.org/extension/1300/ubuntu-dock/>

**Comment**: If removed stay removed

### Desktop Icons NG (DING)

> Adds icons to the desktop. Fork of the original Desktop Icons extension, with several enhancements.

<https://extensions.gnome.org/extension/2087/desktop-icons-ng-ding/>

**Comment**: Stay removed

