# Dotfiles

## Checkout

Whenever needed, as some paths can only be hardcoded, assumes that it is cloned in the home directory.

```shell
cd ~
git clone git@github.com:dimitrismistriotis/dotfiles.git
```

then use `make` to see list of customisations and apply those you want/need.

## Adding a Second Passphrase on Ubuntu drive

<https://askubuntu.com/questions/1296411/add-second-passphrase-for-fde-on-ubuntu-new-luks-keyslot-w-encrypted-lvm>

From Brave Search:

> Add Decryption Passphrase

> To add a second passphrase to an existing LUKS-encrypted disk on Ubuntu, you can use the cryptsetup command. First, inspect the drive to note which key slots are in use:
> `cryptsetup luksDump /dev/nvme0n1p3`
>
> Then, add a second passphrase to a specific key slot, such as slot 1:
>
> `cryptsetup --key-slot 1 luksAddKey /dev/nvme0n1p3`
>
> This will allow you to decrypt the disk using either the original passphrase or the new one. By default, LUKS supports up to eight key slots, so you can add up to seven more passphrases if needed.
>
> Before making changes, it is recommended to back up the existing LUKS header:
>
> `cryptsetup --header-backup-file header_backup luksHeaderBackup /dev/nvme0n1p3`
>
> This ensures that you have a backup in case something goes wrong during the passphrase change process.
>
> Make sure to keep your new passphrase secure and stored in a safe place.


## Links - Suggestions

[Modern Unix](https://github.com/ibraheemdev/modern-unix)

### Wallpapers

Lots from <https://www.wallpaperflare.com/> lately.
Did not find an easy way to write a download script to automate scrapping them.

### Other Software

#### VSCodium

VSCodium is a community-driven, freely-licensed binary distribution of Microsoft’s editor VS Code.

<https://vscodium.com/>

## Attribution

Background image for WezTerm:

<https://www.freepik.com/free-vector/gradient-particle-wave-background_45176454.htm>

## Next Steps - Ongoing

- Organise `Makefile` to allow actions to happen in sequence
- Moce `initialize` commands to `Makefile`
