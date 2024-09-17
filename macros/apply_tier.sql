{% macro apply_tier(price_cents, multiplier_bps) -%}
    cast(round({{ price_cents }} * {{ multiplier_bps }} / 10000.0) as integer)
{%- endmacro %}
