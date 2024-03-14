
with

source as(
    select * from {{source('stripe', 'payment') }}

),

staged as (
select 
    orderid as order_id,
    paymentmethod as payment_method,
    status,
    amount/100 as amount
from source

)

select * from staged
