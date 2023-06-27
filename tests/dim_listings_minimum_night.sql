with dim_listings as (
    select * from {{ ref('dim_listings_cleansed') }}
)

select * from dim_listings where minimum_nights < 1
