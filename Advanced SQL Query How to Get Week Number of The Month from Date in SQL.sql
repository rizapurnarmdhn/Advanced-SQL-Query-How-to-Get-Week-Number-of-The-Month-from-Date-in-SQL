SELECT product_name,
SUM(quantity) AS quantity_total,
CASE 
WHEN day < 8 THEN 'Week 1'
WHEN day < 15 THEN 'Week 2'
WHEN day < 22 THEN 'Week 3'
ELSE 'Week 4'
END AS week_of_month,
month
FROM
(SELECT product_name, quantity, order_date, EXTRACT(DAY FROM order_date) AS day, 
EXTRACT(MONTH FROM order_date) AS month
FROM sample) a
GROUP BY product_name, quantity, week_of_month, month