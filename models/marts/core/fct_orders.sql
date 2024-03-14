with customers as (

    select * from {{ ref('stg_customers') }}

),

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }}

),

final as(
    select o.order_id,
            c.customer_id,
            sum(case when p.status = 'success' then p.amount end) as amount

    from orders o
    left join customers c using (customer_id)
    left join payments p using (order_id)

    group by 1,2

)

select * from final