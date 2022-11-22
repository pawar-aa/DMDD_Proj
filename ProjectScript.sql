-- Insert USER_TABLE (user_id,first_name,last_name,phone_number,no_of_orders,value_spent,loyalty_disc)

insert into user_table(user_id,first_name,last_name,phone_number,no_of_orders,value_spent,loyalty_disc)
select 1,'Aashay','Pawar',1234567890,3,1000,200 from dual
where not exists(select * from user_table where user_id = 1);

insert into user_table(user_id,first_name,last_name,phone_number,no_of_orders,value_spent,loyalty_disc)
select 2,'Pavan','Kumar',2345678901,1,200,0 from dual
where not exists(select * from user_table where user_id = 2);

insert into user_table(user_id,first_name,last_name,phone_number,no_of_orders,value_spent,loyalty_disc)
select 3,'Keerthana','Kannan',3456789012,2,650,56 from dual
where not exists(select * from user_table where user_id = 3);

insert into user_table(user_id,first_name,last_name,phone_number,no_of_orders,value_spent,loyalty_disc)
select 4,'Nency','Panchani',4567890123,1,380,40 from dual
where not exists(select * from user_table where user_id = 4);


-- Insert ADDRESS (address_id,address,street,city,state,pin,country,user_id)

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 101,'Longwood Apt','Tremont','Boston','MA',2120,'USA',1 from dual
where not exists(select * from address where address_id = 101);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 102,'JVUE Apt','Park Street','Chicago','Illinois',1324,'USA',2 from dual
where not exists(select * from address where address_id = 102);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 103,'Madisson Part Ct','Shawmut','Boston','MA',2115,'USA',3 from dual
where not exists(select * from address where address_id = 103);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 104,'Brookline','Kenmore','Boston','MA',2112,'USA',4 from dual
where not exists(select * from address where address_id = 104);


-- Insert CART (cart_id,loyalty_disc,user_id)

insert into cart(cart_id,loyalty_disc,user_id)
select 10,100,1 from dual
where not exists(select * from cart where cart_id = 10);

insert into cart(cart_id,loyalty_disc,user_id)
select 11,0,2 from dual
where not exists(select * from cart where cart_id = 11);

insert into cart(cart_id,loyalty_disc,user_id)
select 12,56,3 from dual
where not exists(select * from cart where cart_id = 12);

insert into cart(cart_id,loyalty_disc,user_id)
select 13,40,4 from dual
where not exists(select * from cart where cart_id = 13);


-- [ISSUE] Insert ORDERS (order_id,order_status,order_date,order_amount,user_id,payment_id)

insert into orders(order_id,order_status,order_date,order_amount,user_id,payment_id)
select 90,'shipped',44754,2000,1,1010 from dual
where not exists(select * from orders where order_id = 90);

insert into orders(order_id,order_status,order_date,order_amount,user_id,payment_id)
select 80,'order placed',44817,890,2,1020 from dual
where not exists(select * from orders where order_id = 80);

insert into orders(order_id,order_status,order_date,order_amount,user_id,payment_id)
select 70,'delivered',44844,560,3,1030 from dual
where not exists(select * from orders where order_id = 70);

insert into orders(order_id,order_status,order_date,order_amount,user_id,payment_id)
select 60,'delivered',44857,790,4,1040 from dual
where not exists(select * from orders where order_id = 60);


-- [ISSUE] Insert LOYALTY_DISCOUNT (discount_id,value_spent_above,discount,user_id)

insert into loyalty_discount(discount_id,value_spent_above,discount,user_id)
select 19,1000,20,1 from dual
where not exists(select * from loyalty_discount where discount_id = 19);

insert into loyalty_discount(discount_id,value_spent_above,discount,user_id)
select 18,200,40,2 from dual
where not exists(select * from loyalty_discount where discount_id = 18);

insert into loyalty_discount(discount_id,value_spent_above,discount,user_id)
select 17,650,30,3 from dual
where not exists(select * from loyalty_discount where discount_id = 17);

insert into loyalty_discount(discount_id,value_spent_above,discount,user_id)
select 16,380,50,4 from dual
where not exists(select * from loyalty_discount where discount_id = 16);

-- Insert CART_ITEM (cart_item_id,discounted_price,quantity,cart_id,product_id)

insert into cart_item(cart_item_id,discounted_price,quantity,cart_id,product_id)
select 345,78,10,10,1000 from dual
where not exists(select * from cart_item where cart_id = 345);

insert into cart_item(cart_item_id,discounted_price,quantity,cart_id,product_id)
select 567,80,11,11,1001 from dual
where not exists(select * from cart_item where cart_id = 567);

insert into cart_item(cart_item_id,discounted_price,quantity,cart_id,product_id)
select 768,100,20,12,1002 from dual
where not exists(select * from cart_item where cart_id = 768);

insert into cart_item(cart_item_id,discounted_price,quantity,cart_id,product_id)
select 908,23,12,13,1003 from dual
where not exists(select * from cart_item where cart_id = 908);





