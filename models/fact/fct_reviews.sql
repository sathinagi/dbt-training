{{
    config(
        materialized='incremental'
    )
}}

with src_reviews as
(
    select * from {{ ref('src_reviews') }}
)

select
    *
from src_reviews

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses >= to include records whose timestamp occurred since the last run of this model)
  -- (If event_time is NULL or the table is truncated, the condition will always be true and load all records)
where review_date >= (select max(review_date) from {{ this }} )

{% endif %}