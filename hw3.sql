use shop;


-- Вывести имя продавца и сумму его заказов.

SELECT t1.SNAME, SUM(t2.AMT)
FROM SELLERS t1
LEFT JOIN ORDERS t2 
ON t1.SELL_ID = t2.SELL_ID
GROUP BY t1.SNAME;

-- Вывести имя клиента и сумму его заказов.

SELECT t1.CNAME,SUM(t2.AMT)
FROM customers t1
LEFT JOIN ORDERS t2 
ON t1.cust_ID = t2.cust_ID
GROUP BY t1.CNAME;

-- Вывести всех продавцов, включая тех, у кого нет заказов.

select t1.sname,t1.sell_id,t1.city,t1.comm,t1.boss_id,t2.order_id,t2.amt
from sellers t1
left join orders t2
on t1.sell_id = t2.sell_id;


-- Вывести все заказы, включая информацию о продавцах, даже если не все продавцы сделали заказы.

SELECT t1.ORDER_ID,t1.AMT,t1.ODATE,t2.SELL_ID,t2.SNAME,t2.CITY
FROM ORDERS t1
RIGHT JOIN SELLERS t2 ON t1.SELL_ID = t2.SELL_ID;


-- Вывести продавцов и их начальников.

SELECT t1.SELL_ID,t1.SNAME,t2.SELL_ID,t2.SNAME
FROM SELLERS t1
LEFT JOIN SELLERS t2 
ON t1.BOSS_ID = t2.SELL_ID;


-- Найти всех клиентов из города "Москва" и суммы их заказов.

select t1.cname, sum(t2.amt)
from customers t1
left join orders t2
on t1.cust_id = t2.cust_id
where t1.city = 'Moskva'
group by t1.cname;

-- Найти всех продавцов из города "Сочи" и их заказы, если таковые имеются.

select t1.sname,t2.order_id, t2.amt
from sellers t1
left join orders t2
on t1.sell_id = t2.sell_id
where t1.city = 'Sochi';

-- Найти всех клиентов с заказами выше 5000 и информацию о продавцах, которые их обслуживали.

select t1.cname,t3.sname,t2.amt
from customers t1
join orders t2
on t2.cust_id = t1.cust_id
join sellers t3
on t2.sell_id = t3.sell_id
where t2.amt > 5000;

-- Найти всех продавцов, у которых есть начальники.

select t1.sname,t2.sname
from sellers t1
join sellers t2
on t1.boss_id = t2.sell_id;

-- Вывести пары покупателей и обслуживших их продавцов из одного города.

SELECT t2.CNAME,t3.SNAME,t2.CITY
FROM ORDERS t1
JOIN CUSTOMERS t2
 ON t1.CUST_ID = t2.CUST_ID
JOIN SELLERS t3 
ON t1.SELL_ID = t3.SELL_ID
WHERE t2.CITY = t3.CITY;

