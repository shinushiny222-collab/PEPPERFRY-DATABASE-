CREATE TABLE Review(
    Review_ID NUMBER PRIMARY KEY,
    Customer_ID NUMBER,
    Product_ID NUMBER,
    Review_Text VARCHAR2(200),
    Review_Date DATE,
    FOREIGN KEY (Customer_ID)
    REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Product_ID)
    REFERENCES Product(Product_ID)
);

--Table created.

INSERT INTO Review
VALUES (1, 1, 1, 'Excellent sofa with good quality',
TO_DATE('01-09-2026','DD-MM-YYYY'));

--1 row created.
  
INSERT INTO Review
VALUES (2, 2, 2, 'Comfortable and stylish chair',
TO_DATE('03-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (3, 3, 3, 'Good quality dining table',
TO_DATE('05-09-2026','DD-MM-YYYY'));

--1 row created.


INSERT INTO Review
VALUES (4, 4, 4, 'Nice wooden bed',
TO_DATE('07-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (5, 5, 5, 'Strong and spacious wardrobe',
TO_DATE('09-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (6, 6, 6, 'Very useful study table',
TO_DATE('11-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (7, 7, 7, 'Average quality but good design',
TO_DATE('13-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (8, 8, 8, 'Beautiful coffee table',
TO_DATE('15-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (9, 9, 9, 'Excellent bookshelf and finish',
TO_DATE('17-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Review
VALUES (10, 10, 10, 'Good product for the price',
TO_DATE('19-09-2026','DD-MM-YYYY'));

--1 row created.

SELECT * FROM Review;

--REVIEW_ID  CUSTOMER_ID  PRODUCT_ID  REVIEW_TEXT                         REVIEW_DATE
---------  -----------  ----------  ----------------------------------  -----------
--1          1            1           Excellent sofa with good quality    01-SEP-26
--2          2            2           Comfortable and stylish chair      03-SEP-26
--3          3            3           Good quality dining table          05-SEP-26
--4          4            4           Nice wooden bed                    07-SEP-26
--5          5            5           Strong and spacious wardrobe        09-SEP-26
--6          6            6           Very useful study table             11-SEP-26
--7          7            7           Average quality but good design     13-SEP-26
--8          8            8           Beautiful coffee table              15-SEP-26
--9          9            9           Excellent bookshelf and finish     17-SEP-26
--10         10           10          Good product for the price         19-SEP-26

CREATE TABLE Rating(
    Rating_ID NUMBER PRIMARY KEY,
    Review_ID NUMBER,
    Rating_Value NUMBER(1) CHECK (Rating_Value BETWEEN 1 AND 5),
    Rating_Date DATE,
    FOREIGN KEY (Review_ID)
    REFERENCES Review(Review_ID)
);

--Table created.

INSERT INTO Rating VALUES
(1, 1, 5, TO_DATE('01-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(2, 2, 4, TO_DATE('03-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(3, 3, 5, TO_DATE('05-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(4, 4, 3, TO_DATE('07-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(5, 5, 4, TO_DATE('09-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(6, 6, 5, TO_DATE('11-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(7, 7, 2, TO_DATE('13-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(8, 8, 4, TO_DATE('15-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(9, 9, 5, TO_DATE('17-09-2026','DD-MM-YYYY'));

--1 row created.

INSERT INTO Rating VALUES
(10, 10, 3, TO_DATE('19-09-2026','DD-MM-YYYY'));

--1 row created.

SELECT * FROM Rating;

--RATING_ID  REVIEW_ID  RATING_VALUE  RATING_DATE
---------  ---------  ------------  -----------
--1          1          5             01-SEP-26
--2          2          4             03-SEP-26
--3          3          5             05-SEP-26
--4          4          3             07-SEP-26
--5          5          4             09-SEP-26
--6          6          5             11-SEP-26
--7          7          2             13-SEP-26
--8          8          4             15-SEP-26
--9          9          5             17-SEP-26
--10         10         3             19-SEP-26

SELECT
    P.Product_ID,
    P.Product_Name,
    R.Review_ID,
    R.Customer_ID,
    R.Review_Text,
    R.Review_Date
FROM Product P
JOIN Review R
ON P.Product_ID = R.Product_ID;

--PRODUCT_ID  PRODUCT_NAME       REVIEW_ID  CUSTOMER_ID  REVIEW_TEXT
----------  -----------------  ---------  -----------  ------------------------------
--1           Wooden Sofa        1          1            Excellent sofa with good quality
--2           Office Chair      2          2            Comfortable and stylish chair
--3           Dining Table      3          3            Good quality dining table
--4           King Size Bed     4          4            Nice wooden bed
--5           Wooden Wardrobe   5          5            Strong and spacious wardrobe
--6           Study Table       6          6            Very useful study table
--7           Bookshelf         7          7            Average quality but good design
--8           Coffee Table      8          8            Beautiful coffee table
--9           Recliner Chair    9          9            Excellent bookshelf and finish
--10          TV Unit           10         10           Good product for the price

SELECT
    P.Product_ID,
    P.Product_Name,
    AVG(RT.Rating_Value) AS Average_Rating
FROM Product P
JOIN Review R
ON P.Product_ID = R.Product_ID
JOIN Rating RT
ON R.Review_ID = RT.Review_ID
GROUP BY
    P.Product_ID,
    P.Product_Name
ORDER BY P.Product_ID;

--PRODUCT_ID  PRODUCT_NAME       AVERAGE_RATING
----------  -----------------  --------------
--1           Wooden Sofa                 5
--2           Office Chair                4
--3           Dining Table                5
--4           King Size Bed               3
--5           Wooden Wardrobe             4
--6           Study Table                 5
--7           Bookshelf                   2
--8           Coffee Table                4
--9           Recliner Chair              5
--10          TV Unit                     3


SELECT
    P.Product_ID,
    P.Product_Name,
    AVG(RT.Rating_Value) AS Average_Rating
FROM Product P
JOIN Review R
ON P.Product_ID = R.Product_ID
JOIN Rating RT
ON R.Review_ID = RT.Review_ID
GROUP BY
    P.Product_ID,
    P.Product_Name
HAVING AVG(RT.Rating_Value) >= 4
ORDER BY Average_Rating DESC;

--PRODUCT_ID  PRODUCT_NAME        AVERAGE_RATING
----------  ------------------  --------------
--1           Wooden Sofa                  5
--3           Dining Table                5
--6           Study Table                  5
--9           Recliner Chair              5
--2           Office Chair                 4
--5           Wooden Wardrobe              4
--8           Coffee Table                 4

SELECT
    P.Product_ID,
    P.Product_Name,
    COUNT(RT.Rating_ID) AS Total_Ratings,
    AVG(RT.Rating_Value) AS Average_Rating,
    MIN(RT.Rating_Value) AS Minimum_Rating,
    MAX(RT.Rating_Value) AS Maximum_Rating
FROM Product P
JOIN Review R
ON P.Product_ID = R.Product_ID
JOIN Rating RT
ON R.Review_ID = RT.Review_ID
GROUP BY
    P.Product_ID,
    P.Product_Name
ORDER BY P.Product_ID;

--PRODUCT_ID  PRODUCT_NAME        TOTAL_RATINGS  AVERAGE_RATING  MINIMUM_RATING  MAXIMUM_RATING
----------  ------------------  -------------  --------------  --------------  --------------
--1           Wooden Sofa                1               5               5               5
--2           Office Chair               1               4               4               4
--3           Dining Table               1               5               5               5
--4           King Size Bed              1               3               3               3
--5           Wooden Wardrobe            1               4               4               4
--6           Study Table                1               5               5               5
--7           Bookshelf                  1               2               2               2
--8           Coffee Table               1               4               4               4
--9           Recliner Chair             1               5               5               5
--10          TV Unit                   1               3               3               3

COMMIT;

--Commit complete.
