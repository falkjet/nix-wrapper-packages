{
  custom_plugins = [
    {
      merged = false;
      name = "lilydjwg/colorizer";
    }
  ];
  layers = [
    { name = "default"; }
    {
      enable = true;
      name = "colorscheme";
    }
    { name = "fzf"; }
    {
      default_height = 30;
      default_position = "bottom";
      name = "shell";
    }
    { name = "edit"; }
    { name = "VersionControl"; }
    { name = "git"; }
    {
      auto-completion-return-key-behavior = "complete";
      auto-completion-tab-key-behavior = "cycle";
      autocomplete_method = "coc";
      name = "autocomplete";
    }
    { name = "lang#nix"; }
    { name = "lang#javascript"; }
    { name = "lang#python"; }
    { name = "lang#sh"; }
    { name = "lang#html"; }
    { name = "sudo"; }
    { name = "lang#markdown"; }
    { name = "ctrlspace"; }
  ];
  options = {
    buffer_index_type = 4;
    colorscheme = "onedark";
    colorscheme_bg = "dark";
    enable_guicolors = true;
    enable_statusline_mode = true;
    enable_tabline_filetype_icon = true;
    statusline_separator = "fire";
    timeoutlen = 500;
  };
}
