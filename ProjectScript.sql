-- Insert USER_TABLE

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


-- Insert ADDRESS

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






