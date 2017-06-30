{% from 'cerebro/map.jinja' import cerebro with context %}

create_cerebro_group:
    group.present:
        - name: {{ cerebro.group }}
        - system: True

create_cerebro_user:
    user.present:
        - name: {{ cerebro.user }}
        - groups:
            - {{ cerebro.group }}
        - fullname: Cerebro User
        - shell: /bin/false
        - empty_password: True
        - system: True
        - home: /var/lib/{{ cerebro.user }}
        - require:
            - group: create_cerebro_group
