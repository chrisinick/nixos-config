# nixos-config

**My NixOS configuration**

## Properties

- f2fs, no swap
- systemd-boot, wayland, pipewire
- gnome, libadwaita
- basic bash, git, vim settings
- ghostty, zed, obsidian

## TODO

- firefox
- zotero

## Important commands

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

### Syncthing

Configure sync directories

### Firefox & Thunderbird

- Log in and go through settings
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

Seen notes in sync/arbeit/vpn/

### Warframe

Restore settings from sync/backup/warframe/

## License

This configuration is licensed under the [GPLv3](https://github.com/chrisinick/ideapad-mode/blob/master/LICENSE.txt) License.

The nixbuild.sh script is based on [No Boilerplate's rebuild script](https://github.com/0atman/noboilerplate/blob/main/scripts/38-nixos.md#dont-use-nix-env).
