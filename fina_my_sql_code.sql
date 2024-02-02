create database online_shoping
use online_shoping
SELECT * FROM Customer
-- Creating Customer Table
CREATE TABLE Customer (
    Customer_id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(200) NOT NULL,
    Last_name VARCHAR(200) NOT NULL,
    Age INT NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Customer_password VARBINARY(64) NOT NULL,
    Gender VARCHAR(6) NOT NULL,
    Registration_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
);

-- Creating Product Table
CREATE TABLE Product (
    Product_id INT AUTO_INCREMENT PRIMARY KEY,
    Product_name VARCHAR(50) NOT NULL,
    Product_description TEXT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Image_url VARCHAR(200),
    Quantity_in_stock INT NOT NULL,
    Category_id INT,
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (Category_id) REFERENCES Category(Category_id) ON DELETE NO ACTION
);

-- Creating Review Table
CREATE TABLE Review (
    Review_id INT AUTO_INCREMENT PRIMARY KEY,
    Cust_id INT,
    Product_id INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5) NOT NULL,
    Review_description TEXT NOT NULL,
    Review_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id) ON DELETE CASCADE
);

-- Creating Cart Table
CREATE TABLE Cart (
    Cart_id INT AUTO_INCREMENT PRIMARY KEY,
    Cust_id INT,
    Product_id INT,
    Quantity INT CHECK (Quantity > 0) NOT NULL,
    Date_added DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id) ON DELETE CASCADE
);

-- Creating Orders Table
CREATE TABLE Orders(
    Order_id INT AUTO_INCREMENT PRIMARY KEY,
    Cust_id INT,
    Shipment_id INT,
    Order_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Order_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Cust_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Shipment_id) REFERENCES Shipment(Shipment_id) ON DELETE CASCADE
);

-- Creating Order_item Table
CREATE TABLE Order_item (
    Order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    Order_id INT,
    Product_id INT,
    Quantity INT CHECK (Quantity > 0) NOT NULL,
    Item_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) ON DELETE CASCADE,
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id) ON DELETE CASCADE
);

-- Creating Payment Table
CREATE TABLE Payment (
    Payment_id INT AUTO_INCREMENT PRIMARY KEY,
    Order_id INT,
    Payment_method VARCHAR(50) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Payment_date DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id) ON DELETE CASCADE
);

-- Creating Shipment Address Table
CREATE TABLE Shipment_address(
	 Shipment_Address_id INT PRIMARY KEY,
	 Shipment_country VARCHAR(255) NOT NULL,
	 Shipment_city VARCHAR(255) NOT NULL,
	 Postal_code VARCHAR(255) NOT NULL
);

-- Creating Shipment Table
CREATE TABLE Shipment (
    Shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    Shipment_method VARCHAR(50) NOT NULL,
    Shipment_cost DECIMAL(10, 2) NOT NULL,
    Shipment_Address_id INT,
    FOREIGN KEY (Shipment_Address_id) REFERENCES Shipment_address(Shipment_Address_id) ON DELETE CASCADE
);

-- Creating Category Table
CREATE TABLE Category (
    Category_id INT AUTO_INCREMENT PRIMARY KEY,
    Category_name VARCHAR(200) NOT NULL
);
/*inserting in to customer tables*/
INSERT INTO Customer (First_name, Last_name, Age, Email, Customer_password, Gender, Registration_date)
VALUES
('John', 'Doe', 25, 'john.doe@example.com', 'password_hash1', 'Male', CURRENT_TIMESTAMP),
('Jane', 'Smith', 30, 'jane.smith@example.com', 'password_hash2', 'Female', CURRENT_TIMESTAMP),
('Bob', 'Johnson', 28, 'bob.johnson@example.com', 'password_hash3', 'Male', CURRENT_TIMESTAMP),
('Alice', 'Williams', 35, 'alice.williams@example.com', 'password_hash4', 'Female', CURRENT_TIMESTAMP),
('Charlie', 'Brown', 22, 'charlie.brown@example.com', 'password_hash5', 'Male', CURRENT_TIMESTAMP),
('Eva', 'Miller', 29, 'eva.miller@example.com', 'password_hash6', 'Female', CURRENT_TIMESTAMP),
('David', 'Davis', 31, 'david.davis@example.com', 'password_hash7', 'Male', CURRENT_TIMESTAMP),
('Sophia', 'Johnson', 27, 'sophia.johnson@example.com', 'password_hash8', 'Female', CURRENT_TIMESTAMP),
('Michael', 'White', 32, 'michael.white@example.com', 'password_hash9', 'Male', CURRENT_TIMESTAMP),
('Emma', 'Anderson', 26, 'emma.anderson@example.com', 'password_hash10', 'Female', CURRENT_TIMESTAMP),
('Ryan', 'Wilson', 33, 'ryan.wilson@example.com', 'password_hash11', 'Male', CURRENT_TIMESTAMP),
('Olivia', 'Smith', 28, 'olivia.smith@example.com', 'password_hash12', 'Female', CURRENT_TIMESTAMP),
('Jacob', 'Taylor', 30, 'jacob.taylor@example.com', 'password_hash13', 'Male', CURRENT_TIMESTAMP),
('Sophie', 'Brown', 29, 'sophie.brown@example.com', 'password_hash14', 'Female', CURRENT_TIMESTAMP),
('William', 'Miller', 34, 'william.miller@example.com', 'password_hash15', 'Male', CURRENT_TIMESTAMP),
('Ava', 'Wilson', 27, 'ava.wilson@example.com', 'password_hash16', 'Female', CURRENT_TIMESTAMP),
('Ethan', 'Davis', 31, 'ethan.davis@example.com', 'password_hash17', 'Male', CURRENT_TIMESTAMP),
('Isabella', 'Johnson', 26, 'isabella.johnson@example.com', 'password_hash18', 'Female', CURRENT_TIMESTAMP),
('Mason', 'Anderson', 29, 'mason.anderson@example.com', 'password_hash19', 'Male', CURRENT_TIMESTAMP),
('Amelia', 'Smith', 30, 'amelia.smith@example.com', 'password_hash20', 'Female', CURRENT_TIMESTAMP);
/*inserting to catagory table*/

INSERT INTO Category (Category_name)
VALUES
('Electronics'),
('Clothing'),
('Home and Garden');
/*inserting to product table*/

INSERT INTO Product (Product_name, Product_description, Price, Image_url, Quantity_in_stock, Category_id, Created_date)
VALUES
('Laptop', 'High-performance laptop with advanced features', 899.99, 'https://media.wired.com/photos/64daad6b4a854832b16fd3bc/master/w_1600,c_limit/How-to-Choose-a-Laptop-August-2023-Gear.jpg', 50, 1, CURRENT_TIMESTAMP),
('Smartphone', 'Latest smartphone with cutting-edge technology', 699.99, 'https://i.ebayimg.com/images/g/tiwAAOSwjrhkBnn0/s-l1600.webp', 100, 1, CURRENT_TIMESTAMP),
('LED TV', 'Ultra HD LED TV with vivid colors', 1199.99, 'https://www.lg.com/content/dam/channel/wcms/in/images/tvs/32lm563bptc_atr_eail_in_c/gallery/32LM563BPTC-DZ-01-V2.jpg', 30, 1, CURRENT_TIMESTAMP),
('Mens T-Shirt', 'Comfortable cotton T-shirt for men', 19.99, 'https://i.insider.com/63cebc3ffcc41d0018a3b020?width=1000&format=jpeg&auto=webp', 200, 2, CURRENT_TIMESTAMP),
('Womens Jeans', 'Stylish jeans for women', 49.99, 'https://lsco.scene7.com/is/image/lsco/125010373-dynamic1-pdp?fmt=avif&qlt=40&resMode=bisharp&fit=crop,0&op_usm=0.6,0.6,8&wid=660&hei=726', 150, 2, CURRENT_TIMESTAMP),
('Coffee Maker', 'Automatic coffee maker for your daily brew', 59.99, 'https://m.media-amazon.com/images/I/71wgaeEkddL.__AC_SX300_SY300_QL70_FMwebp_.jpg', 20, 3, CURRENT_TIMESTAMP),
('Toaster', 'Stainless steel toaster for quick breakfasts', 39.99, 'https://techcrunch.com/wp-content/uploads/2022/08/tineco-toaster.jpg?w=711', 25, 3, CURRENT_TIMESTAMP),
('Gaming Mouse', 'High-precision gaming mouse for gamers', 49.99, 'https://assets2.razerzone.com/images/pnx.assets/dd2cb52f4bf27ff926aa88e6df386019/razer-basilisk-v3-pro-500x500.png', 50, 1, CURRENT_TIMESTAMP),
('Running Shoes', 'Lightweight running shoes for fitness enthusiasts', 69.99, 'https://media.cnn.com/api/v1/images/stellar/prod/best-trail-running-shoes-brooks-cascadia-pc.jpg?c=16x9&q=h_720,w_1280,c_fill/f_webp', 75, 2, CURRENT_TIMESTAMP),
('Sofa Set', 'Modern and comfortable sofa set for your living room', 799.99, 'https://aarsunwoods.com/wp-content/uploads/2023/06/Royal-Sofa-Set-in-Gold-Paint-C.webp', 10, 3, CURRENT_TIMESTAMP),
('Smart Watch', 'Fitness tracker and smartwatch with health features', 129.99, 'https://i.ebayimg.com/images/g/3moAAOSwahJlS9pD/s-l1600.webp', 30, 1, CURRENT_TIMESTAMP),
('Blender', 'Powerful blender for smoothies and shakes', 89.99, 'https://i.ebayimg.com/images/g/3moAAOSwahJlS9pD/s-l1600.webp', 15, 3, CURRENT_TIMESTAMP),
('Office Chair', 'Ergonomic office chair for long hours of work', 129.99, 'https://www.zorin.co.in/cdn/shop/products/ZRNCHZSE1027BlueBlack_1.jpg?v=1654518071&width=1200', 20, 3, CURRENT_TIMESTAMP),
('Backpack', 'Durable and spacious backpack for daily use', 39.99, 'https://m.media-amazon.com/images/I/71qpXciYP1L.__AC_SX300_SY300_QL70_FMwebp_.jpg', 50, 2, CURRENT_TIMESTAMP),
('Desk Lamp', 'Adjustable desk lamp for focused work', 29.99, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNkXXIEtpTHtX0H2Yi0JURvfEMFU5Z_ExW0GIw2hvWMg&s', 30, 3, CURRENT_TIMESTAMP),
('Wireless Headphones', 'Over-ear wireless headphones for immersive sound', 99.99, 'https://i.ebayimg.com/images/g/3moAAOSwahJlS9pD/s-l1600.webp', 40, 1, CURRENT_TIMESTAMP),
('Microwave Oven', 'Compact microwave oven for quick meals', 79.99, 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Panasonic_NN-SD69LS_20220410.jpg/300px-Panasonic_NN-SD69LS_20220410.jpg', 15, 3, CURRENT_TIMESTAMP),
('Digital Camera', 'High-resolution digital camera for photography enthusiasts', 499.99, 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Canon_PowerShot_A95_-_front_and_back.jpg/220px-Canon_PowerShot_A95_-_front_and_back.jpg', 10, 1, CURRENT_TIMESTAMP),
('Printed Bed Sheets', 'Soft and stylish bed sheets with vibrant prints', 29.99, 'https://4.imimg.com/data4/NH/RQ/MY-943661/printed-bed-sheet-1000x1000.jpg', 60, 3, CURRENT_TIMESTAMP),
('Fitness Tracker', 'Track your fitness goals with this advanced tracker', 59.99, 'https://i.ebayimg.com/images/g/3moAAOSwahJlS9pD/s-l1600.webp', 35, 2, CURRENT_TIMESTAMP);

/*inserting to review table*/
INSERT INTO Review (Cust_id, Product_id, Rating, Review_description, Review_date)
VALUES
(1, 1, 5, 'Great laptop! Powerful and fast.', CURRENT_TIMESTAMP),
(2, 3, 4, 'The LED TV has excellent picture quality.', CURRENT_TIMESTAMP),
(3, 5, 3, 'Good quality T-shirt but a bit expensive.', CURRENT_TIMESTAMP),
(4, 7, 5, 'Love the coffee maker! Makes delicious coffee.', CURRENT_TIMESTAMP),
(5, 9, 2, 'Not satisfied with the gaming mouse. Unresponsive.', CURRENT_TIMESTAMP),
(6, 12, 4, 'The smartwatch is fantastic! Highly recommended.', CURRENT_TIMESTAMP),
(7, 15, 5, 'Wireless headphones have great sound quality.', CURRENT_TIMESTAMP);
/*inserting some values to the  cart*/
INSERT INTO Cart (Cust_id, Product_id, Quantity, Date_added)
VALUES
(1, 3, 2, CURRENT_TIMESTAMP),
(2, 8, 1, CURRENT_TIMESTAMP),
(3, 12, 3, CURRENT_TIMESTAMP),
(4, 5, 1, CURRENT_TIMESTAMP),
(5, 10, 2, CURRENT_TIMESTAMP),
(6, 15, 1, CURRENT_TIMESTAMP),
(7, 2, 4, CURRENT_TIMESTAMP);
/*inserting to the shipment address*/
INSERT INTO Shipment_address (Shipment_Address_id, Shipment_country, Shipment_city, Postal_code)
VALUES
(1, 'United States', 'New York', '10001'),
(2, 'Canada', 'Toronto', 'M5A 1A1'),
(3, 'United Kingdom', 'London', 'SW1A 1AA'),
(4, 'Australia', 'Sydney', '2000'),
(5, 'Germany', 'Berlin', '10117'),
(6, 'France', 'Paris', '75001'),
(7, 'Japan', 'Tokyo', '100-0001');
/*inserting in to shipment table*/
 INSERT INTO Shipment (Shipment_method, Shipment_cost, Shipment_Address_id)
VALUES
('Standard Shipping', 9.99, 1),
('Express Shipping', 19.99, 2),
('International Shipping', 29.99, 3),
('Local Delivery', 14.99, 4),
('Two-Day Shipping', 24.99, 5),
('Next-Day Shipping', 34.99, 6),
('Priority Mail', 12.99, 7);
/*inserting some values to the order table*/
INSERT INTO Orders (Cust_id, Shipment_id, Order_date, Order_total)
VALUES
(1, 1, CURRENT_TIMESTAMP, 120.50),
(2, 2, CURRENT_TIMESTAMP, 75.99),
(3, 3, CURRENT_TIMESTAMP, 200.25),
(4, 4, CURRENT_TIMESTAMP, 50.00),
(5, 5, CURRENT_TIMESTAMP, 180.75),
(6, 6, CURRENT_TIMESTAMP, 90.49),
(7, 7, CURRENT_TIMESTAMP, 150.00);
/*insert in to order table*/
INSERT INTO Payment (Order_id, Payment_method, Amount, Payment_date)
VALUES
(1, 'Credit Card', 120.50, CURRENT_TIMESTAMP),
(2, 'PayPal', 75.99, CURRENT_TIMESTAMP),
(3, 'Bank Transfer', 200.25, CURRENT_TIMESTAMP),
(4, 'Cash on Delivery', 50.00, CURRENT_TIMESTAMP),
(5, 'Credit Card', 180.75, CURRENT_TIMESTAMP),
(6, 'PayPal', 90.49, CURRENT_TIMESTAMP),
(7, 'Credit Card', 150.00, CURRENT_TIMESTAMP);
/*inserting in to orderitem table*/
INSERT INTO Order_item (Order_id, Product_id, Quantity, Item_total)
VALUES
(1, 3, 2, 30.50),
(2, 8, 1, 15.99),
(3, 12, 3, 60.75),
(4, 5, 1, 25.00),
(5, 10, 2, 90.25),
(6, 15, 1, 45.49),
(7, 2, 4, 60.00);
/*****************************************************************************/
/*****************************************************************************/
/*****************************************************************************/
/*creating some a proceudet to add a customer*/

DELIMITER //
CREATE PROCEDURE InsertSingleCustomer(
    p_First_name VARCHAR(200),
    p_Last_name VARCHAR(200),
    p_Age INT,
    p_Email VARCHAR(255),
    p_Customer_password VARBINARY(64),
    p_Gender VARCHAR(6)
)
BEGIN
    INSERT INTO Customer (First_name, Last_name, Age, Email, Customer_password, Gender, Registration_date)
    VALUES (p_First_name, p_Last_name, p_Age, p_Email, p_Customer_password, p_Gender, CURRENT_TIMESTAMP);
END //
DELIMITER ;
-- Example Usage:
-- CALL InsertSingleCustomer('eyob', 'Doe', 25, 'eyob.eyobe@example.com', 'password_hash1', 'Male');
/***************************************************************************/
/*******************creating a view*****************************************/
/***************************************************************************/
-- view to the admin to see all the review
CREATE VIEW ProductReview_Detail AS
SELECT
    p.product_name,
    r.Rating,
    r.Review_date,
    r.Review_description,
    c.First_name AS CustomerFirstName,
    c.Last_name AS CustomerLastName,
    c.Email
FROM
    Product p
    JOIN Review r ON p.Product_id = r.Product_id
    JOIN Customer c ON r.Cust_id = c.Customer_id;

SELECT * FROM ProductReview_Detail;
-- view to the admin to see all the orderDetail
 
CREATE VIEW OrderDetail AS
SELECT DISTINCT
    C.First_name AS FirstName,
    C.Last_name AS LastName,
    P.Product_name AS ProductName,
    O.Order_date AS OrderDate,
    O.Order_total AS OrderTotal,
    OI.Quantity AS Quantity
FROM
    Orders O
    JOIN Order_item OI ON O.Order_id = OI.Order_id
    JOIN Product P ON OI.Product_id = P.Product_id
    JOIN Customer C ON O.Cust_id = C.Customer_id;


   
    