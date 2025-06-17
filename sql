CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255) NOT NULL
);
CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    user_id BIGINT NOT NULL REFERENCES users(id),
    order_date DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);


INSERT INTO users (email) VALUES
('a@gmail.com'),
('b@gmail.com'),
('c@gmail.com'),
('d@gmail.com'),
('e@gmail.com'),
('f@gmail.com');



INSERT INTO orders (user_id, order_date, total) VALUES
(1, '2025-06-17', 300),
(1, '2025-06-16', 400),
(2, '2025-06-15', 500),
(3, '2025-06-14', 1200),
(4, '2025-06-17', 300),
(3, '2025-06-16', 400),
(2, '2025-06-15', 500),
(5, '2025-06-14', 1200),
(6, '2025-06-14', 120),
(5, '2025-06-14', 12);


SELECT * FROM users;
SELECT * FROM orders;


SELECT users.email
FROM users
LEFT JOIN orders ON users.id = orders.user_id
GROUP BY users.id, users.email
HAVING COALESCE(SUM(orders.total), 0) < 1000;

