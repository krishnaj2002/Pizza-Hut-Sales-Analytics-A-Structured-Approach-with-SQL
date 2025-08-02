SELECT 
    pizza_types.name AS pizza_type,
    ROUND(SUM(order_details.quantity * pizzas.price), 2) AS revenue,
    ROUND(
        100.0 * SUM(order_details.quantity * pizzas.price) / 
        (SELECT SUM(order_details.quantity * pizzas.price)
         FROM order_details
         JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id), 2
    ) AS percent_contribution
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY percent_contribution DESC;
