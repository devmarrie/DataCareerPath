/*
You are given a table "orders" that contains information about orders made by customers. The table has the following columns:

    order_id (integer): the ID of the order
    customer_id (integer): the ID of the customer who made the order
    order_date (date): the date the order was made
    order_amount (decimal): the total amount of the order

Write a SQL query to find the top 3 customers who have made the largest orders in the last 30 days. Your query should return the following columns:

    customer_id (integer): the ID of the customer
    total_order_amount (decimal): the total amount of all the customer's orders in the last 30 days
    rank (integer): the rank of the customer based on their total_order_amount, with the largest total_order_amount having a rank of 1.

You should use a common table expression (CTE) to filter the orders table to only include orders made in the last 30 days.
You should then use a window function to calculate the total_order_amount for each customer,
and another window function to rank the customers based on their total_order_amount.

Your query should return the results in descending order of total_order_amount.

Here's an example of the expected output format:

customer_id | total_order_amount | rank
----------- | ------------------ | ----
123         | 3456.78            | 1
456         | 2345.67            | 2
789         | 1234.56            | 3
**/

    WITH last_thirty AS (
        SELECT *
        FROM orders
        WHERE order_date >= NOW() - INTERVAL '30 days'
    )

    SELECT customer_id,
        SUM(order_amount) AS total_order_amount,
        RANK() 0VER(ORDER BY SUM(order_amount) DESC) AS rank
    FROM last_thirty
    GROUP BY customer_id
    ORDER BY total_order_amount DESC
    LIMIT 3;


