select 
--raw orders
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit ,
o.ordercostprice,
o.ordersellingprice,
--raw customers
c.customerid,
c.customername,
c.segment,
c.country,
--raw product
p.category,
p.productid,
p.productname,
p.subcategory
from {{ ref('raw_orders') }}  as o
left join {{ ref('raw_customer') }} as c
on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p
on p.productid = o.productid