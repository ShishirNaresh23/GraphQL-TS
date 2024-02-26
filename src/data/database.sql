-- Create tables
CREATE TABLE categories (
                            category_id SERIAL PRIMARY KEY,
                            category_name VARCHAR(255) NOT NULL
);

CREATE TABLE products (
                          product_id SERIAL PRIMARY KEY,
                          product_name VARCHAR(255) NOT NULL,
                          category_id INT REFERENCES categories(category_id) ON DELETE CASCADE
);

CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           customer_name VARCHAR(255) NOT NULL
);

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        order_date DATE NOT NULL,
                        customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
                             order_item_id SERIAL PRIMARY KEY,
                             order_id INT REFERENCES orders(order_id) ON DELETE CASCADE,
                             product_id INT REFERENCES products(product_id) ON DELETE CASCADE,
                             quantity INT NOT NULL,
                             price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE reviews (
                         review_id SERIAL PRIMARY KEY,
                         product_id INT REFERENCES products(product_id) ON DELETE CASCADE,
                         customer_id INT REFERENCES customers(customer_id) ON DELETE CASCADE,
                         review_text TEXT,
                         rating INT CHECK (rating >= 1 AND rating <= 5)
);

-- Insert sample data
INSERT INTO categories (category_name) VALUES ('Electronics'), ('Clothing'), ('Books');

INSERT INTO products (product_name, category_id) VALUES
                                                     ('Smartphone', 1),
                                                     ('Laptop', 1),
                                                     ('T-shirt', 2),
                                                     ('Jeans', 2),
                                                     ('Programming Book', 3),
                                                     ('Novel', 3);

INSERT INTO customers (customer_name) VALUES ('Alice'), ('Bob'), ('Charlie');

INSERT INTO orders (order_date, customer_id) VALUES
                                                 ('2024-02-17', 1),
                                                 ('2024-02-18', 2),
                                                 ('2024-02-19', 3);

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
                                                                    (1, 1, 2, 599.99),
                                                                    (1, 3, 3, 29.99),
                                                                    (2, 2, 1, 1299.99),
                                                                    (3, 5, 1, 39.99),
                                                                    (3, 6, 2, 19.99);

INSERT INTO reviews (product_id, customer_id, review_text, rating) VALUES
                                                                       (1, 1, 'Great smartphone!', 5),
                                                                       (3, 2, 'Comfortable and stylish.', 4),
                                                                       (5, 3, 'Excellent programming book!', 5);
