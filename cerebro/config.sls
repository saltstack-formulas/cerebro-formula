{% from 'cerebro/map.jinja' import cerebro with context %}

config_cerebro:
    file.managed:
        - name: {{ cerebro.home }}/conf/application.conf
        - source: salt://cerebro/templates/application.conf.jinja
        - template: jinja
        - context:
            cerebro: {{ cerebro }}
        - user: {{ cerebro.user }}
        - group: {{ cerebro.group }}
        - mode: 0755
