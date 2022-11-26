
-----------------------------------------

                --USERS--

-----------------------------------------


--Supplier and customer(only select privileges for now) Users have been created--


----- Supplier


create user supplier_team identified by Supplier12345;
grant create session,create view to supplier_team;
grant resource to supplier_team;
grant connect to supplier_team;
grant select on ADMIN.SUPPLIER to supplier_team;
grant select on ADMIN.PRODUCT_SUPPLIER to supplier_team;
grant insert,update on SUPPLIER to supplier_team;
grant insert,update on PRODUCT_SUPPLIER to supplier_team;
grant connect to supplier_executive;


----- Customer 

create user customer identified by Password12345;
grant create session,create view to customer;
grant resource to customer;
grant connect to customer;
grant select on user_table to customer;
grant select on address to customer;
grant select on cart to customer;
grant select on cart_item to customer;
grant select on orders to customer;
grant select on order_item to customer;
grant select on product to customer;
grant select on payment_info to customer;
grant select on feedbacks to customer;
grant select on category to customer;
grant connect to customer;




commit;
