-------------------------------------------------------------------------------
--              PROJECT PHASE 3   TEAM-16     DMDD6210
--
--Pawan Kumar Krishnan  002743773       Nency Panchani      002746779
--Aashay Pawar          002134382       Keerthanaa Kannan   001593845
-------------------------------------------------------------------------------


-- MAIN VIEW
create or replace view main_view as
select orders.user_id, address.city, address.state, address.country, orders.order_date, order_item.product_id, order_item.quantity,
product.price, discount.discount_pct
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id
order by orders.order_date;


-- Overall Sales by Month
create or replace view overall_sales_by_month as
select to_char(to_date(month_num, 'MM'), 'MONTH')month_name, sum(monthly_sale)sale from
(select to_char(orders.order_date, 'MM') month_num, (order_item.quantity*product.price)*(100 - discount.discount_pct) monthly_sale
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by month_num order by month_num;


-- Overall Sales by Year
create or replace view overall_sales_by_year as
select year_num, sum(yearly_sale)sale from
(select to_char(orders.order_date, 'YYYY') year_num, (order_item.quantity*product.price)*(100 - discount.discount_pct) yearly_sale
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by year_num order by year_num;

-- Overall Sales by City
create or replace view overall_sales_by_city as
select city, sum(sales)sales from
(select address.city city,(order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by city order by sales;

-- Overall Sales by State
create or replace view overall_sales_by_state as
select state, sum(sales)sales from
(select address.state state,(order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by state order by sales;

-- Product Sales by Month
create or replace view product_sales_by_month as
select productid, month_num, sum(sales)sales from
(select to_char(orders.order_date, 'MM')month_num, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by productid, month_num order by productid, month_num;

-- Product Sales by Year
create or replace view product_sales_by_year as
select productid, year_num, sum(sales)sales from
(select to_char(orders.order_date, 'YYYY') year_num, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by productid, year_num order by productid, year_num;

-- Product Sales by City
create or replace view product_sales_by_city as
select productid, city, sum(sales)sales from
(select address.city city, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by productid, city order by productid, sales desc;

-- Product Sales by State
create or replace view product_sales_by_state as
select productid, state, sum(sales)sales from
(select address.state state, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by productid, state order by productid, sales desc;

-- Top Products by Month
create or replace view top_products_by_month as
select month_num, productid, sum(sales)sales from
(select to_char(orders.order_date, 'MM')month_num, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by month_num, productid order by month_num, sales desc;

-- Top Products by Year
create or replace view top_products_by_year as
select year_num, productid, sum(sales)sales from
(select to_char(orders.order_date, 'YYYY')year_num, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by year_num, productid order by year_num, sales desc;

-- Top Products by City
create or replace view top_products_by_city as
select city, productid, sum(sales)sales from
(select address.city city, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by city, productid order by city, sales desc;

-- Top Products by State
create or replace view top_products_by_state as
select state, productid, sum(sales)sales from
(select address.state state, order_item.product_id productid, (order_item.quantity*product.price)*(100-discount.discount_pct) sales
from orders
inner join address on address.address_id = orders.address_id
inner join order_item on order_item.order_id = orders.order_id
inner join product on product.product_id = order_item.product_id
inner join product_discount on product_discount.product_id = product.product_id
inner join discount on discount.discount_id = product_discount.discount_id)
group by state, productid order by state, sales desc;

-- Products by Category
create or replace view products_by_category as
select product.product_id, product.product_name, category.category_name from product
inner join category on category.category_id = product.category_id;

create or replace view orders_line_item as
SELECT 
OI.ORDER_ID
,OI.ORDER_ITEM_ID
,OI.PRODUCT_ID
,OI.QUANTITY
,P.PRODUCT_NAME
,P.PRICE
,P.PRODUCT_DESC
FROM ADMIN.ORDER_ITEM OI 
LEFT JOIN ADMIN.ORDERS O ON OI.ORDER_ID = O.ORDER_ID
LEFT JOIN ADMIN.PRODUCT P ON OI.PRODUCT_ID = P.PRODUCT_ID
ORDER BY O.ORDER_DATE DESC;

----- View CART and ITS ITEMS with PRODUCT NAME
create or replace view cart_line_item as
select c.user_id as user_id
, ci.cart_item_id as cart_item_id
,ci.product_id as product_id
,p.product_name as product_name
,ci.quantity as cart_quantity
from admin.cart c 
left join admin.cart_item ci on c.cart_id = ci.cart_id 
left join admin.product p on ci.product_id = p.product_id;

commit;