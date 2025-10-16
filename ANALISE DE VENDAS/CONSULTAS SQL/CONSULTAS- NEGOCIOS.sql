SELECT COUNT(*) AS total_produtos
FROM products;

SELECT c.category_name, COUNT(p.product_id) AS total_produtos
FROM products p
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.Category_name
ORDER BY total_produtos DESC; 

SELECT c.country, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS receita_total
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.country
ORDER BY receita_total DESC
limit 4

SELECT cat.category_name, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_vendas
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY cat.category_name
ORDER BY total_vendas DESC
LIMIT 1;


SELECT EXTRACT(YEAR FROM o.order_date) AS ano,
       SUM(od.unit_price * od.quantity * (1 - od.discount)) AS receita_ano
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY ano
ORDER BY ano;


SELECT o.order_id,
       SUM(od.unit_price * od.quantity * (1 - od.discount)) AS lucro_estimado
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id
ORDER BY lucro_estimado DESC;

WITH gastos_clientes AS (
    SELECT o.customer_id, SUM(od.unit_price * od.quantity * (1 - od.discount)) AS total_gasto
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY o.Customer_id
)
SELECT c.customer_id, c.company_name, g.total_gasto
FROM gastos_clientes g
JOIN customers c ON g.customer_id = c.customer_id
WHERE g.total_gasto > (SELECT AVG(total_gasto) FROM gastos_clientes)
ORDER BY g.total_gasto DESC;











