snmp-install:
  pkg.installed:
    - pkgs:
      - lm_sensors-libs
      - net-snmp-agent-libs
      - net-snmp-libs