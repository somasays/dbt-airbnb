{{
    config(
        materialized = 'table',
        on_schema_change = 'fail'
    )
}}
with fct_reviews as (
    select * from {{ ref('fct_reviews') }}
),
full_moon_dates as(
    select * from {{ ref('seed_full_moon_dates') }}
)

select
    r.*,
    case
        when m.full_moon_date is null then 'not full moon'
        else 'full moon'
    end as is_full_moon
from fct_reviews r
left join full_moon_dates m
    on (to_date(r.review_date) = dateadd(day, 1, m.full_moon_date))