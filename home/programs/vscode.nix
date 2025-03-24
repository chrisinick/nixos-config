{
  config,
  lib,
  pkgs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;

    extensions = with pkgs.vscode-extensions; [
      vscode-icons-team.vscode-icons
      eamodio.gitlens
      asvetliakov.vscode-neovim

      davidanson.vscode-markdownlint
      james-yu.latex-workshop

      bbenoist.nix
      rust-lang.rust-analyzer
      ms-python.python
    ];

    userSettings = {
      "telemetry.telemetryLevel" = "off";
      "editor.formatOnSave" = true;
      "editor.inlineSuggest.enabled" = true;

      "files.trimTrailingWhitespace" = true;
      "files.trimFinalNewlines" = true;
      "files.insertFinalNewline" = true;

      "terminal.external.linuxExec" = "ghostty";
      "terminal.integrated.drawBoldTextInBrightColors" = false;

      "update.mode" = "manual";
    };
  };
}
