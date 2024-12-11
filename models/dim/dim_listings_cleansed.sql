with src_listings as 
(
    select * from {{ ref('src_listings') }}
)

select 
listing_id,
listing_url,
listing_name,
room_type,
case when minimum_nights = 0 then 1
     else minimum_nights
     end as minimum_nights,
host_id,
replace(price_str,'$') :: number(10,2) as price,
updated_at
from src_listings