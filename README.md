# nixos-config

- ext4, no swap (with disko)
- systemd-boot, wayland, pipewire
- gnome
- fish, git, vim settings
- ghostty, zed

## TODO

- add rollback command to readme
- apparmor?
- secure boot
- disk encryption
- auto hybernate from suspend
- cosmic de
- zram / zswap
- doom emacs (+ obsidian like brain)

## Installation

1. Boot from nixos live iso
2. Run the following commands:

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

3. Place the nixos sops private key into /home/chris/.config/sops/age/keys.txt
4. Set up rclone: `mkdir /home/chris/sync; rclone config`

## Rclone bisync

### Rclone initial sync

(run with --dry-run first)

```bash
rclone bisync filen:sync /home/chris/sync --resync --dry-run --resilient --recover --max-lock 2m --conflict-resolve newer --create-empty-src-dirs --filters-file /home/chris/.config/rclone/filters.txt
```

### Rclone recurring sync

```bash
rclone bisync /home/chris/sync filen:sync --resilient --recover --max-lock 2m --conflict-resolve newer --create-empty-src-dirs --track-renames --check-access --filters-file /home/chris/.config/rclone/filters.txt
```

## Usage

Use nixswitch.sh and nixbuild.sh scripts!

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

## Must be configured manually

### Firefox & Thunderbird

- Go through the settings
- Add ublock filters

### Gnome

- Display settings
- Night light
- Keyboard shortcuts for launching apps
- Default apps

### Chromium

- Import bookmarks (from sync)
- Go through the settings

### Remmina

See notes in sync

### Warframe

Restore settings from sync/backup/warframe/

## License

This configuration is licensed under the [GPLv3](https://github.com/chrisinick/ideapad-mode/blob/master/LICENSE.txt) License.

The nixbuild.sh script is based on [No Boilerplate's rebuild script](https://github.com/0atman/noboilerplate/blob/main/scripts/38-nixos.md#dont-use-nix-env).
