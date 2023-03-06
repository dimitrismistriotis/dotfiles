# Codium Settings

https://stackoverflow.com/questions/35773299/how-can-you-export-the-visual-studio-code-extension-list/37189011#37189011

```
code --list-extensions | xargs -L 1 echo code --install-extension
```

Run first one only

```
codium --list-extensions > installed_extensions.txt
```

Settings

```shell
cp ~/.config/VSCodium/User/settings.json .
```

