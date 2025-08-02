-- Calculate the total revenue generated from pizza sales.
select
round(sum( order_details.quantity * Pizzas.price),2)as  TOTAL_SALES
from order_details join pizzas
on pizzas.pizza_id= order_details.pizza_id