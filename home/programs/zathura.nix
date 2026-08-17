{
  pkgs,
  ...
}:
{
  programs.zathura = {
    enable = true;
    options = {
      synctex = true;
      "synctex-editor-command" = "${pkgs.zed-editor}/bin/zeditor %{input}:%{line}";
    };
  };
}
