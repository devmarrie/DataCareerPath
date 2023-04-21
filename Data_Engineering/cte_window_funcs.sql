/* Given the following table sales:
id	|salesperson	|region	|date	   |amount
----|---------------|-------|----------|------
1	|Alice	        |North	|2022-01-01|100
----|---------------|-------|----------|------
2	|Bob	        |South	|2022-01-02|200
----|---------------|-------|----------|------
3	|Charlie	    |North	|2022-01-03|150
----|---------------|-------|----------|------
4	|Alice	        |South	|2022-01-04|120
----|---------------|-------|----------|------
5	|Bob	        |North	|2022-01-05|180
----|---------------|-------|----------|------
Write a SQL query that returns a table with the total sales amount for each salesperson,
as well as the percentage of their sales to the total sales across all salespersons. 
The result table should be sorted in descending order of the percentage column.
**/

WITH total_sales AS (
    SELECT salesperson,
           SUM(amount) AS total
    FROM sales
    GROUP BY salesperson;
)

SELECT salesperson,total
       ROW_NUMBER()OVER(ORDER BY total DESC) AS best_seller
FROM total_sales
ORDER BY total DESC;
       