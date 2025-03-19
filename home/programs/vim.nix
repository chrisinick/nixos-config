{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.vim = {
    enable = true;
    plugins = [ pkgs.vimPlugins.vim-wayland-clipboard ];
    settings = {
      copyindent = true;
      expandtab = true;
      hidden = true;
      ignorecase = true;
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      smartcase = true;
    };
    extraConfig = ''
      set nocompatible
      set nobackup
      syntax enable
      set laststatus=2
      set shortmess+=I
      set backspace=indent,eol,start
      set incsearch
      nmap Q <Nop>
      set noerrorbells visualbell t_vb=
      set mouse+=a
      filetype plugin indent on
      if has("clipboard")
        set clipboard=unnamedplus
      endif
    '';
  };
}
