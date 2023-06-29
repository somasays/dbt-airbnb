with mart_full_moon_reviews as (
    select * from {{ ref('mart_full_moon_reviews') }}
)
select
    is_full_moon,
    review_sentiment,
    count(1) as review
from mart_full_moon_reviews
group by
    is_full_moon,
    review_sentiment
order by
    is_full_moon,
    review_sentiment