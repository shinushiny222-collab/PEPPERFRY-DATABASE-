-- ==================================================
-- 1. CREATE CUSTOMER TABLE
-- ==================================================

CREATE TABLE Customer (
    Customer_ID NUMBER PRIMARY KEY,
    First_Name VARCHAR2(50) NOT NULL,
    Last_Name VARCHAR2(50),
    Email VARCHAR2(100) UNIQUE,
    Phone_Number VARCHAR2(15) UNIQUE,
    Address VARCHAR2(150) NOT NULL,
    Registration_Date DATE DEFAULT SYSDATE
);


-- ==================================================
-- 2. INSERT 10 CUSTOMER RECORDS
-- ==================================================

INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(101, 'Ananya', 'Sharma', 'ananya@gmail.com', '9876543210', 'Chennai');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(102, 'Priya', 'Kumar', 'priya@gmail.com', '9876543211', 'Coimbatore');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(103, 'Divya', 'Raj', 'divya@gmail.com', '9876543212', 'Madurai');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(104, 'Keerthi', 'S', 'keerthi@gmail.com', '9876543213', 'Salem');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(105, 'Nisha', 'M', 'nisha@gmail.com', '9876543214', 'Trichy');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(106, 'Kavya', 'Ravi', 'kavya@gmail.com', '9876543215', 'Chennai');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(107, 'Meena', 'Krishnan', 'meena@gmail.com', '9876543216', 'Bengaluru');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(108, 'Aarthi', 'Prasad', 'aarthi@gmail.com', '9876543217', 'Hyderabad');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(109, 'Lakshmi', 'Devi', 'lakshmi@gmail.com', '9876543218', 'Pondicherry');


INSERT INTO Customer
(Customer_ID, First_Name, Last_Name, Email, Phone_Number, Address)
VALUES
(110, 'Sneha', 'Bala', 'sneha@gmail.com', '9876543219', 'Tirunelveli');


COMMIT;


-- ==================================================
-- 3. SELECT OPERATIONS
-- ==================================================

-- Display all customer details

SELECT * FROM Customer;


-- Display selected columns

SELECT Customer_ID, First_Name, Email
FROM Customer;


-- Display customers from Chennai

SELECT *
FROM Customer
WHERE Address = 'Chennai';


-- Display customers with Customer ID greater than 105

SELECT *
FROM Customer
WHERE Customer_ID > 105;


-- ==================================================
-- 4. UPDATE OPERATIONS
-- ==================================================

-- Update 1: Change address of Customer 103

UPDATE Customer
SET Address = 'Bengaluru'
WHERE Customer_ID = 103;


-- Update 2: Change phone number of Customer 104

UPDATE Customer
SET Phone_Number = '9998887776'
WHERE Customer_ID = 104;


-- Update 3: Change email of Customer 106

UPDATE Customer
SET Email = 'kavya.ravi@gmail.com'
WHERE Customer_ID = 106;


-- Update 4: Change address of Customer 109

UPDATE Customer
SET Address = 'Chennai'
WHERE Customer_ID = 109;


COMMIT;


-- Display updated records

SELECT *
FROM Customer
WHERE Customer_ID IN (103, 104, 106, 109);


-- ==================================================
-- 5. DELETE OPERATIONS
-- ==================================================

-- Delete Customer 110

DELETE FROM Customer
WHERE Customer_ID = 110;


-- Delete Customer 108

DELETE FROM Customer
WHERE Customer_ID = 108;


-- Delete Customer 107

DELETE FROM Customer
WHERE Customer_ID = 107;


-- Delete Customer 105

DELETE FROM Customer
WHERE Customer_ID = 105;


COMMIT;


-- ==================================================
-- 6. FINAL SELECT OPERATION
-- ==================================================

SELECT *
FROM Customer;