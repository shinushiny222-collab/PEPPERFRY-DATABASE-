CREATE TABLE Orders (
    Order_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Order_Date DATE NOT NULL,
    Total_Amount NUMBER(10,2) CHECK (Total_Amount > 0),
    Order_Status VARCHAR2(20) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);


--Table created.


INSERT INTO Orders VALUES
(1, 101, TO_DATE('2026-09-01','YYYY-MM-DD'), 25000, 'Delivered');

--1 row created.

INSERT INTO Orders VALUES
(2, 102, TO_DATE('2026-09-02','YYYY-MM-DD'), 18000, 'Shipped');

--1 row created.

INSERT INTO Orders VALUES
(3, 103, TO_DATE('2026-09-03','YYYY-MM-DD'), 32000, 'Processing');

--1 row created.

INSERT INTO Orders VALUES
(4, 104, TO_DATE('2026-09-04','YYYY-MM-DD'), 15000, 'Delivered');

--1 row created.

INSERT INTO Orders VALUES
(5, 105, TO_DATE('2026-09-05','YYYY-MM-DD'), 27500, 'Processing');

--1 row created.

INSERT INTO Orders VALUES
(6, 106, TO_DATE('2026-09-06','YYYY-MM-DD'), 22000, 'Shipped');

--1 row created.

INSERT INTO Orders VALUES
(7, 107, TO_DATE('2026-09-07','YYYY-MM-DD'), 19500, 'Delivered');

--1 row created.

INSERT INTO Orders VALUES
(8, 108, TO_DATE('2026-09-08','YYYY-MM-DD'), 35000, 'Processing');

--1 row created.

INSERT INTO Orders VALUES
(9, 109, TO_DATE('2026-09-09','YYYY-MM-DD'), 12000, 'Shipped');

--1 row created.

INSERT INTO Orders VALUES
(10, 110, TO_DATE('2026-09-10','YYYY-MM-DD'), 19500, 'Processing');

--1 row created.

COMMIT;

--Commit complete.

SELECT * FROM Orders;

--ORDER_ID  CUSTOMER_ID  ORDER_DATE  TOTAL_AMOUNT  ORDER_STATUS
--------  -----------  ----------  ------------  ------------
--1         101          01-SEP-26   25000         Delivered
--2         102          02-SEP-26   18000         Shipped
--3         103          03-SEP-26   32000         Processing
--4         104          04-SEP-26   15000         Delivered
--5         105          05-SEP-26   27500         Processing
--6         106          06-SEP-26   22000         Shipped
--7         107          07-SEP-26   19500         Delivered
--8         108          08-SEP-26   35000         Processing
--9         109          09-SEP-26   12000         Shipped
--10        110          10-SEP-26   19500         Processing

UPDATE Orders
SET Total_Amount = 30000
WHERE Order_ID = 1;

--1 row updated.

UPDATE Orders
SET Order_Status = 'Shipped'
WHERE Order_ID = 2;

--1 row updated.

COMMIT;

--Commit complete.

SELECT
    Order_ID,
    Customer_ID,
    Order_Date,
    Total_Amount,
    Order_Status
FROM Orders
WHERE Order_ID IN (1, 2);

--ORDER_ID  CUSTOMER_ID  ORDER_DATE  TOTAL_AMOUNT  ORDER_STATUS
--------  -----------  ----------  ------------  ------------
--1         101          01-SEP-26   30000         Delivered
--2         102          02-SEP-26   18000         Shipped

SELECT
    c.Customer_ID,
    c.FIRST_NAME || ' ' || c.LAST_NAME AS Customer_Name,
    o.Order_ID,
    o.Order_Date,
    p.Product_Name,
    od.Quantity,
    od.Unit_Price,
    o.Total_Amount,
    o.Order_Status
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
JOIN Product p
    ON od.Product_ID = p.Product_ID
WHERE c.Customer_ID = 101
ORDER BY o.Order_Date;

--| Customer ID | Customer Name | Order ID | Order Date | Product   | Quantity | Unit Price | Total Amount | Status    |
--| ----------: | ------------- | -------: | ---------- | --------- | -------: | ---------: | -----------: | --------- |
--|         101 | John Smith    |        1 | 01-09-2026 | Product A |        2 |      12500 |        25000 | Delivered |

SELECT
    c.Customer_ID,
    c.FIRST_NAME || ' ' || c.LAST_NAME AS Customer_Name,
    COUNT(o.Order_ID) AS Total_Orders,
    SUM(o.Total_Amount) AS Total_Amount
FROM Customer c
JOIN Orders o
    ON c.Customer_ID = o.Customer_ID
GROUP BY
    c.Customer_ID,
    c.FIRST_NAME,
    c.LAST_NAME
ORDER BY c.Customer_ID;

--| Customer_ID | Customer_Name | Total_Orders | Total_Amount |
--| ----------- | ------------- | -----------: | -----------: |
--| 101         | Arun Kumar    |            3 |        45000 |
--| 102         | Priya Devi    |            2 |        30000 |
