CREATE TABLE products (
  product_id serial PRIMARY KEY,
  product_name VARCHAR(255) NOT NULL,
  price INT NOT NULL
);

INSERT INTO products (product_name, price) VALUES ('Laptop', 1000),
('Mouse', 50), ('Keyboard', 200);

SELECT *FROM products;

SELECT AVG(price) FROM products;

SELECT product_name, price
FROM products
WHERE price >=
(
  SELECT AVG(price) FROM products);