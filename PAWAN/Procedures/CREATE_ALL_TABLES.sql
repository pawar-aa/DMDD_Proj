create or replace PROCEDURE CREATE_ALL_TABLES IS

V_COUNT NUMBER;

BEGIN

-------------------------------------------------------------------------------
--DDL FOR USER_TABLE
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='USER_TABLE';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE USER_TABLE (
                    USER_ID INT PRIMARY KEY
                    ,FIRST_NAME VARCHAR (200)
                    ,LAST_NAME VARCHAR(200)
                    ,PHONE_NUMBER INT
                    ,LOYALTY_DISC FLOAT 
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE USER_TABLE CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

-------------------------------------------------------------------------------
--DDL FOR ADDRESS
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='ADDRESS';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE ADDRESS(
                    ADDRESS_ID INT PRIMARY KEY,
                    USER_ID INT ,
                    CONSTRAINT ADDRESS_TABLE_FK1 FOREIGN KEY (USER_ID) REFERENCES USER_TABLE(USER_ID)
                    ,ADDRESS VARCHAR(255)
                    ,STREET VARCHAR(255)
                    ,CITY VARCHAR(255)
                    ,STATE VARCHAR(255)
                    ,PIN INT
                    ,COUNTRY VARCHAR(255)
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE ADDRESS CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

-------------------------------------------------------------------------------
--DDL FOR CART
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='CART';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE CART (
                    CART_ID INT PRIMARY KEY
                    ,USER_ID INT ,
                    CONSTRAINT ADDRESS_FK1 FOREIGN KEY (USER_ID) REFERENCES USER_TABLE(USER_ID)
                    ,LOYALTY_DISC FLOAT
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE CART CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR ORDERS
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='ORDERS';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE ORDERS(
                    ORDER_ID INT PRIMARY KEY
                    ,ORDER_STATUS VARCHAR(255)
                    ,USER_ID INT,CONSTRAINT ORDERS_FK1 FOREIGN KEY (USER_ID) REFERENCES USER_TABLE(USER_ID)
                    ,ORDER_DATE DATE
                    ,ADDRESS_ID INT
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE ORDERS CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR LOYALTY_DISCOUNT
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='LOYALTY_DISCOUNT';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE LOYALTY_DISCOUNT(
                    DISCOUNT_ID INT PRIMARY KEY
                    ,USER_ID INT, CONSTRAINT LOYALTY_DISCOUNT_FK1 FOREIGN KEY (USER_ID) REFERENCES USER_TABLE(USER_ID)
                    ,DISCOUNT_PCT INT
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE LOYALTY_DISCOUNT CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;





-------------------------------------------------------------------------------
--DDL FOR PAYMENT_INFO
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='PAYMENT_INFO';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE PAYMENT_INFO(
                    PAYMENT_ID INT PRIMARY KEY
                    ,ORDER_ID INT, CONSTRAINT PAYMENT_INFO_FK1 FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
                    ,PAYMENT_TYPE VARCHAR(40) NOT NULL
                    )'; 
DBMS_OUTPUT.PUT_LINE('TABLE PAYMENT_INFO CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

-------------------------------------------------------------------------------
--DDL FOR SUPPLIER
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='SUPPLIER';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE SUPPLIER(
                    SUPPLIER_ID INT PRIMARY KEY
                    ,SUPPLIER_NAME VARCHAR(200)
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE SUPPLIER CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

-------------------------------------------------------------------------------
--DDL FOR DISCOUNT
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='DISCOUNT';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE DISCOUNT(
                    DISCOUNT_TYPE VARCHAR(220)
                    ,DISCOUNT_ID INT PRIMARY KEY
                    ,DISCOUNT_PCT FLOAT
                    )'; 
DBMS_OUTPUT.PUT_LINE('TABLE DISCOUNT CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR CATEGORY
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='CATEGORY';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE CATEGORY(
                    CATEGORY_ID INT PRIMARY KEY
                    ,CATEGORY_NAME VARCHAR(200)
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE CATEGORY CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

-------------------------------------------------------------------------------
--DDL FOR PRODUCT
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='PRODUCT';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE PRODUCT(
                    PRODUCT_ID INT PRIMARY KEY
                    ,PRODUCT_NAME VARCHAR(255) NOT NULL
                    ,CATEGORY_ID INT NOT NULL,
                    CONSTRAINT PRODUCT_FK1 FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(CATEGORY_ID)
                    ,PRICE FLOAT NOT NULL
                    ,QUANTITY INT
                    ,PRODUCT_DESC VARCHAR(200)
                    )'; 
DBMS_OUTPUT.PUT_LINE('TABLE PRODUCT CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

-------------------------------------------------------------------------------
--DDL FOR CART_ITEM
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='CART_ITEM';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE CART_ITEM(
                    CART_ITEM_ID INT PRIMARY KEY
                    ,CART_ID INT, CONSTRAINT CARTITEM_FK1 FOREIGN KEY (CART_ID) REFERENCES CART(CART_ID)
                    ,PRODUCT_ID INT,  CONSTRAINT CARTITEM_FK2 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
                    ,QUANTITY INT
                    )'; 
DBMS_OUTPUT.PUT_LINE('TABLE CART_ITEM CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR ORDER_ITEM
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='ORDER_ITEM';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE ORDER_ITEM(
                    ORDER_ITEM_ID INT PRIMARY KEY
                    ,ORDER_ID INT, CONSTRAINT ORDER_ITEM_FK1 FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID)
                    ,PRODUCT_ID INT, CONSTRAINT ORDER_ITEM_FK2 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
                    ,QUANTITY INT
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE ORDER_ITEM CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR PRODUCT_SUPPLIER
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='PRODUCT_SUPPLIER';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE PRODUCT_SUPPLIER(
                    PRODUCT_ID INT,
                    CONSTRAINT PRODUCT_SUPPLIER_FK1 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
                    ,SUPPLIER_ID INT,
                    CONSTRAINT PRODUCT_SUPPLIER_FK2 FOREIGN KEY (SUPPLIER_ID) REFERENCES SUPPLIER(SUPPLIER_ID)
                    ,COST_TO_SUPPLIER FLOAT
                    )';  
DBMS_OUTPUT.PUT_LINE('TABLE PRODUCT_SUPPLIER CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR PRODUCT_DISCOUNT
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='PRODUCT_DISCOUNT';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE PRODUCT_DISCOUNT(
                    PRODUCT_ID INT,
                    CONSTRAINT PRODUCT_DISCOUNT_FK1 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
                    ,DISCOUNT_ID INT,
                    CONSTRAINT PRODUCT_DISCOUNT_FK2 FOREIGN KEY (DISCOUNT_ID) REFERENCES DISCOUNT(DISCOUNT_ID)
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE PRODUCT_DISCOUNT CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;


-------------------------------------------------------------------------------
--DDL FOR FEEDBACKS
-------------------------------------------------------------------------------
SELECT COUNT(*) INTO V_COUNT FROM DBA_TABLES WHERE OWNER='ADMIN' AND TABLE_NAME='FEEDBACKS';
IF V_COUNT=0 THEN 
EXECUTE IMMEDIATE 'CREATE TABLE FEEDBACKS(
                    PRODUCT_ID INT,
                    CONSTRAINT FEEBACK_FK1 FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(PRODUCT_ID)
                    ,FEEDBACK_ID INT PRIMARY KEY
                    ,FEEDBACK_ VARCHAR(200)
                    ,RATING INT
                    )';
DBMS_OUTPUT.PUT_LINE('TABLE FEEDBACKS CREATED');
ELSE 
DBMS_OUTPUT.PUT_LINE('TABLE ALREADY EXISTS');
END IF;

END;