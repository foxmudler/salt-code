include:
  - modules.keepalived.install

keepalived-service:
  file.managed:
    - name: /etc/keepalived/keepalived.conf
    - source: salt://cluster/files/keepalived-outside.cfg
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - backup: minion
    - defaults:
      state:  {{  pillar['keepalived-slave']['state']  }}
      priority:  {{  pillar['keepalived-slave']['priority']   }}
      VIP:  {{  pillar['keepalived-masetr']['VIP']   }}
  service.running:
    - name: keepalived
    - enable: True
    - reload: True
    - require:
      - cmd: keepalived-install
    - watch:
      - file: keepalived-service