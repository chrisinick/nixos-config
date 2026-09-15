# nixos-config

## TODO

- cosmic de
- nh

## Installation & Setup

1. Boot from nixos live iso
2. Generate new hardware config if necessary (without partitioning)
3. Run the following commands:

chris-laptop:

```bash
sudo loadkeys de
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de')]"
sudo nix --extra-experimental-features 'nix-command flakes' run 'github:nix-community/disko/latest' -- --write-efi-boot-entries --mode destroy,format,mount --flake 'github:chrisinick/nixos-config#chris-laptop'
sudo nixos-install --no-update-lock-file --flake 'github:chrisinick/nixos-config#chris-laptop'
sudo nixos-enter --root /mnt -c 'passwd chris'
```

chris-desktop:

```bash
sudo loadkeys de
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de')]"
sudo nix --extra-experimental-features 'nix-command flakes' run 'github:nix-community/disko/latest' -- --write-efi-boot-entries --mode destroy,format,mount --flake 'github:chrisinick/nixos-config#chris-desktop'
sudo nixos-install --no-update-lock-file --flake 'github:chrisinick/nixos-config#chris-desktop'
sudo nixos-enter --root /mnt -c 'passwd chris'
```

4. Reset and enable secure boot in bios
5. Boot into the installed system
6. Enroll policy for measured boot:

```bash
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-with-pin=true --tpm2-pcrlock=/var/lib/systemd/pcrlock.json /dev/disk/by-partlabel/disk-main-luks
```

7. Enroll fingerprint (on chris-laptop):

```bash
fprintd-enroll
```

8. Set up rclone (name = filen, type = filen):

```bash
rclone config
```

9. Do the initial rclone bisync run:

```bash
mkdir -p /home/chris/sync /home/chris/.local/state/rclone
rclone bisync filen:sync /home/chris/sync --resync --resilient --recover --max-lock 2m --conflict-resolve newer --create-empty-src-dirs --filters-file /home/chris/.config/rclone/filters.txt
```

## Usage

Use nixswitch.sh and nixbuild.sh scripts!

### Rclone

bisync with filen:

```bash
filsy
```

web gui:

```bash
rclone gui
```

### Collect garbage

```bash
sudo nix-collect-garbage -d
```

### Update

```bash
nix flake update
```

### Rebuild

```bash
sudo nixos-rebuild switch --flake .
```

### Rollback

```bash
sudo nixos-rebuild switch --rollback
```

### Nix flake templates

```bash
nix flake show templates
```

```bash
nix flake init -t templates#full
```

## License

This configuration is licensed under the [GPLv3](https://github.com/chrisinick/ideapad-mode/blob/master/LICENSE.txt) License.
