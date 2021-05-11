{ config, pkgs, ...  }:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    viAlias = true;
    extraConfig = ''
      colorscheme gruvbox
      highlight ColorColumn ctermbg=0 guibg=lightgrey
      set background=dark
      set clipboard=unnamedplus
      set colorcolumn=80
      set cursorline
      set expandtab
      set nowrap
      set nu rnu
      set shiftwidth=2
      set smartcase
      set smartindent
      set splitbelow
      set splitright
      set tabstop=2 softtabstop=2
      syntax on
    '';
    plugins = [
      pkgs.vimPlugins.gruvbox
      pkgs.vimPlugins.vim-nix
    ];
  };
}
