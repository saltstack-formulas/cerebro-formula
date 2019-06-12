{% from 'cerebro/map.jinja' import cerebro with context %}

cerebro_systemd_unit:
    file.managed:
        - name: /etc/systemd/system/{{ cerebro.service }}.service
        - source: salt://cerebro/templates/cerebro.service.jinja
        - template: jinja
        - context:
            cerebro: {{ cerebro|json }}
    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: cerebro_systemd_unit

cerebro_running:
    service.running:
        - name: {{ cerebro.service }}
        - enable: True
        - watch:
            - file: cerebro_systemd_unit
