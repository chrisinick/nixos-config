# nixos-config

**My NixOS configuration**

- ext4, no swap (with disko)
- systemd-boot, wayland, pipewire
- gnome
- fish, git, vim settings
- ghostty, zed

## TODO

- rclone filen setup
- apparmor?
- add rollback command to readme
- secure boot
- disk encryption
- auto hybernate from suspend
- cosmic de
- zram / zswap
- doom emacs (+ obsidian like brain)

## rclone notes

`~/.config/rclone`

```bash
--track-renames to recognize this as a rename instead of deleting/re-uploading everything

--check-access as safeguards: RCLONE_TEST files must exist in exact locations

--resilient --recover --max-lock 2m --conflict-resolve newer

--create-empty-src-dirs look up later
```

## Installation

1. Boot from nixos live iso
2. Run these commands in the console:

### chris-laptop

```bash
sudo loadkeys de
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de')]"
sudo nix --extra-experimental-features 'nix-command flakes' run 'github:nix-community/disko/latest' -- --write-efi-boot-entries --mode destroy,format,mount --flake 'github:chrisinick/nixos-config#chris-laptop'
sudo nixos-install --no-update-lock-file --flake 'github:chrisinick/nixos-config#chris-laptop'
sudo nixos-enter --root /mnt -c 'passwd chris'
```

### chris-desktop

```bash
sudo loadkeys de
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'de')]"
sudo nix --extra-experimental-features 'nix-command flakes' run 'github:nix-community/disko/latest' -- --write-efi-boot-entries --mode destroy,format,mount --flake 'github:chrisinick/nixos-config#chris-desktop'
sudo nixos-install --no-update-lock-file --flake 'github:chrisinick/nixos-config#chris-desktop'
sudo nixos-enter --root /mnt -c 'passwd chris'
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

### Chromium

- Import bookmarks (from sync/arbeit/chromium_lesezeichen/)
- Go through the settings

### Gnome

- Turn on night light
- Set up keyboard shortcuts for launching apps
- Turn on active screen edges
- Dynamic workspaces
- Workspaces only on primary screen
- Select refresh rate
- Set default apps

### Remmina

See notes in sync/arbeit/vpn/

### Warframe

Restore settings from sync/backup/warframe/

## License

This configuration is licensed under the [GPLv3](https://github.com/chrisinick/ideapad-mode/blob/master/LICENSE.txt) License.

The nixbuild.sh script is based on [No Boilerplate's rebuild script](https://github.com/0atman/noboilerplate/blob/main/scripts/38-nixos.md#dont-use-nix-env).
