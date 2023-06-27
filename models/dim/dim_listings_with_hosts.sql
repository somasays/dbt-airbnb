{{
    config(
        materialized = 'table',
        on_schema_change = 'fail'
    )
}}
with l as (
    select * from {{ ref('dim_listings_cleansed') }}
),
h as (
    select * from {{ ref('dim_hosts_cleansed') }}
)

select
	l.listing_id,
	l.listing_name,
	l.room_type ,
	l.minimum_nights ,
	l.price ,
	h.host_id ,
	h.host_name ,
	h.is_superhost,
	l.created_at,
	l.updated_at
from l
left join h
	on h.host_id = l.host_id