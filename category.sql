CREATE TABLE Category (
    Category_ID NUMBER PRIMARY KEY,
    Category_Name VARCHAR2(50) UNIQUE,
    Description VARCHAR2(100)
);


INSERT INTO Category VALUES
(1, 'Sofa', 'Sofas and couches');

INSERT INTO Category VALUES
(2, 'Bed', 'Bedroom furniture');

INSERT INTO Category VALUES
(3, 'Chair', 'Home and office chairs');

INSERT INTO Category VALUES
(4, 'Table', 'Dining and study tables');

INSERT INTO Category VALUES
(5, 'Storage', 'Storage furniture');



SELECT * FROM Category;

COMMIT;