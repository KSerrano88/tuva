{{ config(
     enabled = var('claims_enabled',var('tuva_marts_enabled',False))
 | as_bool
   )
}}

{% if var('use_synthetic_data') == true -%}

select * from {{ ref('pharmacy_claim_seed') }}

{%- else -%}

select * from {{ source('source_input', 'pharmacy_claim') }}

{%- endif %}