{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-python.vscode-pylance
      ];

      userSettings = {
        "telemetry.enableCrashReporter" = false;
        "telemetry.enableTelemetry" = false;
        "telemetry.telemetryLevel" = "off";
        "update.mode" = "none";
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;

        "workbench.startupEditor" = "none";
        "workbench.tips.enabled" = false;
        "workbench.colorTheme" = "Default Light Modern";

        "python.pythonPath" = "${pkgs.python3}/bin/python3";
        "python.jediEnabled" = false;
        "python.languageServer" = "Pylance";
      };
    };
  };
}
