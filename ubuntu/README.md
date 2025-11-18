# Dotfiles - Ubuntu

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
