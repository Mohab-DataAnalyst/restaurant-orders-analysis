-- OBJECTIVE 2: EXPLORE THE order_details TABLE (EDA)

-- 1. View the table.
SELECT *
FROM order_details;

-- 2. What is the date range?
SELECT MIN(order_date), MAX(order_date)
FROM order_details;

-- 3. How many orders were made within this date range?
SELECT COUNT(DISTINCT order_id) AS num_orders
FROM order_details;

-- 4. How many items were ordered within this date range?
SELECT COUNT(item_id) AS num_items_ordered
FROM order_details;

-- 5. Which orders had the most number of items?
SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC;

-- 6. How many orders had more than 12 items?
SELECT COUNT(*) AS num_orders
FROM
(SELECT order_id, COUNT(item_id) AS num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) AS num_items_per_order