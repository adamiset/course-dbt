-- Custom Macros defined here
-- Macro to aggregate event_types per session
{%- macro event_types(table_name, column_name) %} 

{%- 
    set event_types = dbt_utils.get_column_values(
    table = ref(table_name)
    , column =  column_name
) 
-%}

 {%- for event_type in event_types %}
  , sum(case when event_type = '{{ event_type }}' then 1 else 0 end) as total_{{ event_type}}
 {%- endfor %}

{%- endmacro %}