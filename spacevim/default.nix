{pkgs}: 
pkgs.spacevim.override {
  spacevim_config = import ./init.nix;
}