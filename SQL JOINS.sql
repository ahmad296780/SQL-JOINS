/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT PRODUCTS.NAME, categories.Name
FROM products inner JOIN CATEGORIES ON PRODUCTS.CATEGORYID = categories.CategoryID
WHERE categories.Name LIKE 'COMPUTERS';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT PRODUCTS.NAME, products.Price, reviews.Rating
 FROM PRODUCTS LEFT JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating LIKE 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.EmployeeID, sales.EmployeeID, sum(sales.Quantity) as total
from employees inner join sales on employees.EmployeeID = sales.EmployeeID
group by employees.EmployeeID
order by total desc
limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name, categories.Name
from departments inner join categories 
on categories.DepartmentID = departments.DepartmentID
where categories.name like '%games%' or categories.Name like '%appliances%';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, sum(sales.Quantity) as 'total sold', sum(sales.PricePerUnit * sales.Quantity)
as 'total sales price' from products inner join sales
on products.ProductID = sales.ProductID
where products.Name like '%california';
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. 
(only return for the lowest rating!) */
select products.name, reviews.Reviewer, reviews.Rating, reviews.Comment
from products right join reviews
on products.ProductID = reviews.ProductID
where products.Name like '%visio tv';


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
select employees.EmployeeID, employees.FirstName, employees.LastName,
products.Name, sales.Quantity from employees inner join sales on sales.EmployeeID = employees.EmployeeID
left join products
on products.ProductID = sales.ProductID;
-- where sales.Quantity != null;