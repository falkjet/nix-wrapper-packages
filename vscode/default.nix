
{pkgs}:
pkgs.vscode-with-extensions.override {
  vscodeExtensions = with pkgs.vscode-extensions; [
    dracula-theme.theme-dracula
    bungcip.better-toml
    ms-vscode.cpptools
    graphql.vscode-graphql
    ms-toolsai.jupyter
    james-yu.latex-workshop
    pkief.material-icon-theme
    bbenoist.nix
    esbenp.prettier-vscode
    ms-python.python
    ms-python.vscode-pylance
  ]
  ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    {
      name = "es7-react-js-snippets";
      publisher = "dsznajder";
      version = "4.4.3";
      sha256 = "QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";
    }
    {
      name = "live-sass";
      publisher = "ritwickdey";
      version = "3.0.0";
      sha256 = "giC9Z2UgI1wGND0Lpo4r0X8oSKdq7St0SHqcbKL7u0I=";
    }
    {
      name = "LiveServer";
      publisher = "ritwickdey";
      version = "5.7.5";
      sha256 = "rKe746kwXoJx46K7+beBrjTPUCt8IgyeGg7okCW60ik=";
    }
    {
      name = "sass-indented";
      publisher = "Syler";
      version = "1.8.19";
      sha256 = "CHv4MbcqGqoJOkw4haR2jW8yl3PLiJKQ0OnISEutEhY=";
    }
    {
      name = "volar";
      publisher = "johnsoncodehk";
      version = "0.33.10";
      sha256 = "8Ydr64O59GxFrkJLdOImoNRce35LiWPbHQqf8E0doUE=";
    }
  ];
}
