{
  ...
}:
let
  wallpaper-uri = "https://i.imgur.com/Wt0PphP.jpeg";
in
{
  imports = [
    ./keybindings.nix
  ];

  dconf = {
    enable = true;
    settings = {
      # Interface
      "org/gnome/desktop/interface" = {
        clock-format = "24h";
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        enable-hot-corners = false;
        gtk-theme = "adw-gtk3-dark";
        show-battery-percentage = true;
        text-scaling-factor = 1.12;
      };
      "org/gnome/desktop/calendar".show-weekdate = true;
      "org/gnome/desktop/datetime".automatic-timezone = true;
      "org/gnome/mutter".center-new-windows = true;

      # Wallpaper
      "org/gnome/desktop/background" = {
        picture-uri = wallpaper-uri;
        picture-uri-dark = wallpaper-uri;
      };
      "org/gnome/desktop/screensaver".picture-uri = wallpaper-uri;

      # Default apps
      "org/gnome/desktop/default-applications/office/calendar".exec = "evolution -c calendar";
      "org/gnome/desktop/default-applications/office/calendar".needs-term = false;
      "org/gnome/desktop/default-applications/office/tasks".exec = "evolution -c tasks";
      "org/gnome/desktop/default-applications/office/tasks".needs-term = false;
      "org/gnome/desktop/default-applications/terminal".exec = "ghostty";
      "org/gnome/desktop/default-applications/terminal".exec-arg = "";

      # Peripherals
      "org/gnome/desktop/peripherals/mouse" = {
        accel-profile = "flat";
        speed = -0.22;
      };

      # Privacy
      "org/gnome/desktop/privacy" = {
        recent-files-max-age = 30;
        remember-recent-files = false;
        remove-old-temp-files = true;
        remove-old-trash-files = true;
      };

      # Sound
      "org/gnome/desktop/sound" = {
        event-sounds = false;
        input-feedback-sounds = false;
      };
      "org/gnome/desktop/wm/preferences" = {
        audible-bell = false;
      };

      # Shell settings
      "org/gnome/shell" = {
        allow-extension-installation = false;
        disable-user-extensions = true;
        favorite-apps = [
          "firefox.desktop"
          "thunderbird.desktop"
          "tutanota-desktop.desktop"
          "com.mitchellh.ghostty.desktop"
          "org.gnome.Nautilus.desktop"
          "startcenter.desktop"
          "obsidian.desktop"
          "dev.zed.Zed.desktop"
          "code.desktop"
          "org.gnome.TextEditor.desktop"
          "signal.desktop"
          "discord.desktop"
        ];
        automatic-location = false;
      };
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita";
  };
}
