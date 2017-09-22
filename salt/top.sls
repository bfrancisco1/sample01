base:
  'web01*':
    - apache
    - firewalld
  'vpn*':
    - openvpn
    - openvpn.config