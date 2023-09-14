{% snapshot inventory_snapshot %}

    {{
    config(
        target_database = 'dev_db',
        target_schema = 'dbt_adamisetucscedu',
        strategy='check',
        unique_key='product_id',
        check_cols=['inventory'],
    )
    }}

  SELECT * FROM {{ source('postgres', 'products') }}

{% endsnapshot %}