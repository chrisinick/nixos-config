{
  ...
}:
let
  localsendPort = 53317;
in
{
  networking.firewall.allowedTCPPorts = [ localsendPort ];
  networking.firewall.allowedUDPPorts = [ localsendPort ];
}
