-------------------------------------------------------------------------------
--              PROJECT PHASE 3   TEAM-16     DMDD6210
--
--Pawan Kumar Krishnan  002743773       Nency Panchani      002746779
--Aashay Pawar          002134382       Keerthanaa Kannan   001593845
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--DML INSERT FOR USER_TABLE
-------------------------------------------------------------------------------
insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 1,'Aashay' ,'Pawar' ,1234567890,24 from dual
where not exists(select * from user_table where user_id = 1);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 2,'Pawan' ,'Kumar' ,1234567891,27 from dual
where not exists(select * from user_table where user_id = 2);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 3,'Keerthanaa' ,'Kannan' ,1234567881,10 from dual
where not exists(select * from user_table where user_id = 3);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 4,'Nency' ,'Panchani' ,1234567880,20 from dual
where not exists(select * from user_table where user_id = 4);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 5,'Chaitanya' ,'Gokhale' ,4536212345,17 from dual
where not exists(select * from user_table where user_id = 5);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 6,'Rupesh' ,'Pathak' ,1234523124,23 from dual
where not exists(select * from user_table where user_id = 6);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 7,'Abhinav' ,'Kumar' ,5467234987,35 from dual
where not exists(select * from user_table where user_id = 7);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 8,'Shibani' ,' ',1254657687,7 from dual
where not exists(select * from user_table where user_id = 8);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 9,'Charles' ,'Baker' ,4534238756,12 from dual
where not exists(select * from user_table where user_id = 9);

insert into user_table(user_id,first_name,last_name,phone_number,loyalty_disc)
select 10,'Michelle' ,'Wu' ,3642984657,50 from dual
where not exists(select * from user_table where user_id = 10);


-------------------------------------------------------------------------------
--DML INSERT FOR ADDRESS
-------------------------------------------------------------------------------
insert into address(address_id,address,street,city,state,pin,country,user_id)
select 101,'Longwood Apt' ,'Tremont' ,'Boston' ,'Massachusetts' ,2120,'United States' ,1 from dual
where not exists(select * from address where address_id = 101);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 102,'JVUE Apt' ,'St Alphonous' ,'Boston' ,'Massachusetts' ,1324,'United States' ,2 from dual
where not exists(select * from address where address_id = 102);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 103,'Madisson Part Ct' ,'Shawmut' ,'Boston' ,'Massachusetts' ,2115,'United States' ,3 from dual
where not exists(select * from address where address_id = 103);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 104,'Brookline' ,'Kenmore' ,'Boston' ,'Massachusetts' ,2112,'United States' ,4 from dual
where not exists(select * from address where address_id = 104);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 105,'4169','Crestview Terrace' ,'Center Point' ,'Texas' ,78010,'United States' ,1 from dual
where not exists(select * from address where address_id = 105);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 106,'873 Andell Road' ,'Cardinal Lane' ,'Nashville' ,'Tennessee' ,37201,'United States' ,3 from dual
where not exists(select * from address where address_id = 106);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 107,'326 Sugar Court' ,'Camp Road' ,'Kent' ,'Illinois' ,61044,'United States' ,5 from dual
where not exists(select * from address where address_id = 107);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 108,'2838 Bingamon' ,'Branch Road' ,'Warwick' ,'New York' ,10990,'United States' ,6 from dual
where not exists(select * from address where address_id = 108);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 109,'University Road' ,'Long Island' ,'Stony Brook' ,'New York' ,10345,'United States' ,7 from dual
where not exists(select * from address where address_id = 109);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 110,'9500 Gilman Dr' ,'La Jolla' ,'San Diego' ,'California' ,92093,'United States' ,8 from dual
where not exists(select * from address where address_id = 110);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 111,'4596 Jarvisville Road','Cardinal Lane' ,'Bohemia' ,'New York' ,11716,'United States' ,9 from dual
where not exists(select * from address where address_id = 111);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 112,'4550 Felosa Drive' ,'Santa Dr' ,'Santa Anna' ,'Texas' ,76878,'United States' ,10 from dual
where not exists(select * from address where address_id = 112);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 113,'714 Preston Street' ,'Ferguson' ,'Phoenix' ,'Arizona' ,4240,'United States' ,6 from dual
where not exists(select * from address where address_id = 113);

insert into address(address_id,address,street,city,state,pin,country,user_id)
select 114,'4387 Roosevelt Street','Los Lane' ,'Oakland' ,'California' ,94612,'United States' ,7 from dual
where not exists(select * from address where address_id = 114);

-------------------------------------------------------------------------------
--DML INSERT FOR CART
-------------------------------------------------------------------------------
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


-------------------------------------------------------------------------------
--DML INSERT FOR ORDERS
-------------------------------------------------------------------------------

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 1,'delivered' ,1,to_date('03/01/22','DD/MM/YY'),101 from dual
where not exists(select * from orders where order_id=1);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 2,'delivered' ,1,to_date('09/01/22','DD/MM/YY'),105 from dual
where not exists(select * from orders where order_id=2);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 3,'shipped' ,2,to_date('21/11/22','DD/MM/YY'),102 from dual
where not exists(select * from orders where order_id=3);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 4,'delivered' ,3,to_date('20/11/22','DD/MM/YY'),106 from dual
where not exists(select * from orders where order_id=4);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 5,'delivered ',4,to_date('19/11/22','DD/MM/YY'),104 from dual
where not exists(select * from orders where order_id=5);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 6,'delivered',5,to_date('11/09/21','DD/MM/YY'), 107 from dual
where not exists(select * from orders where order_id=6);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 7,'shipped',6,to_date('11/09/22','DD/MM/YY'), 108 from dual
where not exists(select * from orders where order_id=7);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 8,'delivered',7,to_date('03/11/20','DD/MM/YY'), 114 from dual
where not exists(select * from orders where order_id=8);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 9,'delivered',8,to_date('01/01/21','DD/MM/YY'), 110 from dual
where not exists(select * from orders where order_id=9);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 10,'shipped',9,to_date('17/08/22','DD/MM/YY'), 111 from dual
where not exists(select * from orders where order_id=10);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 11,'delivered',10,to_date('22/05/20','DD/MM/YY'), 112 from dual
where not exists(select * from orders where order_id=11);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 12,'delivered',4,to_date('12/06/21','DD/MM/YY'), 104 from dual
where not exists(select * from orders where order_id=12);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 13,'shipped',6,to_date('10/12/22','DD/MM/YY'), 113 from dual
where not exists(select * from orders where order_id=13);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 14,'delivered',8,to_date('06/05/20','DD/MM/YY'), 110 from dual
where not exists(select * from orders where order_id=14);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 15,'delivered',10,to_date('13/03/21','DD/MM/YY'), 112 from dual
where not exists(select * from orders where order_id=15);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 16,'delivered',2,to_date('19/02/21','DD/MM/YY'), 102 from dual
where not exists(select * from orders where order_id=16);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 17,'delivered',3,to_date('14/07/21','DD/MM/YY'), 103 from dual
where not exists(select * from orders where order_id=17);

insert into orders(order_id,order_status,user_id,order_date, address_id)
select 18,'shipped',2,to_date('27/08/20','DD/MM/YY'), 102 from dual
where not exists(select * from orders where order_id=18);


-------------------------------------------------------------------------------
--DML INSERT FOR LOYALTY_DISCOUNT
-------------------------------------------------------------------------------
insert into loyalty_discount(discount_id,user_id,discount_pct)
select 1,1,10 from dual
where not exists(select * from loyalty_discount where discount_id = 1);

insert into loyalty_discount(discount_id,user_id,discount_pct)
select 2,2,20 from dual
where not exists(select * from loyalty_discount where discount_id = 2);

insert into loyalty_discount(discount_id,user_id,discount_pct)
select 3,3,20 from dual
where not exists(select * from loyalty_discount where discount_id = 3);

-------------------------------------------------------------------------------
--DML INSERT FOR PAYMENT_INFO
-------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------
--DML INSERT FOR SUPPLIER
-------------------------------------------------------------------------------
insert into supplier(supplier_id,supplier_name)
select 1,'AKZ limited' from dual
where not exists(select * from supplier where supplier_id = 1);

insert into supplier(supplier_id,supplier_name)
select 2,'Cross kitchens' from dual
where not exists(select * from supplier where supplier_id = 2);

insert into supplier(supplier_id,supplier_name)
select 3,'Sara JAPAN' from dual
where not exists(select * from supplier where supplier_id = 3);

-------------------------------------------------------------------------------
--DML INSERT FOR DISCOUNT
-------------------------------------------------------------------------------
insert into discount(discount_type,discount_id,discount_pct)
select 'Store Offer',1,10 from dual
where not exists(select * from discount where discount_id = 1);

insert into discount(discount_type,discount_id,discount_pct)
select 'Season Offer',2,15 from dual
where not exists(select * from discount where discount_id = 2);

insert into discount(discount_type,discount_id,discount_pct)
select 'No Discount',3,0 from dual
where not exists(select * from discount where discount_id = 3);

-------------------------------------------------------------------------------
--DML INSERT FOR CATEGORY
-------------------------------------------------------------------------------
insert into category(category_id,category_name)
select 1,'Cleaning' from dual
where not exists(select * from category where category_id = 1);

insert into category(category_id,category_name)
select 2,'Exercise' from dual
where not exists(select * from category where category_id = 2);

insert into category(category_id,category_name)
select 3,'Kitchen' from dual
where not exists(select * from category where category_id = 3);

insert into category(category_id,category_name)
select 4,'Food' from dual
where not exists(select * from category where category_id = 4);

insert into category(category_id,category_name)
select 5,'Drinks' from dual
where not exists(select * from category where category_id = 5);

insert into category(category_id,category_name)
select 6,'Clothes' from dual
where not exists(select * from category where category_id = 6);

insert into category(category_id,category_name)
select 7,'Beauty' from dual
where not exists(select * from category where category_id = 7);

insert into category(category_id,category_name)
select 8,'Sports' from dual
where not exists(select * from category where category_id = 8);

insert into category(category_id,category_name)
select 9,'Toys' from dual
where not exists(select * from category where category_id = 9);

insert into category(category_id,category_name)
select 10,'Decoration' from dual
where not exists(select * from category where category_id = 10);

-------------------------------------------------------------------------------
--DML INSERT FOR PRODUCT
-------------------------------------------------------------------------------
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

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 5,'Land-O-Lakes Butter' ,4,7.99,10,'Unsalted Butter 5 Oz'  from dual
where not exists(select * from product where product_id = 5);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 6,'Tetley Green Tea' ,5,3.99,20,'Pack of 48 Tea Bags, Green tea good for health'  from dual
where not exists(select * from product where product_id = 6);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 7,'Countryside Brown Eggs' ,4,8.99,20,'1 Dozen countryside eggs' from dual
where not exists(select * from product where product_id = 7);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 8,'Ambient Light Bulb' ,10,10.99,16,'Pack of 2 ambient warm bulb'  from dual
where not exists(select * from product where product_id = 8);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 9,'MM' ,4,7.99,13,'MM Chocolate candies, 60oz'  from dual
where not exists(select * from product where product_id = 9);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 10,'CKs Hoodie' ,6,35.99,4,'Calvin Klein womens hoodie, Size S' from dual
where not exists(select * from product where product_id = 10);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 11,'Levis Bomber Jacket' ,6,25.99,3,'Levis winter jacket for men, Size M' from dual
where not exists(select * from product where product_id = 11);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 12,'Dolce Gabbana Light Blue' ,7,78.99,23,'Dolce Gabbana EDT for men'  from dual
where not exists(select * from product where product_id = 12);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 13,'Cetaphil Skin Cleanser' ,7,15.99,56,'skin cleanser for all skin types' from dual
where not exists(select * from product where product_id = 13);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 14,'Macys The Glam Case' ,7,99.99,14,'Makeup kit for women' from dual
where not exists(select * from product where product_id = 14);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 15,'Basket Ball' ,8,17.99,32,'Basket Ball flattened'  from dual
where not exists(select * from product where product_id = 15);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 16,'Game of Business' ,9,10.99,65,'Board Games' from dual
where not exists(select * from product where product_id = 16);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 17,'Budwiser' ,4,9.99,78,'drinks and beer' from dual
where not exists(select * from product where product_id = 17);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 18,'Spoons' ,3,4.99,13,'Set of 5 spoons' from dual
where not exists(select * from product where product_id = 18);

insert into product(product_id,product_name,category_id,price,quantity,product_desc)
select 19,'Prestige Pan' ,3,11.99,5,'Non-stick non-induction pan'  from dual
where not exists(select * from product where product_id = 19);

-------------------------------------------------------------------------------
--DML INSERT FOR CART_ITEM
-------------------------------------------------------------------------------
insert into cart_item(cart_item_id,cart_id,product_id,quantity)
select 1,1,1,2 from dual
where not exists(select * from cart_item where cart_item_id = 1);

insert into cart_item(cart_item_id,cart_id,product_id,quantity)
select 2,1,2,1 from dual
where not exists(select * from cart_item where cart_item_id = 2);


-------------------------------------------------------------------------------
--DML INSERT FOR ORDER_ITEM
-------------------------------------------------------------------------------
insert into order_item(order_item_id,order_id,product_id,quantity)
select 1,1,1,2 from dual
where not exists(select * from order_item where order_item_id = 1);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 2,1,2,1 from dual
where not exists(select * from order_item where order_item_id = 2);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 3,2,3,1 from dual
where not exists(select * from order_item where order_item_id = 3);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 4,3,4,1 from dual
where not exists(select * from order_item where order_item_id = 4);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 5,4,1,1 from dual
where not exists(select * from order_item where order_item_id = 5);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 6,5,2,3 from dual
where not exists(select * from order_item where order_item_id = 6);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 7,6,19,1 from dual
where not exists(select * from order_item where order_item_id = 7);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 8,6,18,2 from dual
where not exists(select * from order_item where order_item_id = 8);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 9,7,17,3 from dual
where not exists(select * from order_item where order_item_id = 9);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 10,8,16,4 from dual
where not exists(select * from order_item where order_item_id = 10);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 11,8,15,2 from dual
where not exists(select * from order_item where order_item_id = 11);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 12,8,14,3 from dual
where not exists(select * from order_item where order_item_id = 12);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 13,9,13,1 from dual
where not exists(select * from order_item where order_item_id = 13);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 14,9,12,3 from dual
where not exists(select * from order_item where order_item_id = 14);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 15,10,11,2 from dual
where not exists(select * from order_item where order_item_id = 15);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 16,11,10,8 from dual
where not exists(select * from order_item where order_item_id = 16);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 17,12,9,1 from dual
where not exists(select * from order_item where order_item_id = 17);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 18,13,8,2 from dual
where not exists(select * from order_item where order_item_id = 18);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 19,14,7,1 from dual
where not exists(select * from order_item where order_item_id = 19);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 20,15,6,1 from dual
where not exists(select * from order_item where order_item_id = 20);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 21,15,5,2 from dual
where not exists(select * from order_item where order_item_id = 21);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 22,16,5,3 from dual
where not exists(select * from order_item where order_item_id = 22);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 23,17,5,4 from dual
where not exists(select * from order_item where order_item_id = 23);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 24,18,4,2 from dual
where not exists(select * from order_item where order_item_id = 24);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 25,1,3,3 from dual
where not exists(select * from order_item where order_item_id = 25);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 26,2,2,1 from dual
where not exists(select * from order_item where order_item_id = 26);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 27,3,2,3 from dual
where not exists(select * from order_item where order_item_id = 27);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 28,4,1,2 from dual
where not exists(select * from order_item where order_item_id = 28);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 29,5,19,8 from dual
where not exists(select * from order_item where order_item_id = 29);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 30,6,18,1 from dual
where not exists(select * from order_item where order_item_id = 30);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 31,7,17,2 from dual
where not exists(select * from order_item where order_item_id = 31);

insert into order_item(order_item_id,order_id,product_id,quantity)
select 32,8,17,1 from dual
where not exists(select * from order_item where order_item_id = 32);

-------------------------------------------------------------------------------
--DML INSERT FOR PRODUCT_SUPPLIER
-------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------
--DML INSERT FOR PRODUCT_DISCOUNT
-------------------------------------------------------------------------------
insert into product_discount(product_id,discount_id)
select 1,1 from dual;

insert into product_discount(product_id,discount_id)
select 2,1 from dual;

insert into product_discount(product_id,discount_id)
select 3,2 from dual;

insert into product_discount(product_id,discount_id)
select 4,1 from dual;

insert into product_discount(product_id,discount_id)
select 5,1 from dual;

insert into product_discount(product_id,discount_id)
select 6,3 from dual;

insert into product_discount(product_id,discount_id)
select 7,2 from dual;

insert into product_discount(product_id,discount_id)
select 8,1 from dual;

insert into product_discount(product_id,discount_id)
select 9,3 from dual;

insert into product_discount(product_id,discount_id)
select 10,3 from dual;

insert into product_discount(product_id,discount_id)
select 11,3 from dual;

insert into product_discount(product_id,discount_id)
select 12,1 from dual;

insert into product_discount(product_id,discount_id)
select 13,3 from dual;

insert into product_discount(product_id,discount_id)
select 14,2 from dual;

insert into product_discount(product_id,discount_id)
select 15,3 from dual;

insert into product_discount(product_id,discount_id)
select 16,3 from dual;

insert into product_discount(product_id,discount_id)
select 17,1 from dual;

insert into product_discount(product_id,discount_id)
select 18,3 from dual;

insert into product_discount(product_id,discount_id)
select 19,2 from dual;

-------------------------------------------------------------------------------
--DML INSERT FOR FEEDBACK
-------------------------------------------------------------------------------
insert into feedbacks(product_id,feedback_id,feedback_,rating)
select 1,1,'bad quality',2 from dual
where not exists(select * from feedbacks where feedback_id = 1);

insert into feedbacks(product_id,feedback_id,feedback_,rating)
select 1,2,'washes clean',4 from dual
where not exists(select * from feedbacks where feedback_id = 2);

insert into feedbacks(product_id,feedback_id,feedback_,rating)
select 2,3,'high comfort',5 from dual
where not exists(select * from feedbacks where feedback_id = 3);

commit;