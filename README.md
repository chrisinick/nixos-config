# nixos-config

**My NixOS configuration (wip)**

## Properties

- f2fs, no swap
- systemd-boot, wayland, pipewire
- gnome, libadwaita
- basic bash, git, vim settings
- rust
- ghostty, zed, obsidian

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

## Must be done manually still

### Gnome settings

- Turn on night light
- Set up keyboard shortcuts for launching apps
- Turn on active screen edges
- Dynamic workspaces
- Workspaces only on primary screen
- Select refresh rate
- Set default apps

### Thunderbird

- Set up email accounts
- Install extension
- Configure settings

## TODO

- latex
- vpn
- osbidian
- refactor configs
- rewrite script (stage and unstage)

## License

This configuration is licensed under the [GPLv3](https://github.com/chrisinick/ideapad-mode/blob/master/LICENSE.txt) License.

The nixbuild.sh script is based on [No Boilerplate's rebuild script](https://github.com/0atman/noboilerplate/blob/main/scripts/38-nixos.md#dont-use-nix-env).

