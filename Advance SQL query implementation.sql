SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > (SELECT AVG(Price) FROM Product);



PRODUCT_ID  PRODUCT_NAME       PRICE
----------  ----------------  -----
1           Sofa              25000
3           Office Chair      32000
5           Bookshelf         45000
7           Wardrobe          28000
9           Study Table       37500



SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price > (SELECT AVG(Price) FROM Product);



PRODUCT_ID  PRODUCT_NAME       PRICE
1           Sofa               25000
3           Office Chair       32000
5           Bookshelf          45000
7           Wardrobe           28000
9           Study Table        37500



SELECT Product_ID, Product_Name, Price
FROM Product
WHERE Price < (SELECT AVG(Price) FROM Product);



PRODUCT_ID  PRODUCT_NAME       PRICE
2           Dining Table       18500
4           Bed                12500
6           Coffee Table       15500
8           TV Unit            21000
10          Recliner Chair     19500



SELECT Customer_ID, Customer_Name
FROM Customer
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Orders
    WHERE Total_Amount = (
        SELECT MAX(Total_Amount)
        FROM Orders
    )
);



CUSTOMER_ID    CUSTOMER_NAME
-----------    -------------
5              karthik



SELECT Order_ID, Customer_ID, Total_Amount
FROM Orders
WHERE Total_Amount = (
    SELECT MAX(Total_Amount)
    FROM Orders
);



ORDER_ID    CUSTOMER_ID    TOTAL_AMOUNT
--------    -----------    ------------
5           5              45000


SELECT
    C.Customer_ID,
    C.Customer_Name,
    SUM(O.Total_Amount) AS Total_Purchase
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY
    C.Customer_ID,
    C.Customer_Name
HAVING SUM(O.Total_Amount) = (
    SELECT MAX(Total_Purchase)
    FROM (
        SELECT SUM(Total_Amount) AS Total_Purchase
        FROM Orders
        GROUP BY Customer_ID
    )
);



CUSTOMER_ID  CUSTOMER_NAME  TOTAL_PURCHASE
-----------  -------------  --------------
5            karthik     45000



SELECT
    C.Customer_ID,
    C.Customer_Name,
    O.Order_ID,
    O.Total_Amount
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
WHERE O.Total_Amount > (
    SELECT AVG(Total_Amount)
    FROM Orders
);



SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OD.Quantity * OD.Price) AS Total_Sales
FROM Product P
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY
    P.Product_ID,
    P.Product_Name
HAVING SUM(OD.Quantity * OD.Price) > (
    SELECT AVG(Total_Sales)
    FROM (
        SELECT SUM(Quantity * Price) AS Total_Sales
        FROM Order_Details
        GROUP BY Product_ID
    )
);



SELECT
    C.Customer_ID,
    C.Customer_Name,
    COUNT(O.Order_ID) AS Total_Orders,
    SUM(O.Total_Amount) AS Total_Purchase
FROM Customer C
JOIN Orders O
ON C.Customer_ID = O.Customer_ID
GROUP BY
    C.Customer_ID,
    C.Customer_Name
ORDER BY
    Total_Purchase DESC;



SELECT
    P.Product_ID,
    P.Product_Name,
    SUM(OD.Quantity) AS Total_Quantity_Sold,
    SUM(OD.Quantity * P.Price) AS Total_Sales,
    AVG(P.Price) AS Average_Price
FROM Product P
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY
    P.Product_ID,
    P.Product_Name
ORDER BY
    Total_Sales DESC;



PRODUCT_ID  PRODUCT_NAME    TOTAL_QUANTITY_SOLD  TOTAL_SALES  AVERAGE_PRICE
----------  --------------  -------------------  -----------  -------------
5           Bookshelf       3                    135000       45000
3           Office Chair    2                    64000        32000
9           Study Table     3                    112500       37500
7           Wardrobe        2                    56000        28000
1           Sofa            4                    100000       25000



SELECT
    C.Category_ID,
    C.Category_Name,
    COUNT(DISTINCT P.Product_ID) AS Total_Products,
    SUM(OD.Quantity) AS Total_Quantity_Sold,
    SUM(OD.Quantity * P.Price) AS Total_Sales,
    AVG(P.Price) AS Average_Price
FROM Category C
JOIN Product P
ON C.Category_ID = P.Category_ID
JOIN Order_Details OD
ON P.Product_ID = OD.Product_ID
GROUP BY
    C.Category_ID,
    C.Category_Name
ORDER BY
    Total_Sales DESC;