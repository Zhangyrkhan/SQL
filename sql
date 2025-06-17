CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(255)
);

CREATE TABLE orders (
    id BIGSERIAL PRIMARY KEY,
    user_id LONG,
    order_date DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
