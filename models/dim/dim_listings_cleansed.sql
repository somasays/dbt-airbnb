{{
    config(
        materialized = 'view',
        on_schema_change = 'fail'
    )
}}
WITH src_listing as (
    SELECT * from {{ ref("src_listings") }}
)

SELECT
    listing_id,
    listing_name,
    room_type,
    case
        when minimum_nights = 0 then 1
        else minimum_nights
    end as minimum_nights,
    host_id,
    replace(price_str,'$') :: NUMBER (10, 2) as price,
    created_at,
    updated_at
FROM
    src_listing