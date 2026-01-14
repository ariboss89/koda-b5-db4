WITH qty_sum AS (
SELECT SUM(quantity) AS "Product Total", product
FROM sales
GROUP BY product
)

select sales.customer_id, qty_sum.product from qty_sum, sales WHERE "Product Total" = 1 AND qty_sum.product= sales.product;
