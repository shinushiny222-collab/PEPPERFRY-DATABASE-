CREATE TABLE Product (
    Product_ID NUMBER PRIMARY KEY,
    Product_Name VARCHAR2(100) NOT NULL,
    Category_ID NUMBER,
    Price NUMBER(10,2) CHECK (Price > 0),
    Stock NUMBER CHECK (Stock >= 0),
    Material VARCHAR2(50),
    Color VARCHAR2(30),
    FOREIGN KEY (Category_ID)
    REFERENCES Category(Category_ID)
);


INSERT INTO Product VALUES
(101, 'Luxury Sofa', 1, 35000, 10, 'Wood', 'Brown');

INSERT INTO Product VALUES
(102, 'Modern Sofa', 1, 28000, 15, 'Fabric', 'Grey');

INSERT INTO Product VALUES
(103, 'King Size Bed', 2, 45000, 8, 'Wood', 'Walnut');

INSERT INTO Product VALUES
(104, 'Queen Size Bed', 2, 38000, 12, 'Wood', 'White');

INSERT INTO Product VALUES
(105, 'Office Chair', 3, 8500, 25, 'Plastic', 'Black');

INSERT INTO Product VALUES
(106, 'Dining Chair', 3, 5000, 30, 'Wood', 'Brown');

INSERT INTO Product VALUES
(107, 'Dining Table', 4, 22000, 10, 'Wood', 'Natural');

INSERT INTO Product VALUES
(108, 'Study Table', 4, 12000, 18, 'Wood', 'White');

INSERT INTO Product VALUES
(109, 'Wooden Cupboard', 5, 30000, 7, 'Wood', 'Brown');

INSERT INTO Product VALUES
(110, 'Storage Cabinet', 5, 18000, 14, 'Metal', 'Black');


SELECT * FROM Product;


UPDATE Product
SET Price = 37000
WHERE Product_ID = 101;

UPDATE Product
SET Stock = 20
WHERE Product_ID = 105;

UPDATE Product
SET Color = 'Blue'
WHERE Product_ID = 108;



SELECT * FROM Product;




DELETE FROM Product
WHERE Product_ID = 109;

DELETE FROM Product
WHERE Product_ID = 110;



SELECT * FROM Product;



SELECT
    Category.Category_Name,
    Product.Product_Name,
    Product.Price,
    Product.Stock
FROM Category
JOIN Product
ON Category.Category_ID = Product.Category_ID
ORDER BY Category.Category_Name;




SELECT
    Category.Category_Name,
    COUNT(Product.Product_ID) AS Total_Products
FROM Category
LEFT JOIN Product
ON Category.Category_ID = Product.Category_ID
GROUP BY Category.Category_Name
ORDER BY Category.Category_Name;


COMMIT;