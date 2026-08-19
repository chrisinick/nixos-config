{
  config,
  pkgs,
  ...
}:
let
  logPath = ".local/state/rclone/bisync.log";
  filtersPath = ".config/rclone/filters.txt";
in
{
  programs.rclone.enable = true;

  # Automatic sync
  systemd.user.timers."rclone-bisync" = {
    Timer = {
      OnBootSec = "1m";
      OnUnitActiveSec = "15m";
      Unit = "rclone-bisync.service";
    };
  };
  systemd.user.services."rclone-bisync" = {
    Unit.After = [ "network-online.target" ];
    Service = {
      Type = "oneshot";
      ExecStart = ''
        ${pkgs.rclone}/bin/rclone bisync \
        filen:sync \
        ${config.home.homeDirectory}/sync \
        --quiet \
        --resilient \
        --recover \
        --max-lock 2m \
        --conflict-resolve newer \
        --create-empty-src-dirs \
        --track-renames \
        --check-access \
        --filters-file ${config.home.homeDirectory}/${filtersPath} \
        --log-file ${config.home.homeDirectory}/${logPath}
      '';
    };
  };

  # Rclone Web GUI
  systemd.user.services."rclone-gui" = {
    Unit.After = [ "network-online.target" ];
    Service = {
      ExecStart = "${pkgs.rclone}/bin/rclone gui --addr 127.0.0.1:5572 --no-open-browser";
      Restart = "on-failure";
      RestartSec = 5;
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

  home.file = {
    # bisync script which is in PATH ("filsy" = filen sync)
    ".local/bin/filsy" = {
      text = ''
        #!/usr/bin/env bash
        ${pkgs.rclone}/bin/rclone bisync \
        filen:sync \
        ${config.home.homeDirectory}/sync \
        --resilient \
        --recover \
        --max-lock 2m \
        --conflict-resolve newer \
        --create-empty-src-dirs \
        --track-renames \
        --check-access \
        --filters-file ${config.home.homeDirectory}/${filtersPath}
      '';
      executable = true;
    };

    ".local/state/rclone/bisync.log".text = "";

    # Filters
    ".config/rclone/filters.txt".text = ''
      - System Volume Information/
      - .Spotlight-V100/
      - .Trashes/
      - .fseventsd/
      - lost+found/
      - .Trash-*/
      - .Trash/
      - .thumbnails/
      - .cache/
      - __pycache__/
      - target/
      - node_modules/
      - .npm/
      - .yarn/cache/
      - .pnpm-store/
      - bin/
      - obj/
      - .vs/
      - TestResults/
      - .typst-cache/
      - .direnv/
      - .devenv/
      - .DS_Store
      - .AppleDouble
      - .LSOverride
      - Thumbs.db
      - ehthumbs.db
      - Desktop.ini
      - *.tmp
      - *.temp
      - *.swp
      - *.swo
      - *~
      - *.part
      - *.crdownload
      - *.download
      - *.pyc
      - *.aux
      - *.toc
      - *.lof
      - *.lot
      - *.out
      - *.fls
      - *.fdb_latexmk
      - *.synctex.gz
      - *.bcf
      - *.run.xml
      - *.bbl
      - *.blg
      - *.nav
      - *.snm
      - *.vrb
      - *.typst
    '';
  };
}
