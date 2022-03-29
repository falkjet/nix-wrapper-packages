{ pkgs }:
let
  previewer = ''
    cat $1
  '';
  previewerFile = pkgs.writeShellScript "preview" previewer
  config = with pkgs; ''
    set drawbox
    set icons
    set ifs "\n"
    set promptfmt " \033[38;5;39m%w"
    set scrolloff 10
    set shell "${pkgs.bash}/bin/bash"
    set shellopts "-eu"
    
    cmd delete ${"$"}${coreutils}/bin/rm -rf $fx
    cmd extract ${"$"}${atool}/bin/aunpack $f
    cmd mkdir %{{
      ${coreutils}/bin/echo -n "Enter directory name: "
      read fn
      ${coreutils}/bin/mkdir -p "$fn"
    }}
    
    cmd mkscript %{{
      ${coreutils}/bin/echo -n "Enter script name: "
      read fn
      ${coreutils}/bin/echo "#!/bin/sh" >> "$fn"
      ${coreutils}/bin/chmod +x "$fn"
    }}
    
    cmd mktexproject %{{
      echo -n "Enter project name: "
      read pn
      ${coreutils}/bin/mkdir "$pn"
      fn="$pn/$(${coreutils}/bin/basename "$pn").tex"
      name="$(getent passwd "$(${coreutils}/bin/whoami)" | cut -d: -f5)"
      ${coreutils}/bin/echo '\documentclass{article}' > "$fn"
      ${coreutils}/bin/echo "" >> "$fn"
      ${coreutils}/bin/echo "\\title{$(basename "$pn")}" >> "$fn"
      ${coreutils}/bin/echo "\\author{$name}" >> "$fn"
      ${coreutils}/bin/echo '\date{\today}' >> "$fn"
      ${coreutils}/bin/echo "" >> "$fn"
      ${coreutils}/bin/echo '\begin{document}' >> "$fn"
      ${coreutils}/bin/echo '    \maketitle' >> "$fn"
      ${coreutils}/bin/echo '\end{document}' >> "$fn"
    }}
    
    cmd open ${"$"}{{
      test -L $f && f=$(${coreutils}/bin/readlink -f $f)
      case $(${file}/bin/file --mime-type $f -b) in
        text/*) $EDITOR $fx;;
        *) for f in $fx; do setsid $OPENER $f > /dev/null 2> /dev/null & done;;
      esac
    }}
    
    cmd tar %${gnutar}/bin/tar -caf "$(${coreutils}/bin/basename $f)".tar.gz "$(${coreutils}/bin/basename $f)"
    cmd touch %{{
      ${coreutils}/bin/echo -n "Enter file name: "
      read fn
      ${coreutils}/bin/touch "$fn"
    }}
    
    map . set hidden!
    map <c-c> copy
    map <c-v> paste
    map <c-x> cut
    map <enter> shell
    map <esc> clear
    map X !$f
    map a
    map at tar
    map ax extract
    map d
    map dd delete
    map m
    map md mkdir
    map mf touch
    map ml mktexproject
    map ms mkscript
    map x ${"\$\$"}f
    
    set previewer ${previewerFile}
  '';
  configFile = pkgs.writeText "lfrc" config;
in
pkgs.runCommand "lf" {
  buildInputs = [ pkgs.makeWrapper ];
} ''
  mkdir $out
  ln -s ${pkgs.lf}/* $out
  rm $out/bin
  mkdir $out/bin
  ln -s ${pkgs.lf}/bin/* $out/bin
  rm $out/bin/lf
  makeWrapper ${pkgs.lf}/bin/lf $out/bin/lf \
    --add-flags "-config ${configFile}"
''
