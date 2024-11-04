use shop;

-- Определить какие из покупок были совершены в июне

select *
from orders
where month(odate) = 6;

-- Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года

select *
from orders
where odate between '2022-04-10' and '2022-05-10';

-- Определить сколько покупок было совершено в марте

select *
from orders
where month(odate) = 3 and year(odate) = 2022;


-- Определить среднюю стоимость покупок в марте

select avg(amt)
from orders
where  month(odate) = 3 and year(odate) = 2022;

-- Выведите минимальный рейтинг(rating) покупателя среди сделавших заказ в апреле 2022 года.

select min(t1.rating)
from customers t1
join orders t2
on t1.cust_id = t2.cust_id
where month(t2.odate) = 4 and year(t2.odate) = 2022;

-- Выведите продавцов, которые оформили заказ на наибольшую сумму в период с 1 марта по 1 май 2022 года.

select max(t2.amt), t1.sell_id,t1.sname
from sellers t1
join orders t2
on t1.sell_id = t2.sell_id
where t2.odate between '2022-03-01' and '2022-05-01'
group by t1.sell_id, t1.sname;
-- Вывести : sell_id, amt

-- Определить какие покупки были совершены во вторник

SELECT *
FROM ORDERS
WHERE DAYOFWEEK(ODATE) = 3;
