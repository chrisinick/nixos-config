{
  pkgs,
  ...
}:
{
  programs.zathura = {
    enable = false;
    options = {
      synctex = true;
      "synctex-editor-command" = "${pkgs.zed-editor}/bin/zeditor %{input}:%{line}";
    };
  };
}
