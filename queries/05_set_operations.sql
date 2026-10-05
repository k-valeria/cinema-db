select o.customername 
from orders o 
union all
select p.productname 
from products p;

select customername
from orders o 
where o.productid in (3, 4, 5)
intersect 
select customername
from orders o 
where o.productid in (4, 5, 6);

select p.productname 
from products p
where p.productid between 1 and 5
except 
select p.productname 
from products p
where p.category = 'Электроника';

select p.productname 
from products p 
where category = 'Электроника'
union 
select p.productname 
from products p 
where category = 'Бытовая техника';

select o.orderid 
from orders o 
where o.quantity > 5
union all
select p.productid 
from products p
where p.price > 5000;

select productid
from orders o 
where o.customername = 'Мария Белова'
intersect 
select productid
from orders o 
where o.customername = 'Анна Смирнова';

select productname
from products
except
select productname
from products
where category = 'Канцелярия';

select o.orderid 
from orders o 
where o.orderdate::text like '2023-12-%'
union 
select productid 
from products
where price > 2010;

select productid
from orders o 
where o.customername = 'Сергей Козлов'
intersect 
select productid
from orders o 
where o.customername = 'Анна Смирнова'
intersect 
select productid
from orders o 
where o.customername = 'Иван Иванов';

