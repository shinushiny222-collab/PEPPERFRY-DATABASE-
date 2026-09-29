CREATE TABLE PepperfrySeller (
    Seller_ID NUMBER PRIMARY KEY,
    Seller_Name VARCHAR2(100),
    Contact_Number VARCHAR2(15),
    Email VARCHAR2(100),
    Address VARCHAR2(200)
);

Table created.

INSERT INTO PepperfrySeller VALUES
(1, 'Urban Wood Furnitures', '9876500011',
 'urbanwood@gmail.com', 'Chennai');

1 row created.

INSERT INTO PepperfrySeller VALUES
(2, 'Home Comforts', '9876500012',
 'homecomforts@gmail.com', 'Tambaram');

1 row created.

INSERT INTO PepperfrySeller VALUES
(3, 'Wooden World', '9876500013',
 'woodenworld@gmail.com', 'Velachery');

1 row created.

INSERT INTO PepperfrySeller VALUES
(4, 'Modern Living', '9876500014',
 'modernliving@gmail.com', 'Adyar');

1 row created.

INSERT INTO PepperfrySeller VALUES
(5, 'Elegant Furniture', '9876500015',
 'elegantfurniture@gmail.com', 'Chrompet');

1 row created.

INSERT INTO PepperfrySeller VALUES
(6, 'Comfort Zone', '9876500016',
 'comfortzone@gmail.com', 'Guindy');

1 row created.

INSERT INTO PepperfrySeller VALUES
(7, 'Royal Home Decor', '9876500017',
 'royalhome@gmail.com', 'Porur');

1 row created.

INSERT INTO PepperfrySeller VALUES
(8, 'Classic Furnishings', '9876500018',
 'classicfurnishings@gmail.com', 'Anna Nagar');

1 row created.

INSERT INTO PepperfrySeller VALUES
(9, 'Smart Furniture Hub', '9876500019',
 'smartfurniture@gmail.com', 'Mylapore');

1 row created.

INSERT INTO PepperfrySeller VALUES
(10, 'Home Style Traders', '9876500020',
 'homestyle@gmail.com', 'T Nagar');

1 row created.

SQL> SELECT * FROM PepperfrySeller;

 SELLER_ID SELLER_NAME
---------- --------------------------------------------------
CONTACT_NUMBER  EMAIL
--------------- ----------------------------------------------
ADDRESS
--------------------------------------------------------------
         1 Urban Wood Furnitures
9876500011      urbanwood@gmail.com
Chennai

         2 Home Comforts
9876500012      homecomforts@gmail.com
Tambaram

         3 Wooden World
9876500013      woodenworld@gmail.com
Velachery

         4 Modern Living
9876500014      modernliving@gmail.com
Adyar

         5 Elegant Furniture
9876500015      elegantfurniture@gmail.com
Chrompet

         6 Comfort Zone
9876500016      comfortzone@gmail.com
Guindy

         7 Royal Home Decor
9876500017      royalhome@gmail.com
Porur

         8 Classic Furnishings
9876500018      classicfurnishings@gmail.com
Anna Nagar

         9 Smart Furniture Hub
9876500019      smartfurniture@gmail.com
Mylapore

        10 Home Style Traders
9876500020      homestyle@gmail.com
T Nagar

10 rows selected.

CREATE TABLE PepperfryInventory (
    Inventory_ID NUMBER PRIMARY KEY,
    Product_ID NUMBER,
    Seller_ID NUMBER,
    Stock_Quantity NUMBER,
    Stock_Status VARCHAR2(20),
    FOREIGN KEY (Seller_ID)
    REFERENCES PepperfrySeller(Seller_ID)
);

Table created.

INSERT INTO PepperfryInventory VALUES
(1, 101, 1, 25, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(2, 102, 2, 15, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(3, 103, 3, 30, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(4, 104, 4, 10, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(5, 105, 5, 20, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(6, 106, 6, 8, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(7, 107, 7, 12, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(8, 108, 8, 5, 'Available');

1 row created.

INSERT INTO PepperfryInventory VALUES
(9, 109, 9, 0, 'Unavailable');

1 row created.

INSERT INTO PepperfryInventory VALUES
(10, 110, 10, 18, 'Available');

1 row created.

SQL> SELECT * FROM PepperfryInventory;

INVENTORY_ID PRODUCT_ID  SELLER_ID STOCK_QUANTITY STOCK_STATUS
------------ ---------- ---------- -------------- --------------------
           1        101          1             25 Available
           2        102          2             15 Available
           3        103          3             30 Available
           4        104          4             10 Available
           5        105          5             20 Available
           6        106          6              8 Available
           7        107          7             12 Available
           8        108          8              5 Available
           9        109          9              0 Unavailable
          10        110         10             18 Available

10 rows selected.

SQL> SELECT
  2      s.Seller_ID,
  3      s.Seller_Name,
  4      p.Product_ID,
  5      p.Product_Name,
  6      p.Price,
  7      i.Stock_Quantity,
  8      i.Stock_Status
  9  FROM PepperfrySeller s
 10  JOIN PepperfryInventory i
 11  ON s.Seller_ID = i.Seller_ID
 12  JOIN PepperfryProduct p
 13  ON i.Product_ID = p.Product_ID
 14  ORDER BY s.Seller_ID;


SELLER_ID  SELLER_NAME             PRODUCT_ID  PRODUCT_NAME
---------  ----------------------  ----------  --------------------
        1  Urban Wood Furnitures          101  Wooden Sofa
        2  Home Comforts                  102  Dining Table
        3  Wooden World                   103  Queen Bed
        4  Modern Living                  104  Office Chair
        5  Elegant Furniture              105  Bookshelf
        6  Comfort Zone                   106  Recliner
        7  Royal Home Decor               107  TV Unit
        8  Classic Furnishings             108  Coffee Table
        9  Smart Furniture Hub             109  Shoe Rack
       10  Home Style Traders              110  Wardrobe


PRICE       STOCK_QUANTITY  STOCK_STATUS
----------  --------------  --------------------
  24999               25    Available
  18999               15    Available
  32999               30    Available
   8999               10    Available
   7499               20    Available
  15999                8    Available
  12999               12    Available
   5999                5    Available
   4499                0    Unavailable
  21999               18    Available

10 rows selected.

SELECT
    p.Product_ID,
    p.Product_Name,
    s.Seller_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM PepperfryInventory i
JOIN PepperfryProduct p
ON i.Product_ID = p.Product_ID
JOIN PepperfrySeller s
ON i.Seller_ID = s.Seller_ID
WHERE i.Stock_Status = 'Available';

PRODUCT_ID  PRODUCT_NAME        SELLER_NAME             STOCK_QUANTITY
----------  ------------------  ----------------------  --------------
       101  Wooden Sofa         Urban Wood Furnitures              25
       102  Dining Table        Home Comforts                      15
       103  Queen Bed           Wooden World                       30
       104  Office Chair        Modern Living                      10
       105  Bookshelf           Elegant Furniture                  20
       106  Recliner            Comfort Zone                        8
       107  TV Unit             Royal Home Decor                   12
       108  Coffee Table        Classic Furnishings                 5
       110  Wardrobe            Home Style Traders                 18

9 rows selected.

SELECT
    p.Product_ID,
    p.Product_Name,
    s.Seller_Name,
    i.Stock_Quantity,
    i.Stock_Status
FROM PepperfryInventory i
JOIN PepperfryProduct p
ON i.Product_ID = p.Product_ID
JOIN PepperfrySeller s
ON i.Seller_ID = s.Seller_ID
WHERE i.Stock_Status = 'Unavailable';

PRODUCT_ID  PRODUCT_NAME  SELLER_NAME             STOCK_QUANTITY
----------  ------------  ----------------------  --------------
       109  Shoe Rack     Smart Furniture Hub                  0

1 row selected.
  
