-- CREATE TABLE IF NOT EXISTS products_m5 (
--     id int generated always as identity primary key,
--     name varchar(100) not null,
--     price int not null
-- );

-- CREATE TABLE IF NOT EXISTS sales_m5 (
--     id int generated always as identity primary key,
--     product_id int REFERENCES products_m5(id),
--     quantity int not null
-- );

-- INSERT INTO products_m5(name, price) VALUES
-- ('Laptop', 1000),
-- ('Phone', 600),
-- ('Tablet', 400);
-- INSERT INTO sales_m5(product_id, quantity) VALUES
-- (1, 5),
-- (2, 10),
-- (3, 7),
-- (1, 3);

WITH total_sales AS (
SELECT SUM(quantity) AS "total sold unit", s.product_id
FROM sales_m5 s
JOIN products_m5 p ON p.id = s.product_id
GROUP BY s.product_id
HAVING SUM(quantity) >= 7
)

select t."total sold unit" * p.price AS "total sales", t.product_id
from total_sales t
JOIN products_m5 p ON p.id = t.product_id
GROUP BY t."total sold unit" * p.price, t.product_id;
