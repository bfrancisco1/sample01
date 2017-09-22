openvpn:
  server:
    server:
      ca: salt://openvpn/openvpn-ca/keys/ca.key
      cert: salt://openvpn/openvpn-ca/keys/server.crt
      key: salt://openvpn/openvpn-ca/keys/server.key
      server: '10.8.0.0 255.255.255.0'
      topology: subnet
      dev: tun
      port: 1194
      proto: udp
      dh: salt://openvpn/openvpn-ca/keys/dh2048.pem
      push: 
        - "route 192.168.102.0 255.255.255.0"