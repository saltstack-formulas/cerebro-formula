{% from 'cerebro/map.jinja' import cerebro with context %}

cerebro_binaries:
    archive.extracted:
        - name: {{ cerebro.home }}
        - if_missing: {{ cerebro.home }}
        - source: https://github.com/lmenezes/cerebro/releases/download/v{{ cerebro.version }}/cerebro-{{ cerebro.version }}.tgz
{% if pillar['cerebro']['skip_verify'] == 'true' %}
        - skip_verify: True
{% else %}
        - source_hash: {{ cerebro.hash }}
{% endif %}
        - archive_format: tar
        - options: '--strip=1'
        - enforce_toplevel: False
        - user: {{ cerebro.user }}
        - group: {{ cerebro.group }}
