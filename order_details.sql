CREATE TABLE Order_Details (
    Order_Detail_ID NUMBER PRIMARY KEY,
    Order_ID NUMBER,
    Product_ID NUMBER,
    Quantity NUMBER CHECK (Quantity > 0),
    Unit_Price NUMBER(10,2) CHECK (Unit_Price > 0),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID)
);

Table created.

INSERT INTO Order_Details VALUES
(1, 1, 1, 2, 12500);

1 row created.

INSERT INTO Order_Details VALUES
(2, 2, 2, 1, 18000);

1 row created.

INSERT INTO Order_Details VALUES
(3, 3, 3, 2, 16000);

1 row created.

INSERT INTO Order_Details VALUES
(4, 4, 4, 1, 15000);

1 row created.

INSERT INTO Order_Details VALUES
(5, 5, 5, 1, 27500);

1 row created.

INSERT INTO Order_Details VALUES
(6, 6, 6, 2, 11000);

1 row created.

INSERT INTO Order_Details VALUES
(7, 7, 7, 1, 19500);

1 row created.

INSERT INTO Order_Details VALUES
(8, 8, 8, 2, 17500);

1 row created.

INSERT INTO Order_Details VALUES
(9, 9, 9, 1, 12000);

1 row created.

INSERT INTO Order_Details VALUES
(10, 10, 10, 1, 19500);

1 row created.

COMMIT;

Commit complete.

SELECT * FROM Order_Details;

ORDER_DETAIL_ID  ORDER_ID  PRODUCT_ID  QUANTITY  UNIT_PRICE
---------------  --------  ----------  --------  ----------
1                1         1           2         12500
2                2         2           1         18000
3                3         3           2         16000
4                4         4           1         15000
5                5         5           1         27500
6                6         6           2         11000
7                7         7           1         19500
8                8         8           2         17500
9                9         9           1         12000
10               10        10          1         19500


UPDATE Order_Details
SET Quantity = 4
WHERE Order_Detail_ID = 1;

1 row updated.

UPDATE Order_Details
SET Unit_Price = 16000
WHERE Order_Detail_ID = 2;

1 row updated.

COMMIT;

Commit complete.

SELECT
    Order_Detail_ID,
    Order_ID,
    Product_ID,
    Quantity,
    Unit_Price
FROM Order_Details
WHERE Order_Detail_ID IN (1, 2);

ORDER_DETAIL_ID  ORDER_ID  PRODUCT_ID  QUANTITY  UNIT_PRICE
---------------  --------  ----------  --------  ----------
1                1         1           4         12500
2                2         2           1         16000