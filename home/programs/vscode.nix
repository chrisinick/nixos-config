{
  ...
}:
{
  programs.vscode = {
    enable = true;

    profiles.default = {
      #extensions = with pkgs.vscode-extensions; [];

      userSettings = {
        telemetry = {
          enableCrashReporter = false;
          enableTelemetry = false;
          telemetryLevel = "off";
        };
        update.mode = "none";
        extensions = {
          autoUpdate = false;
          autoCheckUpdates = false;
        };
        workbench = {
          startupEditor = "none";
          tips.enabled = false;
        };
      };
    };
  };
}
