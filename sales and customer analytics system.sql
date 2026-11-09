SELECT COUNT(*) AS Total_Orders
FROM Orders;

TOTAL_ORDERS
10

SELECT SUM(Total_Amount) AS Total_Purchase_Amount
FROM Orders;

TOTAL_PURCHASE_AMOUNT
263000

SELECT AVG(Total_Amount) AS Average_Order_Amount
FROM Orders;

AVERAGE_ORDER_AMOUNT
26300

SELECT MIN(Total_Amount) AS Minimum_Order_Amount
FROM Orders;

MINIMUM_ORDER_AMOUNT
12500

SELECT MAX(Total_Amount) AS Maximum_Order_Amount
FROM Orders;

MAXIMUM_ORDER_AMOUNT
45000

SELECT
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Amount) AS Total_Sales,
    AVG(Total_Amount) AS Average_Sales,
    MIN(Total_Amount) AS Minimum_Sales,
    MAX(Total_Amount) AS Maximum_Sales
FROM Orders;

| TOTAL_ORDERS | TOTAL_SALES | AVERAGE_SALES | MINIMUM_SALES | MAXIMUM_SALES |
|---:|---:|---:|---:|---:|
| 10 | 263000 | 26300 | 12500 | 45000 |

SELECT
    C.Customer_ID,
    C.Customer_Name,
    COUNT(O.Order_ID) AS Total_Orders,
    SUM(O.Total_Amount) AS Total_Purchase_Amount
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY C.Customer_ID;

| CUSTOMER_ID | CUSTOMER_NAME | TOTAL_ORDERS | TOTAL_PURCHASE_AMOUNT |
|---:|---|---:|---:|
| 1 | Customer 1 | 1 | 25000 |
| 2 | Customer 2 | 1 | 18500 |
| 3 | Customer 3 | 1 | 32000 |
| 4 | Customer 4 | 1 | 12500 |
| 5 | Customer 5 | 1 | 45000 |
| 6 | Customer 6 | 1 | 15500 |
| 7 | Customer 7 | 1 | 28000 |
| 8 | Customer 8 | 1 | 21000 |
| 9 | Customer 9 | 1 | 37500 |
| 10 | Customer 10 | 1 | 19500 |


SELECT
    C.Customer_ID,
    C.Customer_Name,
    SUM(O.Total_Amount) AS Total_Purchase_Amount
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY C.Customer_ID, C.Customer_Name
ORDER BY Total_Purchase_Amount DESC;


| CUSTOMER_ID | CUSTOMER_NAME | TOTAL_PURCHASE_AMOUNT |
|---:|---|---:|
| 5 | Customer 5 | 45000 |
| 9 | Customer 9 | 37500 |
| 3 | Customer 3 | 32000 |
| 7 | Customer 7 | 28000 |
| 1 | Customer 1 | 25000 |
| 8 | Customer 8 | 21000 |
| 10 | Customer 10 | 19500 |
| 2 | Customer 2 | 18500 |
| 6 | Customer 6 | 15500 |
| 4 | Customer 4 | 12500 |


SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OD.Quantity) AS Total_Quantity_Sold
FROM Product P
INNER JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Quantity_Sold DESC;

| PRODUCT_ID | PRODUCT_NAME | TOTAL_QUANTITY_SOLD |
|---:|---|---:|
| 1 | Sofa | 4 |
| 5 | Bookshelf | 3 |
| 9 | Study Table | 3 |
| 3 | Office Chair | 2 |
| 6 | Coffee Table | 2 |
| 7 | Wardrobe | 2 |
| 2 | Dining Table | 1 |
| 4 | Bed | 1 |
| 8 | TV Unit | 1 |
| 10 | Recliner Chair | 1 |


SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OD.Quantity * OD.Unit_Price)
        AS Total_Sales_Amount
FROM Product P
INNER JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY P.Product_ID, P.Product_Name
ORDER BY Total_Sales_Amount DESC;

| PRODUCT_ID | PRODUCT_NAME | TOTAL_SALES_AMOUNT |
|---:|---|---:|
| 1 | Sofa | 50000 |
| 5 | Bookshelf | 45000 |
| 9 | Study Table | 37500 |
| 3 | Office Chair | 32000 |
| 7 | Wardrobe | 28000 |
| 8 | TV Unit | 21000 |
| 10 | Recliner Chair | 19500 |
| 2 | Dining Table | 16000 |
| 6 | Coffee Table | 15500 |
| 4 | Bed | 12500 |

SELECT
    C.Category_ID,
    C.Category_Name,
    SUM(OD.Quantity) AS Total_Quantity_Sold,
    SUM(OD.Quantity * OD.Unit_Price)
        AS Total_Sales_Amount
FROM Category C
INNER JOIN Product P
ON C.Category_ID = P.Category_ID
INNER JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY C.Category_ID, C.Category_Name
ORDER BY Total_Sales_Amount DESC;

