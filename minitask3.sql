CREATE TABLE sales (
  sale_id int generated always as identity,
  customer_id int NOT NULL,
  product VARCHAR(255) NOT NULL,
  quantity float NOT NULL, 
  price_per_unit int NOT NULL,
  sale_date DATE NOT NULL
);

ALTER TABLE sales ALTER column price_per_unit TYPE float;

INSERT INTO sales (customer_id, product, quantity, price_per_unit, sale_date) VALUES 
(101, 'Keyboard', 2, 25.00, '2024-04-01'), (102, 'Mouse', 1, 15.00, '2024-04-01'), 
(101, 'Monitor', 1, 200.00, '2024-04-02'), (103, 'Keyboard', 1, 25.00, '2024-04-02'),
(101, 'Mouse', 3, 15.00, '2024-04-03');

WITH search_customer AS (
SELECT quantity * price_per_unit AS "SubTotal", customer_id
FROM sales
WHERE product = 'Keyboard' 
)

select * from search_customer WHERE "SubTotal" > 30;
