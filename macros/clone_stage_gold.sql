{% macro clone_stage_gold(stages=None) %}

  -- If stage parameter not set, infer current target. Will not run on pro
  {% if stages == None %}
    {% if target.name == "pro" %}
      {{ exceptions.raise_compiler_error("Cannot clone using the pro profile") }}
    {% endif %}

    {% set stages = [target.name] %}

  {% endif %}

  {% for stage in stages %}
    {{ log("Cloning prod to " ~ stage, info=True) }}
    {{ log("Clone in progress...", info=True) }}

    {% call statement('clone', fetch_result=False) %}
      CREATE OR REPLACE DATABASE {{ stage }} CLONE gold_pro;
     -- GRANT USAGE ON DATABASE {{ stage }} TO ROLE DBT_ROLE;
    {%- endcall %}

  {% endfor %}

{% endmacro %}