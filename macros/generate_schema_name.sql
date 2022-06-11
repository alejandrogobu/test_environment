{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}
    {%- if custom_schema_name is none -%}

        {{ default_schema }}

    {%- else -%}

        {% if  target.name == 'dev' %} {{ custom_schema_name | trim }}
        {% elif target.name == 'pre'  %} {{ custom_schema_name | trim }}  
        {% elif target.name == 'pro'  %} {{ custom_schema_name | trim }}
        {% elif target.name == 'user_dev'  %} {{ custom_schema_name | trim }}
        {% else %} 
        {{target.schema}}_{{ custom_schema_name | trim }}
        {% endif %}

    {%- endif -%}

{%- endmacro %}