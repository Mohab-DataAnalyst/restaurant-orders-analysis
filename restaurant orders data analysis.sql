-- Which menu items are doing well vs not well? (Data Analysis)

-- 1. Combine the two tables into a single one
SELECT *
FROM menu_items;

SELECT *
FROM order_details;

SELECT *
FROM order_details od
LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id;
    
-- 2. What were the least & most ordered items? What categories were they in?

SELECT item_name, category, num_orders
FROM (
	SELECT item_id, COUNT(order_id) AS num_orders
	FROM order_details
	GROUP BY item_id
) AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
ORDER BY num_orders DESC;

SELECT item_name, category, num_orders
FROM (
	SELECT item_id, COUNT(order_id) AS num_orders
	FROM order_details
	GROUP BY item_id
) AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
ORDER BY num_orders;

-- What do the top customers seem to like best? (Data Analysis)

-- 1. What were the top 5 orders that spent the most money?
WITH item_orders AS
(SELECT *
FROM order_details od
LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id)
    
SELECT order_id, SUM(price) AS total_spend
FROM item_orders
GROUP BY order_id
ORDER BY total_spend DESC
LIMIT 5;

-- 2. View the details of the highest spend order. What insights can you gather from the results?
WITH highest_order AS
(SELECT *
FROM order_details od
LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440)

SELECT category, COUNT(item_id) AS num_items
FROM highest_order
GROUP BY category;

-- 3. View the details of the top 5 highest spend orders. What insights can you gather from the results?
WITH highest_orders AS
(SELECT *
FROM order_details od
LEFT JOIN menu_items mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675) )

SELECT order_id, category, COUNT(item_id) AS num_items
FROM highest_orders
GROUP BY order_id, category;