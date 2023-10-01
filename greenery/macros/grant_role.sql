{% macro grant_select(role_name, this_schema, this_table) %}
    grant usage on schema {{ this_schema }} to role {{ role_name }};
    grant select on {{ this_table }} to role {{ role_name }};
{% endmacro %}