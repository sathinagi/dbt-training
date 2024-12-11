with raw_hosts
as
(
select * from {{ source('airbnb', 'hosts') }}
)

select
id,
name,
is_superhost,
created_at,
updated_at
FROM raw_hosts