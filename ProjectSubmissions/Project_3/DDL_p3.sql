
-------------------------------------------------------------------------------
--              PROJECT PHASE 3   TEAM-16     DMDD6210
--
--Pawan Kumar Krishnan  002743773       Nency Panchani      002746779
--Aashay Pawar          002134382       Keerthanaa Kannan   001593845
-------------------------------------------------------------------------------

SET SERVEROUTPUT ON;
SET FEEDBACK OFF;

declare
v_count number;

begin

-------------------------------------------------------------------------------
--DDL FOR USER_TABLE
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='USER_TABLE';
if v_count=0 then 
execute immediate 'create table User_table (
                    user_id int primary key
                    ,first_name varchar (200)
                    ,last_name varchar(200)
                    ,phone_number int
                    ,loyalty_disc float 
                    )';
dbms_output.put_line('Table USER_TABLE created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR ADDRESS
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='ADDRESS';
if v_count=0 then 
execute immediate 'create table Address(
                    address_id int primary key,
                    user_id int ,
                    CONSTRAINT address_table_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
                    ,address varchar(255)
                    ,street varchar(255)
                    ,city varchar(255)
                    ,state varchar(255)
                    ,pin int
                    ,country varchar(255)
                    )';
dbms_output.put_line('Table ADDRESS created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR CART
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='CART';
if v_count=0 then 
execute immediate 'create table Cart (
                    cart_id int primary key
                    ,user_id int ,
                    CONSTRAINT address_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
                    ,loyalty_disc float
                    )';
dbms_output.put_line('Table CART created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR ORDERS
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='ORDERS';
if v_count=0 then 
execute immediate 'create table Orders(
                    order_id int primary key
                    ,order_status varchar(255)
                    ,user_id int,CONSTRAINT orders_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
                    ,order_date Date
                    ,address_id int
                    )';
dbms_output.put_line('Table ORDERS created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR LOYALTY_DISCOUNT
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='LOYALTY_DISCOUNT';
if v_count=0 then 
execute immediate 'create table Loyalty_discount(
                    discount_id int primary key
                    ,user_id int, CONSTRAINT loyalty_discount_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
                    ,discount_pct int
                    )';
dbms_output.put_line('Table LOYALTY_DISCOUNT created');
else 
dbms_output.put_line('Table already exists');
end if;





-------------------------------------------------------------------------------
--DDL FOR PAYMENT_INFO
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PAYMENT_INFO';
if v_count=0 then 
execute immediate 'create table Payment_info(
                    payment_id int primary key
                    ,order_id int, CONSTRAINT payment_info_fk1 FOREIGN KEY (order_id) REFERENCES Orders(order_id)
                    ,payment_type varchar(40) not null
                    )'; 
dbms_output.put_line('Table PAYMENT_INFO created');
else 
dbms_output.put_line('Table already exists');
end if;

-------------------------------------------------------------------------------
--DDL FOR SUPPLIER
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='SUPPLIER';
if v_count=0 then 
execute immediate 'create table Supplier(
                    supplier_id int primary key
                    ,supplier_name varchar(200)
                    )';
dbms_output.put_line('Table SUPPLIER created');
else 
dbms_output.put_line('Table already exists');
end if;

-------------------------------------------------------------------------------
--DDL FOR DISCOUNT
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='DISCOUNT';
if v_count=0 then 
execute immediate 'create table Discount(
                    discount_type varchar(220)
                    ,discount_id int primary key
                    ,discount_pct float
                    )'; 
dbms_output.put_line('Table DISCOUNT created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR CATEGORY
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='CATEGORY';
if v_count=0 then 
execute immediate 'create table Category(
                    category_id int primary key
                    ,category_name varchar(200)
                    )';
dbms_output.put_line('Table CATEGORY created');
else 
dbms_output.put_line('Table already exists');
end if;

-------------------------------------------------------------------------------
--DDL FOR PRODUCT
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PRODUCT';
if v_count=0 then 
execute immediate 'create table Product(
                    product_id int primary key
                    ,product_name varchar(255) not null
                    ,category_id int not null,
                    CONSTRAINT product_fk1 FOREIGN KEY (category_id) REFERENCES Category(category_id)
                    ,price float not null
                    ,quantity int
                    ,product_desc varchar(200)
                    )'; 
dbms_output.put_line('Table PRODUCT created');
else 
dbms_output.put_line('Table already exists');
end if;

-------------------------------------------------------------------------------
--DDL FOR CART_ITEM
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='CART_ITEM';
if v_count=0 then 
execute immediate 'create table Cart_item(
                    cart_item_id int primary key
                    ,cart_id int, CONSTRAINT cartItem_fk1 FOREIGN KEY (cart_id) REFERENCES Cart(cart_id)
                    ,product_id int,  CONSTRAINT cartItem_fk2 FOREIGN KEY (product_id) REFERENCES Product(product_id)
                    ,quantity int
                    )'; 
dbms_output.put_line('Table CART_ITEM created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR ORDER_ITEM
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='ORDER_ITEM';
if v_count=0 then 
execute immediate 'create table Order_item(
                    order_item_id int primary key
                    ,order_id int, CONSTRAINT order_item_fk1 FOREIGN KEY (order_id) REFERENCES Orders(order_id)
                    ,product_id int, CONSTRAINT order_item_fk2 FOREIGN KEY (product_id) REFERENCES Product(product_id)
                    ,quantity int
                    )';
dbms_output.put_line('Table ORDER_ITEM created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR PRODUCT_SUPPLIER
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PRODUCT_SUPPLIER';
if v_count=0 then 
execute immediate 'create table Product_supplier(
                    product_id int,
                    CONSTRAINT product_supplier_fk1 FOREIGN KEY (product_id) REFERENCES Product(product_id)
                    ,supplier_id int,
                    CONSTRAINT product_supplier_fk2 FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
                    ,cost_to_supplier float
                    )';  
dbms_output.put_line('Table PRODUCT_SUPPLIER created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR PRODUCT_DISCOUNT
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PRODUCT_DISCOUNT';
if v_count=0 then 
execute immediate 'create table Product_discount(
                    product_id int,
                    CONSTRAINT product_discount_fk1 FOREIGN KEY (product_id) REFERENCES Product(product_id)
                    ,discount_id int,
                    CONSTRAINT product_discount_fk2 FOREIGN KEY (discount_id) REFERENCES Discount(discount_id)
                    )';
dbms_output.put_line('Table PRODUCT_DISCOUNT created');
else 
dbms_output.put_line('Table already exists');
end if;


-------------------------------------------------------------------------------
--DDL FOR FEEDBACKS
-------------------------------------------------------------------------------
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='FEEDBACKS';
if v_count=0 then 
execute immediate 'create table Feedbacks(
                    product_id int,
                    CONSTRAINT feeback_fk1 FOREIGN KEY (product_id) REFERENCES Product(product_id)
                    ,feedback_id int primary key
                    ,feedback_ varchar(200)
                    ,rating INT
                    )';
dbms_output.put_line('Table FEEDBACKS created');
else 
dbms_output.put_line('Table already exists');
end if;
commit;
end;
/
-------------------------------------------------------------------------------