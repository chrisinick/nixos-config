{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
    # Sort Gnome app grid
    ".config/autostart/sort-app-grid.desktop" = {
      text = ''
        [Desktop Entry]
        Name=SortAppGrid
        Type=Application
        Comment=Sorts the Gnome app grid alphabetically
        Exec=${pkgs.bash}/bin/bash -c "gsettings set org.gnome.shell app-picker-layout "[]""
        Terminal=false
        X-GNOME-Autostart-enabled=true
      '';
    };

    # Nautilus context menu: Compress mulithreaded
    ".local/share/nautilus/scripts/compress_multithreaded.sh" = {
      text = ''
        #!/usr/bin/env bash
        FILE="$1"
        tar -I 'xz -T0' -cf "$FILE.tar.xz" "$FILE"
        notify-send "Compression complete" "Compressed $FILE using multithreading."
      '';
      executable = true;
    };

    # Nautilus context menu: Decompress mulithreaded
    ".local/share/nautilus/scripts/decompress_multithreaded.sh" = {
      text = ''
        #!/usr/bin/env bash
        FILE="$1"
        if [[ "$FILE" == *.xz && "$FILE" != *.tar.xz ]]; then
            xz -d -T0 "$FILE"
            notify-send "Decompression Complete" "Decompressed $FILE using multithreading."
        elif [[ "$FILE" == *.tar.xz ]]; then
            tar --use-compress-program='xz -T0' -xvf "$FILE"
            notify-send "Extraction Complete" "Extracted $FILE using multithreading."
        else
            notify-send "Error" "Selected file is not a valid .xz or .tar.xz archive."
            exit 1
        fi
      '';
      executable = true;
    };

    # University VPN
    "scripts/university_vpn.sh" = {
      text = ''
        #!/usr/bin/env bash
        MTU=1284
        HIREPORT=${pkgs.openconnect}/libexec/openconnect/hipreport.sh
        DEADPEERSSECS=30
        IFACE=vpn0
        set +o histexpand
        sudo ${pkgs.openconnect}/bin/openconnect \
          --protocol gp \
          --syslog \
          --disable-ipv6 \
          --csd-wrapper $HIREPORT \
          --interface $IFACE \
          --mtu $MTU \
          --force-dpd $DEADPEERSSECS \
          vpn.ohmportal.de
      '';
      executable = true;
    };

    # Work VPN
    "scripts/work_vpn.sh" = {
      text = ''
        #!/usr/bin/env bash
        sudo ${pkgs.openvpn}/bin/openvpn --config /home/chris/vault/sync/arbeit/vpn/client-config.ovpn
      '';
      executable = true;
    };
  };
}
