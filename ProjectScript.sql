

declare
v_count number;
v_sql varchar2(500);
begin
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='USER_TABLE';
if v_count=0 then 
v_sql:='create table User_table (
user_id int primary key
,first_name varchar (200)
,last_name varchar(200)
,phone_number int
,loyalty_disc float 
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else 
execute immediate 'drop table user_table';
v_sql:='create table User_table (
user_id int primary key
,first_name varchar (200)
,last_name varchar(200)
,phone_number int
,loyalty_disc float 
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
--dbms_output.put_line('table already exists');
end if;


--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='ADDRESS';
if v_count=0 then 
v_sql:='create table Address(
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
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else 
v_sql:='create table Address(
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
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
end if;


--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='CART';
if v_count=0 then 
v_sql:='create table Cart (
cart_id int primary key
,user_id int ,
CONSTRAINT address_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
,loyalty_disc float
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else 
v_sql:='create table Cart (
cart_id int primary key
,user_id int ,
CONSTRAINT address_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
,loyalty_disc float
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
end if;


--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='CATEGORY';
if v_count=0 then 
v_sql:='create table Category(
category_id int primary key
,category_name varchar(200)
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PRODUCT';
if v_count=0 then 
v_sql:='create table Product(
product_id int primary key
,product_name varchar(255) not null
,category_id int not null,
 CONSTRAINT product_fk1 FOREIGN KEY (category_id) REFERENCES Category(category_id)
,price float not null
,quantity int
,product_desc varchar(200)
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='CART_ITEM';
if v_count=0 then 
v_sql:='create table Cart_item(
cart_item_id int primary key
,cart_id int, CONSTRAINT cartItem_fk1 FOREIGN KEY (cart_id) REFERENCES Cart(cart_id)
,product_id int,  CONSTRAINT cartItem_fk2 FOREIGN KEY (product_id) REFERENCES Product(product_id)

,quantity int
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='FEEDBACKS';
if v_count=0 then 
v_sql:='create table Feedbacks(
product_id int,
CONSTRAINT feeback_fk1 FOREIGN KEY (product_id) REFERENCES Product(product_id)
,feedback_id int primary key
,feedback_ varchar(200)
,rating INT
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='DISCOUNT';
if v_count=0 then 
v_sql:='create table Discount(
discount_type varchar(220)
,discount_id int primary key
,discount_pct float
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PRODUCT_DISCOUNT';
if v_count=0 then 
v_sql:='create table Product_discount(
product_id int,
CONSTRAINT product_discount_fk1 FOREIGN KEY (product_id) REFERENCES Product(product_id)
,discount_id int,
CONSTRAINT product_discount_fk2 FOREIGN KEY (discount_id) REFERENCES Discount(discount_id)
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='SUPPLIER';
if v_count=0 then 
v_sql:='create table Supplier(
supplier_id int primary key
,supplier_name varchar(200)
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PRODUCT_SUPPLIER';
if v_count=0 then 
v_sql:='create table Product_supplier(
product_id int,
CONSTRAINT product_supplier_fk1 FOREIGN KEY (product_id) REFERENCES Product(product_id)
,supplier_id int,
CONSTRAINT product_supplier_fk2 FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
,cost_to_supplier float

)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='ORDERS';
if v_count=0 then 
v_sql:='create table Orders(
order_id int primary key
,order_status varchar(255)
,user_id int,CONSTRAINT orders_fk1 FOREIGN KEY (user_id) REFERENCES User_table(user_id)
,order_date Date
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='PAYMENT_INFO';
if v_count=0 then 
v_sql:='create table Payment_info(
payment_id int primary key
,order_id int, CONSTRAINT payment_info_fk1 FOREIGN KEY (order_id) REFERENCES Orders(order_id)
,payment_type varchar(40) not null
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='ORDER_ITEM';
if v_count=0 then 
v_sql:='create table Order_item(
order_item_id int primary key
,order_id int, CONSTRAINT order_item_fk1 FOREIGN KEY (order_id) REFERENCES Orders(order_id)
,product_id int, CONSTRAINT order_item_fk2 FOREIGN KEY (product_id) REFERENCES Product(product_id)
,price float
,quantity int
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;

--
select count(*) into v_count from dba_tables where owner='ADMIN' and table_name='LOYALTY_DISCOUNT';
if v_count=0 then 
v_sql:='create table Loyalty_discount(
discount_id int primary key
,order_id int, CONSTRAINT loyalty_discount_fk1 FOREIGN KEY (order_id) REFERENCES Orders(order_id)
,discount int
,value_spent_above float
,spent_end float
)'; 
dbms_output.put_line(v_sql);
execute immediate v_sql;
commit;
else dbms_output.put_line('table already exists');
end if;
end;





------// insert user_table

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 1,'Aashay','Pawar',1234567890,200 from dual
where not exists(select * from user_table where user_id = 1);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 2,'Pawan','Kumar',1234567891,20 from dual
where not exists(select * from user_table where user_id = 2);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 3,'Keertanaa','Kannan',1234567881,null from dual
where not exists(select * from user_table where user_id = 3);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 4,'Nency','Panchani',1234567880,20 from dual
where not exists(select * from user_table where user_id = 4);
commit;

-----// insert address

insert into address(address_id,user_id,address,street,city,state,pin,country)
select 101,1,'Longwood Apt','Tremont','Boston','MA',2120,'USA' from dual
where not exists(select * from address where address_id = 101);

insert into address(address_id,user_id,address,street,city,state,pin,country)
select 102,1,'JVUE Apt','Park Street','Chicago','Illinois',1324,'USA' from dual
where not exists(select * from address where address_id = 102);

insert into address(address_id,user_id,address,street,city,state,pin,country)
select 103,2,'Madisson Part Ct','Shawmut','Boston','MA',2115,'USA' from dual
where not exists(select * from address where address_id = 103);

insert into address(address_id,user_id,address,street,city,state,pin,country)
select 104,3,'Brookline','Kenmore','Boston','MA',2112,'USA' from dual
where not exists(select * from address where address_id = 104);

commit;

--- insert //CART

insert into cart(cart_id,user_id,loyalty_disc)
select 1,1,100 from dual
where not exists(select * from cart where cart_id = 1);



insert into cart(cart_id,user_id,loyalty_disc)
select 2,3,56 from dual
where not exists(select * from cart where cart_id = 2);

insert into cart(cart_id,user_id,loyalty_disc)
select 3,4,40 from dual
where not exists(select * from cart where cart_id = 3);

insert into cart(cart_id,user_id,loyalty_disc)
select 4,2,0 from dual
where not exists(select * from cart where cart_id = 4);

commit;
select * from cart;
--- insert //CATEGORY

insert into category(category_id,category_name)
select 1,'Cleaning' from dual
where not exists(select * from category where category_id = 1);

insert into category(category_id,category_name)
select 2,'Exercise' from dual
where not exists(select * from category where category_id = 2);

insert into category(category_id,category_name)
select 3,'Kitchen' from dual
where not exists(select * from category where category_id = 3);



select * from category;
commit;
--- insert //PRODUCT
insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 1,'Tide',1,29.99,10,'Tide washing liquid 1 Gallon' from dual
where not exists(select * from product where product_id = 1);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 2,'Yoga mat',2,14.89,20,'44 inch x 90, inch all black super soft yoga mat' from dual
where not exists(select * from product where product_id = 2);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 3,'Cutting board',3,11,21,'Wooden super strong cutting board' from dual
where not exists(select * from product where product_id = 3);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 4,'Cera Plates',3,11,2,'White ceramic plates, easy wash' from dual
where not exists(select * from product where product_id = 4);

select * from product;
commit;


--- insert //CART_ITEM

insert into cart_item(cart_item_id,cart_id,product_id,quantity)
select 1,1,1,2 from dual
where not exists(select * from cart_item where cart_item_id = 1);

insert into cart_item(cart_item_id,cart_id,product_id,quantity)
select 2,1,2,1 from dual
where not exists(select * from cart_item where cart_item_id = 2);

select * from cart_item;
commit;



--- insert //FEEDBACKS

insert into feedbacks(product_id,feedback_id,feedback_,rating)
select 1,1,'bad quality',2 from dual
where not exists(select * from feedbacks where feedback_id = 1);

insert into feedbacks(product_id,feedback_id,feedback_,rating)
select 1,2,'washes clean',4 from dual
where not exists(select * from feedbacks where feedback_id = 2);

insert into feedbacks(product_id,feedback_id,feedback_,rating)
select 2,3,'high comfort',5 from dual
where not exists(select * from feedbacks where feedback_id = 3);
select * from feedbacks;
commit;

--- insert //DISCOUNT

insert into discount(discount_type,discount_id,discount_pct)
select 'New Customer',1,0.1 from dual
where not exists(select * from discount where discount_id = 1);

insert into discount(discount_type,discount_id,discount_pct)
select 'Big Order',2,0.1 from dual
where not exists(select * from discount where discount_id = 2);


select * from discount;

commit;

--- insert //PRODUCT_DISCOUNT

insert into product_discount(product_id,discount_id)
select 1,1 from dual;


insert into product_discount(product_id,discount_id)
select 1,2 from dual;

insert into product_discount(product_id,discount_id)
select 2,2 from dual;

insert into product_discount(product_id,discount_id)
select 2,1 from dual;

select * from product_discount;

commit;
--- insert //SUPPLIER


insert into supplier(supplier_id,supplier_name)
select 1,'AKZ limited' from dual
where not exists(select * from supplier where supplier_id = 1);

insert into supplier(supplier_id,supplier_name)
select 2,'Cross kitchens' from dual
where not exists(select * from supplier where supplier_id = 2);

insert into supplier(supplier_id,supplier_name)
select 3,'Sara JAPAN' from dual
where not exists(select * from supplier where supplier_id = 3);

select* from supplier
commit;
--- insert //PRODUCT SUPPLIER

insert into product_supplier(product_id,supplier_id,cost_to_supplier)
select 1,1,10 from dual
where not exists(select * from product_supplier where product_id = 1);

insert into product_supplier(product_id,supplier_id,cost_to_supplier)
select 2,1,4 from dual
where not exists(select * from product_supplier where product_id = 2);

insert into product_supplier(product_id,supplier_id,cost_to_supplier)
select 3,2,3 from dual
where not exists(select * from product_supplier where product_id = 3);

insert into product_supplier(product_id,supplier_id,cost_to_supplier)
select 4,3,2.5 from dual
where not exists(select * from product_supplier where product_id = 4);

select * from product_supplier;

commit;
--- insert //ORDERS

insert into orders(order_id,order_status,user_id,order_date)
select 1,'delivered',1,To_DATE ('01/03/2022','MM/DD,YYYY') from dual
where not exists(select * from orders where order_id = 1);

insert into orders(order_id,order_status,user_id,order_date)
select 2,'delivered',1,To_DATE ('01/09/2022','MM/DD,YYYY') from dual
where not exists(select * from orders where order_id = 2);

insert into orders(order_id,order_status,user_id,order_date)
select 3,'shipped',2,To_DATE ('11/21/2022','MM/DD,YYYY') from dual
where not exists(select * from orders where order_id = 3);

insert into orders(order_id,order_status,user_id,order_date)
select 4,'delivered',3,To_DATE ('11/20/2022','MM/DD,YYYY') from dual
where not exists(select * from orders where order_id = 4);

insert into orders(order_id,order_status,user_id,order_date)
select 5,'delivered',4,To_DATE ('11/19/2022','MM/DD,YYYY') from dual
where not exists(select * from orders where order_id = 5);


select * from orders;

commit;
--- insert //PAYMENT_INFO

insert into payment_info(payment_id,order_id,payment_type)
select 1,1,'credit card' from dual
where not exists(select * from payment_info where payment_id = 1);

insert into payment_info(payment_id,order_id,payment_type)
select 2,2,'debit card' from dual
where not exists(select * from payment_info where payment_id = 2);

insert into payment_info(payment_id,order_id,payment_type)
select 3,3,'debit card' from dual
where not exists(select * from payment_info where payment_id = 3);

insert into payment_info(payment_id,order_id,payment_type)
select 4,4,'gift card' from dual
where not exists(select * from payment_info where payment_id = 4);

insert into payment_info(payment_id,order_id,payment_type)
select 5,5,'credit card' from dual
where not exists(select * from payment_info where payment_id = 5);


select * from payment_info;
commit;

--- insert //ORDER_ITEM

insert into order_item(order_item_id,order_id,product_id,price,quantity)
select 1,1,1,29.99,2 from dual
where not exists(select * from order_item where order_item_id = 1);


insert into order_item(order_item_id,order_id,product_id,price,quantity)
select 2,1,2,14.89,1 from dual
where not exists(select * from order_item where order_item_id = 2);


insert into order_item(order_item_id,order_id,product_id,price,quantity)
select 3,2,3,10.99,1 from dual
where not exists(select * from order_item where order_item_id = 3);


insert into order_item(order_item_id,order_id,product_id,price,quantity)
select 4,3,4,10.99,1 from dual
where not exists(select * from order_item where order_item_id = 4);


insert into order_item(order_item_id,order_id,product_id,price,quantity)
select 5,4,1,29.99,1 from dual
where not exists(select * from order_item where order_item_id = 5);


insert into order_item(order_item_id,order_id,product_id,price,quantity)
select 6,5,2,14.89,3 from dual
where not exists(select * from order_item where order_item_id = 6);

commit;
--- insert //LOYALTY_DISCOUNT
insert into loyalty_discount(discount_id,order_id,discount,value_spent_above,spent_end)
select 1,1,12,60,null from dual
where not exists(select * from loyalty_discount where discount_id = 1);

insert into loyalty_discount(discount_id,order_id,discount,value_spent_above,spent_end)
select 2,1,6,20,null from dual
where not exists(select * from loyalty_discount where discount_id = 2);


insert into loyalty_discount(discount_id,order_id,discount,value_spent_above,spent_end)
select 3,2,6,20,null from dual
where not exists(select * from loyalty_discount where discount_id = 3);



select * from loyalty_discount;
commit;


