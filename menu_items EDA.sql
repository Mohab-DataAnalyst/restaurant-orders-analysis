USE restaurant_db;

-- Objective 1: EXPLORE THE menu_items TABLE (EDA)

-- 1. View the menu_items table
SELECT *
FROM menu_items;

-- 2. Find the number of items on the menu
SELECT COUNT(*)
FROM menu_items;

-- 3. What are the least & most expensive items on the menu?
SELECT *
FROM menu_items
ORDER BY price DESC;

SELECT *
FROM menu_items
ORDER BY price;

-- 4. How many Italian dishes are on the menu?
SELECT COUNT(*)
FROM menu_items
WHERE category = 'Italian';

-- 5. What are the least & most expensive Italian dishes on the menu?
SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price DESC;

SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price;

-- 6. How many dishes are in each category?
SELECT category, COUNT(menu_item_id) AS num_dishes
FROM menu_items
GROUP BY category;

-- 7. What is the average dish price for each category?
SELECT category, CONCAT('$', ROUND(AVG(price),2)) AS avg_price
FROM menu_items
GROUP BY category;