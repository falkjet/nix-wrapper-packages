{ pkgs }:
pkgs.neovim.override {
  configure = {
    customRC = builtins.readFile ./init.vim;
    packages.myPackages = with pkgs.vimPlugins; {
      start = [
        vim-airline
        vim-airline-themes
        vim-nix
        onedark-vim
        onedarkpro-nvim
        vimtex
        ctrlp-vim
        coc-nvim
        coc-python
        coc-emmet
        coc-vimtex
        coc-tsserver
        gitsigns-nvim
        fzf-vim
        nerdtree
        toggleterm-nvim
      ];
      opt = [];
    };
  };
}
