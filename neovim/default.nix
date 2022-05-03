{ pkgs }:
let
  vim-svelte-plugin = pkgs.vimUtils.buildVimPlugin {
    name = "vim-svelte-plugin";
    src = pkgs.fetchFromGitHub {
      owner = "leafOfTree";
      repo = "vim-svelte-plugin";
      rev = "76c3a1897dbc3953d95760612c3eed4bef89e8fc";
      sha256 = "sha256-HisEoY3IF+mU64aAFmAMfEsot9lOYad9enoYR9+Bae4=";
    };
  };
  rcfile = with pkgs; substituteAll {
    src = ./init.vim;
    inherit evince;
  };
in
pkgs.neovim.override {
  configure = {
    customRC = builtins.readFile rcfile;
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
        vim-svelte-plugin
        markdown-preview-nvim
        coc-pairs
      ];
      opt = [];
    };
  };
}
