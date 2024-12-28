{{
    config(
        materialized='table'
    )
}}
with src_hosts as
(
    select * from {{ ref('src_hosts') }}
)

select
id as Host_id,
nvl(name,'Anonymous') as Host_name,
is_superhost,
created_at,
updated_at
from 
src_hosts
