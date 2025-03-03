CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    base_price DECIMAL(10,2),
    weight_kg DECIMAL(5,2)
);
INSERT INTO products VALUES
(1, 'Wireless Earbuds', 'Electronics', 129.99, 0.2),
(2, 'Gaming Mouse', 'Electronics', 59.99, 0.3),
(3, 'Yoga Mat', 'Sports', 29.99, 1.0),
(4, 'Coffee Maker', 'Appliances', 89.99, 3.5),
(5, 'Running Shoes', 'Sports', 79.99, 0.8),
(6, 'Smart Watch', 'Electronics', 199.99, 0.15),
(7, 'Backpack', 'Fashion', 49.99, 0.9),
(8, 'Protein Powder', 'Health', 39.99, 2.2),
(9, 'Laptop Stand', 'Office', 29.99, 1.5),
(10, 'Water Bottle', 'Sports', 19.99, 0.4),
(11, 'Drawing Tablet', 'Electronics', 159.99, 0.7),
(12, 'Desk Chair', 'Furniture', 199.99, 12.0),
(13, 'Blender', 'Appliances', 69.99, 2.8),
(14, 'Dumbbell Set', 'Sports', 149.99, 20.0),
(15, 'Wireless Keyboard', 'Electronics', 79.99, 0.6),
(16, 'Air Purifier', 'Appliances', 149.99, 4.5),
(17, 'Hiking Boots', 'Sports', 129.99, 1.2),
(18, 'Security Camera', 'Electronics', 89.99, 0.3),
(19, 'Office Desk', 'Furniture', 299.99, 25.0),
(20, 'Tennis Racket', 'Sports', 59.99, 0.4);

CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY,
    location VARCHAR(100),
    capacity INT,
    warehouse_type VARCHAR(50)
);

INSERT INTO warehouses VALUES
(1, 'Seattle, WA', 10000, 'Standard'),
(2, 'Dallas, TX', 15000, 'Large'),
(3, 'Atlanta, GA', 12000, 'Standard'),
(4, 'Phoenix, AZ', 8000, 'Small'),
(5, 'Chicago, IL', 20000, 'Large'),
(6, 'Miami, FL', 9000, 'Standard'),
(7, 'Denver, CO', 11000, 'Standard'),
(8, 'Las Vegas, NV', 7000, 'Small'),
(9, 'Boston, MA', 13000, 'Standard'),
(10, 'Portland, OR', 10000, 'Standard'),
(11, 'Houston, TX', 16000, 'Large'),
(12, 'San Diego, CA', 9500, 'Standard'),
(13, 'Detroit, MI', 8500, 'Small'),
(14, 'Nashville, TN', 11500, 'Standard'),
(15, 'Sacramento, CA', 9000, 'Standard'),
(16, 'Kansas City, MO', 12500, 'Standard'),
(17, 'Columbus, OH', 10500, 'Standard'),
(18, 'San Antonio, TX', 13500, 'Standard'),
(19, 'Minneapolis, MN', 14000, 'Standard'),
(20, 'New Orleans, LA', 8000, 'Small');

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    supplier_id INT,
    quantity INT,
    last_updated TIMESTAMP,
    sold IMESTAMP
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO inventory VALUES
(1, 1, 1,1, 150, '2025-02-01 10:00:00','2025-02-10 10:00:00'),
(2, 2, 11,2, 200, '2025-02-01 10:30:00','2025-02-11 10:00:00'),
(3, 3, 2,3, 300, '2025-02-01 11:00:00','2025-02-21 10:00:00'),
(4, 4, 12,4, 100, '2025-02-01 11:30:00','2025-02-12 10:00:00'),
(5, 5, 3,5, 250, '2025-02-01 12:00:00','2025-02-014 10:00:00'),
(6, 6, 13,6, 175, '2025-02-01 12:30:00','2025-02-16 10:00:00'),
(7, 7, 4,7, 400, '2025-02-01 13:00:00','2025-02-03 10:00:00'),
(8, 8, 14,8, 350, '2025-02-01 13:30:00','2025-02-06 10:00:00'),
(9, 9, 5,9, 225, '2025-02-01 14:00:00','2025-02-08 10:00:00'),
(10, 10, 15,10, 500, '2025-02-01 14:30:00','2025-02-05 10:00:00'),
(11, 11, 6,11, 125, '2025-02-01 15:00:00','2025-02-18 10:00:00'),
(12, 12, 16,12, 75, '2025-02-01 15:30:00','2025-02-07 10:00:00'),
(13, 13, 7,13, 200, '2025-02-01 16:00:00','2025-02-09 10:00:00'),
(14, 14, 17,14, 150, '2025-02-01 16:30:00','2025-02-22 10:00:00'),
(15, 15, 8,15, 275, '2025-02-01 17:00:00','2025-02-19 10:00:00'),
(16, 16, 18,16, 180, '2025-02-01 17:30:00','2025-02-23 10:00:00'),
(17, 17, 9,17, 220, '2025-02-01 18:00:00','2025-02-24 10:00:00'),
(18, 18, 19,18, 190, '2025-02-01 18:30:00','2025-02-26 10:00:00'),
(19, 19, 10,19, 85, '2025-02-01 19:00:00','2025-02-25 10:00:00'),
(20, 20, 20,20, 310, '2025-02-01 19:30:00','2025-02-28 10:00:00'),
(21, 1, 11,1, 151, '2025-03-01 10:00:00','2025-03-11 10:00:00'),
(22, 2, 12,2, 201, '2025-03-01 10:30:00','2025-03-12 10:00:00'),
(23, 3, 13,3, 301, '2025-03-01 11:00:00','2025-03-13 10:00:00'),
(24, 4, 14,4, 101, '2025-03-01 11:30:00','2025-03-14 10:00:00'),
(25, 5, 15,5, 251, '2025-03-01 12:00:00','2025-03-15 10:00:00'),
(26, 6, 16,6, 176, '2025-03-01 12:30:00','2025-03-16 10:00:00'),
(27, 7, 17,7, 401, '2025-03-01 13:00:00','2025-03-17 10:00:00'),
(28, 8, 18,8, 351, '2025-03-01 13:30:00','2025-03-18 10:00:00'),
(29, 9, 19,9, 226, '2025-03-01 14:00:00','2025-03-19 10:00:00'),
(30, 10, 20,10, 501, '2025-03-01 14:30:00','2025-03-02 10:00:00'),
(31, 11, 1,11, 126, '2025-03-01 15:00:00','2025-03-03 10:00:00'),
(32, 12, 2,12, 76, '2025-03-01 15:30:00','2025-03-04 10:00:00'),
(33, 13, 3,13, 201, '2025-03-01 16:00:00','2025-03-05 10:00:00'),
(34, 14, 4,14, 151, '2025-03-01 16:30:00','2025-03-06 10:00:00'),
(35, 15, 5,15, 276, '2025-03-01 17:00:00','2025-03-07 10:00:00'),
(36, 16, 6,16, 181, '2025-03-01 17:30:00','2025-03-08 10:00:00'),
(37, 17, 7,17, 221, '2025-03-01 18:00:00','2025-03-10 10:00:00'),
(38, 18, 8,18, 191, '2025-03-01 18:30:00','2025-03-09 10:00:00'),
(39, 19, 9,19, 86, '2025-03-01 19:00:00','2025-03-23 10:00:00'),
(40, 20, 10,20, 311, '2025-03-01 19:30:00','2025-03-26 10:00:00'),
(41, 1, 11,1, 152, '2025-04-01 10:00:00','2025-04-03 10:00:00'),
(42, 2, 12,2, 202, '2025-04-01 10:30:00','2025-04-04 10:00:00'),
(43, 3, 13,3, 302, '2025-04-01 11:00:00','2025-04-05 10:00:00'),
(44, 4, 14,4, 102, '2025-04-01 11:30:00','2025-04-06 10:00:00'),
(45, 5, 15,5, 252, '2025-04-01 12:00:00','2025-04-07 10:00:00'),
(46, 6, 16,6, 177, '2025-04-01 12:30:00','2025-04-08 10:00:00'),
(47, 7, 17,7, 402, '2025-04-01 13:00:00','2025-04-09 10:00:00'),
(48, 8, 18,8, 352, '2025-04-01 13:30:00','2025-04-12 10:00:00'),
(49, 9, 19,9, 227, '2025-04-01 14:00:00','2025-04-14 10:00:00'),
(50, 10, 20,10, 502, '2025-04-01 14:30:00','2025-04-17 10:00:00'),
(51, 11, 1,11, 280, '2025-04-01 11:59:03','2025-04-23 10:00:00'),
(52, 12, 2,12, 296, '2025-04-01 20:56:46','2025-04-18 10:00:00'),
(53, 13, 3,13, 480, '2025-04-01 04:08:23','2025-04-17 10:00:00'),
(54, 14, 4,14, 93, '2025-04-01 21:30:29','2025-04-25 10:00:00'),
(55, 15, 5,15, 352, '2025-04-01 02:30:44','2025-04-16 10:00:00'),
(56, 16, 6,16, 468, '2025-04-01 09:38:16','2025-04-24 10:00:00'),
(57, 17, 7,17, 91, '2025-04-01 08:53:34','2025-04-18 10:00:00'),
(58, 18, 8,18, 116, '2025-04-01 20:48:59','2025-04-25 10:00:00'),
(59, 19, 9,19, 497, '2025-04-01 01:19:08','2025-04-29 10:00:00'),
(60, 20, 10,20, 268, '2025-04-01 20:54:33','2025-04-20 10:00:00');


CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    country VARCHAR(50),
    lead_time_days INT,
    reliability_score DECIMAL(3,2)
);

INSERT INTO suppliers VALUES
(1, 'TechPro Solutions', 'USA', 3, 4.8),
(2, 'GlobalGear Manufacturing', 'China', 15, 4.2),
(3, 'SportEquip International', 'Vietnam', 10, 4.5),
(4, 'ElectroTech Industries', 'Taiwan', 12, 4.3),
(5, 'FitLife Supplies', 'USA', 4, 4.9),
(6, 'Smart Devices Co', 'South Korea', 8, 4.6),
(7, 'HomeStyle Products', 'Mexico', 6, 4.4),
(8, 'HealthPlus Corporation', 'Canada', 5, 4.7),
(9, 'Office Essentials Ltd', 'India', 14, 4.0),
(10, 'EcoFriendly Goods', 'Germany', 11, 4.5),
(11, 'Digital Dreams Inc', 'Japan', 9, 4.8),
(12, 'Comfort Living Co', 'Malaysia', 13, 4.2),
(13, 'PowerTools Plus', 'USA', 4, 4.6),
(14, 'FitPro Equipment', 'Thailand', 12, 4.3),
(15, 'TechnoWorld Systems', 'Singapore', 7, 4.7),
(16, 'Clean Air Solutions', 'USA', 3, 4.9),
(17, 'OutdoorPro Gear', 'Indonesia', 16, 4.1),
(18, 'SmartHome Devices', 'South Korea', 8, 4.5),
(19, 'WorkSpace Solutions', 'Taiwan', 11, 4.4),
(20, 'SportMaster Inc', 'Vietnam', 9, 4.6);