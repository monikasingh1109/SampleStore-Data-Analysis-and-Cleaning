select * from orders
select * from products
select * from property


--Max quantity sold
select max(quantity),count(*)
from orders

--Unique products

select distinct(ProductID)
from Orders

--max quantity sold for each product

select distinct ProductID,Quantity
from Orders
where Quantity>2
order by ProductID asc, Quantity desc

--Unique property ID
select distinct PropertyID
from Orders
order by PropertyID asc

--Product category with total products sold

select ProductCategory,COUNT(*) as TotalCount
from Products
group by ProductCategory
order by TotalCount desc

--States with max number of store

select PropertyState,COUNT(*) as TotalStores
from Property
group by PropertyState
order by TotalStores desc

--Top 5 Product ID with max sales in terms of Quantity

select top 5 ProductID,sum(Quantity) as Sum_Quantity
from Orders
group by ProductID
order by Sum_Quantity desc

--Top 5 Porperty ID with max sales in terms of Quantity

select top 5 PropertyID,sum(Quantity) as TotalQuantity
from Orders
group by PropertyID
order by TotalQuantity desc

--Top 5 product name that did max sales in terms of quantity
select o.* ,
p.ProductCategory,p.ProductName,p.Price
from Orders o
left join Products p
on o.ProductID=p.ProductID

--top 5 products in terms of quantity

select top 5
p.ProductName,sum(o.Quantity) as Total_Quan
from Orders o
left join Products p
on o.ProductID=p.ProductID
group by ProductName
order by Total_Quan desc

--top 5 products in terms of sales

select top 5
p.ProductName,sum(o.Quantity*p.price) as Sum_sales
from Orders o
left join Products p
on o.ProductID=p.ProductID
group by p.ProductName
order by Sum_sales desc

--Top 5 cities in terms of sales

select top 5
pp.PropertyCity,sum(o.Quantity*p.price) as City_sales
from Orders o
left join Products p on o.ProductID=p.ProductID
left join Property pp on o.PropertyID=pp.[Prop ID]
group by pp.PropertyCity
order by City_sales desc

--Top products in EACH cities

select top 5
pp.PropertyCity,p.ProductName,sum(o.Quantity*p.price) as City_sales
from Orders o
left join Products p on o.ProductID=p.ProductID
left join Property pp on o.PropertyID=pp.[Prop ID]
where pp.PropertyCity= 'Atlanta'
group by pp.PropertyCity,p.ProductName
order by City_sales desc




