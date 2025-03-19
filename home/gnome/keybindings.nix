{
  config,
  lib,
  pkgs,
  ...
}:
{
  dconf.settings."org/gnome/desktop/wm/keybindings" = {
    maximize = [ "<Super>Up" ];
    move-to-monitor-down = [ "<Super><Shift>Down" ];
    move-to-monitor-left = [ "<Shift><Super>Left" ];
    move-to-monitor-right = [ "<Super><Shift>Right" ];
    move-to-monitor-up = [ "<Super><Shift>Up" ];
    move-to-workspace-1 = [ "<Alt><Super>1" ];
    move-to-workspace-2 = [ "<Alt><Super>2" ];
    move-to-workspace-3 = [ "<Alt><Super>3" ];
    move-to-workspace-4 = [ "<Alt><Super>4" ];
    move-to-workspace-5 = [ "<Alt><Super>5" ];
    move-to-workspace-6 = [ "<Alt><Super>6" ];
    move-to-workspace-7 = [ "<Alt><Super>7" ];
    move-to-workspace-8 = [ "<Alt><Super>8" ];
    move-to-workspace-9 = [ "<Alt><Super>9" ];
    move-to-workspace-10 = [ "<Alt><Super>0" ];
    move-to-workspace-last = [ "<Alt><Super>ssharp" ];
    move-to-workspace-up = [ "<Alt><Super>Up" ];
    move-to-workspace-down = [ "<Alt><Super>Down" ];
    move-to-workspace-left = [ "<Alt><Super>Left" ];
    move-to-workspace-right = [ "<Alt><Super>Right" ];
    switch-to-workspace-1 = [ "<Primary><Super>1" ];
    switch-to-workspace-2 = [ "<Primary><Super>2" ];
    switch-to-workspace-3 = [ "<Primary><Super>3" ];
    switch-to-workspace-4 = [ "<Primary><Super>4" ];
    switch-to-workspace-5 = [ "<Primary><Super>5" ];
    switch-to-workspace-6 = [ "<Primary><Super>6" ];
    switch-to-workspace-7 = [ "<Primary><Super>7" ];
    switch-to-workspace-8 = [ "<Primary><Super>8" ];
    switch-to-workspace-9 = [ "<Primary><Super>9" ];
    switch-to-workspace-10 = [ "<Primary><Super>0" ];
    switch-to-workspace-last = [ "<Primary><Super>ssharp" ];
    switch-to-workspace-up = [ "<Primary><Super>Up" ];
    switch-to-workspace-down = [ "<Primary><Super>Down" ];
    switch-to-workspace-left = [ "<Primary><Super>Left" ];
    switch-to-workspace-right = [ "<Primary><Super>Right" ];
  };
}
