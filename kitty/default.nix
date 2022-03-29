{ pkgs, configFile ? ./kitty.conf }:
pkgs.runCommand "kitty" {
  buildInputs = [ pkgs.makeWrapper ];
  inherit configFile;
} ''
  mkdir $out
  ln -s ${pkgs.kitty}/* $out
  rm $out/bin
  mkdir $out/bin
  ln -s ${pkgs.kitty}/bin/* $out/bin
  rm $out/bin/kitty
  makeWrapper ${pkgs.kitty}/bin/kitty $out/bin/kitty \
    --add-flags "-c $configFile"
''
