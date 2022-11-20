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


