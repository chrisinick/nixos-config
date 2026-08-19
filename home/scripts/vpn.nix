{
  config,
  pkgs,
  ...
}:
{
  home.file = {
    # University VPN
    ".local/bin/univpn" = {
      text = ''
        #!/usr/bin/env bash
        MTU=1284
        HIPREPORT=${pkgs.openconnect}/libexec/openconnect/hipreport.sh
        DEADPEERSSECS=30
        IFACE=vpn0
        set +o histexpand
        sudo ${pkgs.openconnect}/bin/openconnect \
          --protocol gp \
          --syslog \
          --disable-ipv6 \
          --csd-wrapper $HIPREPORT \
          --interface $IFACE \
          --mtu $MTU \
          --force-dpd $DEADPEERSSECS \
          vpn.ohmportal.de
      '';
      executable = true;
    };

    # Work VPN
    ".local/bin/workvpn" = {
      text = ''
        #!/usr/bin/env bash
        sudo ${pkgs.openvpn}/bin/openvpn --config ${config.home.homeDirectory}/sync/arbeit/vpn/client-config.ovpn
      '';
      executable = true;
    };
  };
}
