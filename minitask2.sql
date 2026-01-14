CREATE TABLE transactions (
  transaction_id serial PRIMARY KEY,
  customer_id int NOT NULL,
  amount INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE customers(
  customer_id int PRIMARY KEY, 
  customer_name VARCHAR(255) NOT NULL
)

INSERT INTO customers(customer_id, customer_name) VALUES (101, 'Ari'), (102, 'Ramadhan');

INSERT INTO transactions (customer_id, amount) VALUES (101, 500), (101, 300), (102, 150);

SELECT *FROM transactions;

SELECT SUM(amount) FROM transactions;
SELECT AVG(amount) FROM transactions;

-- SELECT t.customer_id, c.customer_name, t.amount
-- FROM transactions t
-- JOIN customers c ON c.customer_id = t.customer_id
-- WHERE t.amount >= 200
-- (
--   SELECT SUM(t.amount) FROM transactions
-- )
-- GROUP BY t.customer_id, c.customer_name, t.amount;

-- SELECT AVG(t.amount), c.customer_name, t.transaction_id
-- FROM transactions t
-- JOIN customers c ON c.customer_id = t.customer_id
-- WHERE t.amount >= ANY (
--   SELECT SUM(amount)
--   FROM transactions 
--   GROUP BY amount
-- )
-- GROUP BY c.customer_name, t.transaction_id;

SELECT transaction_id, customer_id, amount
FROM transactions t1
WHERE amount >= ANY (
  SELECT AVG(amount)
  FROM transactions t2
  WHERE t1.customer_id = t2.customer_id -- corelated base on condition outer table
  GROUP BY customer_id
)
GROUP BY transaction_id, customer_id;