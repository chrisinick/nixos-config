{
  ...
}:
{
  # Settings
  programs.rclone.enable = true;

  # Filters
  home.file.".config/rclone/filters.txt".text = ''
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
}
