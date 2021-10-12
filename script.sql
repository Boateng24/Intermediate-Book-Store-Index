SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;


EXPLAIN ANALYZE SELECT * FROM pg_indexes WHERE tablename = 'customers';

EXPLAIN ANALYZE SELECT * FROM pg_indexes WHERE tablename = 'orders';

EXPLAIN ANALYZE SELECT * FROM pg_indexes WHERE tablename = 'books';

EXPLAIN ANALYZE SELECT customer_id, quantity 
FROM orders 
WHERE quantity > 18;

CREATE INDEX greater_18_quantity_idx ON orders
(quantity);

EXPLAIN ANALYZE SELECT customer_id, quantity 
FROM orders 
WHERE quantity > 18;

ALTER TABLE customers ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

CLUSTER customers USING customer_id;

CREATE INDEX customer_id_book_id_idx ON customers(customer_id, book_id);
DROP INDEX customer_id_book_id_idx;
CREATE INDEX customer_id_book_id_quantity_idx on customers(customer_id, book_id, quantity);
CREATE INDEX author_titile_idx ON books(author, title);
EXPLAIN ANALYSE SELECT * FROM orders 
WHERE  (quantity * price_base)>100
CREATE INDEX quantity_price_base_idx ON orders(quantity * price_base);
EXPLAIN ANALYSE SELECT * FROM orders 
WHERE  (quantity * price_base)>100





