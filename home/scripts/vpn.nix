{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.file = {
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
