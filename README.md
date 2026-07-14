# Dotfiles

## Checkout

Whenever needed, as some paths can only be hardcoded, assumes that it is cloned in the home directory.

```shell
cd ~
git clone git@github.com:dimitrismistriotis/dotfiles.git
```

then use `make` to see list of customisations and apply those you want/need.

## Suggestions

[Modern Unix](https://github.com/ibraheemdev/modern-unix)


### Cloudflare DNS

See: <https://developers.cloudflare.com/1.1.1.1/ip-addresses/>

### HDMI Configuration

Reference: <https://ewinnington.github.io/posts/omarchy-hdmi-audio>

```shell
pactl set-card-profile alsa_card.pci-0000_00_1f.3 output:hdmi-stereo
pactl set-default-sink alsa_output.pci-0000_00_1f.3.hdmi-stereo
```

## Flutter - To codify

```shell
  mkdir -p ~/development && cd ~/development
  git clone https://github.com/flutter/flutter.git -b stable
```

```shell
yay -S android-sdk-cmdline-tools-latest
```

```
You need to source /etc/profile or relogin to add Android SDK Command-line Tools (latest) to your path.
Optional dependencies for android-sdk-cmdline-tools-latest
    android-sdk-platform-tools: adb, aapt, aidl, dexdump and dx
    android-udev: udev rules for Android devices
```



```
1. Environment variables

Add to ~/.bashrc (or ~/.profile):

export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"

ANDROID_HOME is the modern var; ANDROID_SDK_ROOT is kept for older tooling. platform-tools isn't installed yet (that's adb), but it's harmless on the PATH and will work once you install it.

2. Make the SDK writable (so sdkmanager can install into /opt)

The directory is owned by root, so sdkmanager --install will fail with permission errors. The Arch-recommended fix uses a group + ACLs:

sudo groupadd -f android-sdk
sudo gpasswd -a "$USER" android-sdk
sudo chown -R :android-sdk /opt/android-sdk
sudo chmod -R g+rwx /opt/android-sdk
# make new files inherit the group + perms
sudo setfacl -R -d -m g:android-sdk:rwX /opt/android-sdk
sudo setfacl -R -m g:android-sdk:rwX /opt/android-sdk

Then log out and back in (or run newgrp android-sdk) for the group to take effect.

3. Verify + first packages

sdkmanager --list                       # should run without permission errors
sdkmanager --licenses                    # accept licenses
sdkmanager "platform-tools"  "platforms;android-36" "build-tools;36.0.0"
```
