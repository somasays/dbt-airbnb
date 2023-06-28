{% macro no_nulls_in_columns(model) %}
    SELECT * from {{ model }} WHERE
        {% for col in adapter.get_columns_in_relation(model) -%}
            {{ col.column }} IS NULL OR
         {% endfor %}
         FALSE
{% endmacro %}