CREATE TABLE Payment (
    Payment_ID NUMBER(10) PRIMARY KEY,
    Order_ID NUMBER(10),
    Payment_Method VARCHAR2(30) NOT NULL,
    Payment_Status VARCHAR2(20) NOT NULL,
    Payment_Date DATE,
    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID)
);

Table created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(501, 1, 'UPI', 'Completed', TO_DATE('2026-09-01','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(502, 2, 'Credit Card', 'Completed', TO_DATE('2026-09-02','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(503, 3, 'Debit Card', 'Pending', TO_DATE('2026-09-03','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(504, 4, 'Cash on Delivery', 'Pending', TO_DATE('2026-09-04','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(505, 5, 'Net Banking', 'Completed', TO_DATE('2026-09-05','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(506, 6, 'UPI', 'Completed', TO_DATE('2026-09-06','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(507, 7, 'Credit Card', 'Failed', TO_DATE('2026-09-07','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(508, 8, 'Debit Card', 'Completed', TO_DATE('2026-09-08','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(509, 9, 'UPI', 'Completed', TO_DATE('2026-09-09','YYYY-MM-DD'));

1 row created.

INSERT INTO Payment
(Payment_ID, Order_ID, Payment_Method, Payment_Status, Payment_Date)
VALUES
(510, 10, 'Cash on Delivery', 'Pending', TO_DATE('2026-09-10','YYYY-MM-DD'));

1 row created.

SELECT * FROM Payment;

| PAYMENT_ID | ORDER_ID | PAYMENT_METHOD   | PAYMENT_STATUS | PAYMENT_DATE |
| ---------: | -------: | ---------------- | -------------- | ------------ |
|        501 |        1 | UPI              | Completed      | 01-SEP-26    |
|        502 |        2 | Credit Card      | Completed      | 02-SEP-26    |
|        503 |        3 | Debit Card       | Pending        | 03-SEP-26    |
|        504 |        4 | Cash on Delivery | Pending        | 04-SEP-26    |
|        505 |        5 | Net Banking      | Completed      | 05-SEP-26    |
|        506 |        6 | UPI              | Completed      | 06-SEP-26    |
|        507 |        7 | Credit Card      | Failed         | 07-SEP-26    |
|        508 |        8 | Debit Card       | Completed      | 08-SEP-26    |
|        509 |        9 | UPI              | Completed      | 09-SEP-26    |
|        510 |       10 | Cash on Delivery | Pending        | 10-SEP-26    |

SELECT *
FROM Payment
WHERE Payment_Status = 'Completed';

| PAYMENT_ID | ORDER_ID | PAYMENT_METHOD | PAYMENT_STATUS | PAYMENT_DATE |
| ---------: | -------: | -------------- | -------------- | ------------ |
|        501 |        1 | UPI            | Completed      | 01-SEP-26    |
|        502 |        2 | Credit Card    | Completed      | 02-SEP-26    |
|        505 |        5 | Net Banking    | Completed      | 05-SEP-26    |
|        506 |        6 | UPI            | Completed      | 06-SEP-26    |
|        508 |        8 | Debit Card     | Completed      | 08-SEP-26    |
|        509 |        9 | UPI            | Completed      | 09-SEP-26    |

SELECT *
FROM Payment
WHERE Payment_Status = 'Failed';

| PAYMENT_ID | ORDER_ID | PAYMENT_METHOD | PAYMENT_STATUS | PAYMENT_DATE |
| ---------: | -------: | -------------- | -------------- | ------------ |
|        507 |        7 | Credit Card    | Failed         | 07-SEP-26    |

UPDATE Payment
SET Payment_Status = 'Completed'
WHERE Payment_ID = 503;

1 row updated.

COMMIT; 

Commit complete.

SELECT Payment_ID, Order_ID, Payment_Status
FROM Payment
WHERE Payment_ID = 503;

| PAYMENT_ID | ORDER_ID | PAYMENT_STATUS |
| ---------: | -------: | -------------- |
|        503 |        3 | Completed      |


SELECT 
    Payment_Method,
    COUNT(*) AS Total_Payments
FROM Payment
GROUP BY Payment_Method
ORDER BY Total_Payments DESC;

| PAYMENT_METHOD   | TOTAL_PAYMENTS |
| ---------------- | -------------: |
| UPI              |              3 |
| Credit Card      |              2 |
| Debit Card       |              2 |
| Cash on Delivery |              2 |
| Net Banking      |              1 |


SELECT 
    P.Payment_Method,
    SUM(O.Total_Amount) AS Total_Amount
FROM Payment P
INNER JOIN Orders O
ON P.Order_ID = O.Order_ID
GROUP BY P.Payment_Method
ORDER BY Total_Amount DESC;

| PAYMENT_METHOD   | TOTAL_AMOUNT |
| ---------------- | -----------: |
| UPI              |        70000 |
| Credit Card      |        63000 |
| Net Banking      |        45000 |
| Debit Card       |        47000 |
| Cash on Delivery |        35000 |


SELECT 
    P.Payment_ID,
    P.Order_ID,
    O.Order_Date,
    O.Total_Amount,
    P.Payment_Method,
    P.Payment_Status,
    P.Payment_Date
FROM Payment P
INNER JOIN Orders O
ON P.Order_ID = O.Order_ID
ORDER BY P.Payment_Date;

| PAYMENT_ID | ORDER_ID | ORDER_DATE | TOTAL_AMOUNT | PAYMENT_METHOD   | PAYMENT_STATUS | PAYMENT_DATE |
| ---------: | -------: | ---------- | -----------: | ---------------- | -------------- | ------------ |
|        501 |        1 | 01-SEP-26  |        25000 | UPI              | Completed      | 01-SEP-26    |
|        502 |        2 | 02-SEP-26  |        18000 | Credit Card      | Completed      | 02-SEP-26    |
|        503 |        3 | 03-SEP-26  |        32000 | Debit Card       | Completed      | 03-SEP-26    |
|        504 |        4 | 04-SEP-26  |        15000 | Cash on Delivery | Pending        | 04-SEP-26    |
|        505 |        5 | 05-SEP-26  |        45000 | Net Banking      | Completed      | 05-SEP-26    |


COMMIT;
