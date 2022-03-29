{
  description = "Wrapper packages for programs i use";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  rec {
    packages.x86_64-linux.spacevim = import ./spacevim/default.nix {inherit pkgs; };
    packages.x86_64-linux.neovim = import ./neovim/default.nix { inherit pkgs; };
    packages.x86_64-linux.nvimpager = pkgs.nvimpager.override { neovim = packages.x86_64-linux.neovim; };
    packages.x86_64-linux.vscode = import ./vscode/default.nix { inherit pkgs; };
    packages.x86_64-linux.kitty = import ./kitty/default.nix { inherit pkgs; };
    packages.x86_64-linux.lf = import ./lf/default.nix { inherit pkgs; };
  };
}
