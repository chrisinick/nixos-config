{
  pkgs,
  ...
}:
{
  programs.vim = {
    enable = true;
    plugins = [ pkgs.vimPlugins.vim-wayland-clipboard ];
    settings = {
      hidden = true;
      ignorecase = true;
      smartcase = true;
      number = true;
      relativenumber = true;
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      copyindent = true;
    };

    extraConfig = ''
      set nobackup
      syntax enable
      set laststatus=3
      set shortmess+=I
      set backspace=indent,eol,start
      set incsearch
      nmap Q <Nop>
      set noerrorbells visualbell t_vb=
      set mouse+=a
      set nowrap
      set scrolloff=4
      set softtabstop=4
      filetype plugin indent on
      if has("clipboard")
        set clipboard=unnamedplus
      endif
    '';
  };
}
