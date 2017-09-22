firewalld:
  enabled: True
  default_zone: public
  zones:
    public:
      short: Public
      description:  only allow the following incoming
      services:
        - ssh
      rich_rules:
        - family: ipv4
          source:
            address: 192.168.102.0/24
          accept: True
          port:
            portid: 80
            protocol: tcp