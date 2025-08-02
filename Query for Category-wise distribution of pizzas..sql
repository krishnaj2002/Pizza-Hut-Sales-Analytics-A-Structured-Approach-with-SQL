SELECT 
    category,
    COUNT(*) AS total_pizza_types
FROM pizza_types
GROUP BY category
ORDER BY total_pizza_types DESC;
