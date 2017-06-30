{% from 'cerebro/map.jinja' import cerebro with context %}

delete_cerebro_systemd_unit:
    service.dead:
        - name: {{ cerebro.service }}
        - enable: False
    file.absent:
        - name: /etc/systemd/system/{{ cerebro.service }}.service
    module.run:
        - name: service.systemctl_reload
        - onchanges:
            - file: delete_cerebro_systemd_unit

delete_cerebro_user:
    user.absent:
        - name: {{ cerebro.user }}

delete_cerebro_group:
    group.absent:
        - name: {{ cerebro.group }}
        - require:
            - user: delete_cerebro_user

delete_cerebro_files:
    file.absent:
        - names:
            - {{ cerebro.home }}
            - /var/lib/{{ cerebro.user }}
