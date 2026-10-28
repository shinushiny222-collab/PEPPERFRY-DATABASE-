SELECT C.Customer_ID,
       C.Customer_Name,
       O.Order_ID,
       O.Order_Date,
       O.Total_Amount
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME  ORDER_ID ORDER_DAT TOTAL_AMOUNT
----------- -------------- -------- --------- ------------
          1 Arun                  1 01-SEP-26        25000
          2 Priya                 2 02-SEP-26        18500
          3 Rahul                 3 03-SEP-26        32000
          4 Sneha                 4 04-SEP-26        12500
          5 Karthik               5 05-SEP-26        45000
          6 Divya                 6 06-SEP-26        15500
          7 Vijay                 7 07-SEP-26        28000
          8 Meena                 8 08-SEP-26        21000
          9 Ajay                  9 09-SEP-26        37500
         10 Nisha                10 10-SEP-26        19500

10 rows selected.

--Orders and Payment

SELECT O.Order_ID,
       O.Order_Date,
       O.Total_Amount,
       P.Payment_ID,
       P.Payment_Method,
       P.Payment_Status,
       P.Amount
FROM Orders O
INNER JOIN Payment P
ON O.Order_ID = P.Order_ID;

| ORDER_ID | TOTAL_AMOUNT | PAYMENT_ID | PAYMENT_METHOD | PAYMENT_STATUS | AMOUNT |
| -------: | -----------: | ---------: | -------------- | -------------- | -----: |
|        1 |        25000 |          1 | UPI            | Completed      |  15000 |
|        2 |        18500 |          2 | Credit Card    | Completed      |  25000 |
|        3 |        32000 |          3 | Debit Card     | Pending        |  12000 |
|        4 |        12500 |          4 | Cash           | Completed      |  18000 |
|        5 |        45000 |          5 | UPI            | Failed         |  22000 |
|        6 |        15500 |          6 | Net Banking    | Completed      |  30000 |
|        7 |        28000 |          7 | Credit Card    | Pending        |  10000 |
|        8 |        21000 |          8 | UPI            | Completed      |  27000 |
|        9 |        37500 |          9 | Debit Card     | Completed      |  14000 |
|       10 |        19500 |         10 | Net Banking    | Completed      |  20000 |

--Product and Order_Details

SELECT P.Product_ID,
       P.Product_Name,
       OD.Order_ID,
       OD.Quantity
FROM Product P
INNER JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID;

PRODUCT_ID PRODUCT_NAME       ORDER_ID   QUANTITY
---------- ------------------ ---------- ----------
         1 Sofa                        1          4
         2 Dining Table                2          1
         3 Office Chair                3          2
         4 Bed                         4          1
         5 Bookshelf                   5          3
         6 Coffee Table                6          2
         7 Wardrobe                    7          2
         8 TV Unit                     8          1
         9 Study Table                 9          3
        10 Recliner Chair             10          1

10 rows selected.

--Display All Customers and Their Orders

SELECT C.Customer_ID,
       C.Customer_Name,
       O.Order_ID,
       O.Order_Date,
       O.Total_Amount
FROM Customer C
LEFT JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME  ORDER_ID ORDER_DAT TOTAL_AMOUNT
----------- -------------- -------- --------- ------------
          1 Arun                  1 01-SEP-26        25000
          2 Priya                 2 02-SEP-26        18500
          3 Rahul                 3 03-SEP-26        32000
          4 Sneha                 4 04-SEP-26        12500
          5 Karthik               5 05-SEP-26        45000
          6 Divya                 6 06-SEP-26        15500
          7 Vijay                 7 07-SEP-26        28000
          8 Meena                 8 08-SEP-26        21000
          9 Ajay                  9 09-SEP-26        37500
         10 Nisha                10 10-SEP-26        19500

10 rows selected.

--Display All Orders and Customer Details

SELECT C.Customer_ID,
       C.Customer_Name,
       O.Order_ID,
       O.Order_Date,
       O.Total_Amount
FROM Customer C
RIGHT JOIN Orders O
ON C.Customer_ID = O.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME ORDER_ID ORDER_DATE TOTAL_AMOUNT
----------- ------------- -------- ---------- ------------
          1 Arun                 1 01-SEP-26        25000
          2 Priya                2 02-SEP-26        18500
          3 Rahul                3 03-SEP-26        32000
          4 Sneha                4 04-SEP-26        12500
          5 Karthik              5 05-SEP-26        45000
          6 Divya                6 06-SEP-26        15500
          7 Vijay                7 07-SEP-26        28000
          8 Meena                8 08-SEP-26        21000
          9 Ajay                 9 09-SEP-26        37500
         10 Nisha               10 10-SEP-26        19500

10 rows selected.

--Complete Order Details

SELECT O.Order_ID,
O.Order_Date,
O.Total_Amount,
C.Customer_ID,
C.Customer_Name,
P.Product_ID,
P.Product_Name,
OD.Quantity,
PM.Payment_Method,
PM.Payment_Status
FROM Orders O
INNER JOIN Customer C
ON O.Customer_ID = C.Customer_ID
INNER JOIN Order_Details OD
ON O.Order_ID = OD.Order_ID
INNER JOIN Product P
ON OD.Product_ID = P.Product_ID
LEFT JOIN Payment PM
ON O.Order_ID = PM.Order_ID;

  ORDER_ID ORDER_DATE TOTAL_AMOUNT CUSTOMER_ID CUSTOMER_NAME PRODUCT_ID PRODUCT_NAME    QUANTITY PAYMENT_METHOD PAYMENT_STATUS
---------- ---------- ------------ ----------- ------------- ---------- ------------- ---------- -------------- --------------
         1 01-SEP-26        25000           1 Arun                   1 Sofa                   4 UPI            Completed
         2 02-SEP-26        18500           2 Priya                  2 Dining Table           1 Credit Card    Completed
         3 03-SEP-26        32000           3 Rahul                  3 Office Chair           2 Debit Card     Pending
         4 04-SEP-26        12500           4 Sneha                  4 Bed                    1 Cash           Completed
         5 05-SEP-26        45000           5 Karthik                5 Bookshelf              3 UPI            Failed
         6 06-SEP-26        15500           6 Divya                  6 Coffee Table           2 Net Banking    Completed
         7 07-SEP-26        28000           7 Vijay                  7 Wardrobe               2 Credit Card    Pending
         8 08-SEP-26        21000           8 Meena                  8 TV Unit                1 UPI            Completed
         9 09-SEP-26        37500           9 Ajay                   9 Study Table            3 Debit Card     Completed
        10 10-SEP-26        19500          10 Nisha                 10 Recliner Chair        1 Net Banking    Completed

10 rows selected.

--Customer Purchase History

SELECT C.Customer_ID,
C.Customer_Name,
O.Order_ID,
O.Order_Date,
P.Product_Name,
OD.Quantity,
O.Total_Amount
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
INNER JOIN Order_Details OD
ON O.Order_ID = OD.Order_ID
INNER JOIN Product P
ON OD.Product_ID = P.Product_ID
ORDER BY C.Customer_ID;


CUSTOMER_ID CUSTOMER_NAME ORDER_ID ORDER_DATE PRODUCT_NAME    QUANTITY TOTAL_AMOUNT
----------- ------------- -------- ---------- --------------- -------- ------------
          1 Arun                 1 01-SEP-26  Sofa                     4        25000
          2 Priya                2 02-SEP-26  Dining Table             1        18500
          3 Rahul                3 03-SEP-26  Office Chair             2        32000
          4 Sneha                4 04-SEP-26  Bed                      1        12500
          5 Karthik              5 05-SEP-26  Bookshelf                3        45000
          6 Divya                6 06-SEP-26  Coffee Table             2        15500
          7 Vijay                7 07-SEP-26  Wardrobe                 2        28000
          8 Meena                8 08-SEP-26  TV Unit                  1        21000
          9 Ajay                 9 09-SEP-26  Study Table              3        37500
         10 Nisha               10 10-SEP-26  Recliner Chair           1        19500

10 rows selected.

--Customer Purchase History with Payment

SELECT C.Customer_ID,
C.Customer_Name,
O.Order_ID,
O.Order_Date,
P.Product_Name,
OD.Quantity,
O.Total_Amount,
PM.Payment_Method,
PM.Payment_Status
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
INNER JOIN Order_Details OD
ON O.Order_ID = OD.Order_ID
INNER JOIN Product P
ON OD.Product_ID = P.Product_ID
LEFT JOIN Payment PM
ON O.Order_ID = PM.Order_ID
ORDER BY C.Customer_ID;

CUSTOMER_ID CUSTOMER_NAME ORDER_ID ORDER_DATE PRODUCT_NAME    QUANTITY TOTAL_AMOUNT PAYMENT_METHOD PAYMENT_STATUS
----------- ------------- -------- ---------- --------------- -------- ------------ -------------- --------------
          1 Arun                 1 01-SEP-26  Sofa                     4        25000 UPI            Completed
          2 Priya                2 02-SEP-26  Dining Table             1        18500 Credit Card    Completed
          3 Rahul                3 03-SEP-26  Office Chair             2        32000 Debit Card     Pending
          4 Sneha                4 04-SEP-26  Bed                      1        12500 Cash           Completed
          5 Karthik              5 05-SEP-26  Bookshelf                3        45000 UPI            Failed
          6 Divya                6 06-SEP-26  Coffee Table             2        15500 Net Banking    Completed
          7 Vijay                7 07-SEP-26  Wardrobe                 2        28000 Credit Card    Pending
          8 Meena                8 08-SEP-26  TV Unit                  1        21000 UPI            Completed
          9 Ajay                 9 09-SEP-26  Study Table              3        37500 Debit Card     Completed
         10 Nisha               10 10-SEP-26  Recliner Chair           1        19500 Net Banking    Completed

10 rows selected.

--Multi-Table Business Report

SELECT C.Customer_Name,
       COUNT(DISTINCT O.Order_ID) AS Total_Orders,
       SUM(OD.Quantity * OD.Unit_Price) AS Total_Purchase,
       SUM(OD.Quantity) AS Total_Products
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
INNER JOIN Order_Details OD
ON O.Order_ID = OD.Order_ID
GROUP BY C.Customer_Name
ORDER BY Total_Purchase DESC;

CUSTOMER_NAME TOTAL_ORDERS TOTAL_PURCHASE TOTAL_PRODUCTS
------------- ------------ -------------- --------------
Karthik                  1          45000              3
Ajay                     1          37500              3
Rahul                    1          32000              2
Vijay                    1          28000              2
Arun                     1          50000              4
Meena                    1          21000              1
Nisha                    1          19500              1
Priya                    1          16000              1
Divya                    1          15500              2
Sneha                    1          12500              1

10 rows selected.

--Payment Transaction Report

SELECT
O.Order_ID,
C.Customer_Name,
O.Total_Amount,
P.Payment_ID,
P.Payment_Method,
P.Payment_Status,
P.Amount
FROM Customer C
INNER JOIN Orders O
ON C.Customer_ID = O.Customer_ID
INNER JOIN Payment P
ON O.Order_ID = P.Order_ID
ORDER BY O.Order_ID;

CUSTOMER_NAME TOTAL_AMOUNT PAYMENT_ID PAYMENT_METHOD PAYMENT_STATUS AMOUNT
------------- ------------ ---------- -------------- -------------- ----------
Arun                 25000          1 UPI            Completed          15000
Priya                18500          2 Credit Card    Completed          25000
Rahul                32000          3 Debit Card     Pending            12000
Sneha                12500          4 Cash           Completed          18000
Karthik              45000          5 UPI            Failed             22000
Divya                15500          6 Net Banking    Completed          30000
Vijay                28000          7 Credit Card    Pending            10000
Meena                21000          8 UPI            Completed          27000
Ajay                 37500          9 Debit Card     Completed          14000
Nisha                19500         10 Net Banking    Completed          20000

10 rows selected.
