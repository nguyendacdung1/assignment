use Assignment1
go 
create index Product_name
on Product(ProductName);
go
create index Customer_name
on Customer(CustomerName);
go
create view View_KhachHang AS
select CustomerName,CustomerAddress,Tel
from Customer
select*from View_KhachHang
Create view View_SanPham AS
select ProductName,Price 
from Product
select*from View_SanPham

create view View_KhachHang_SanPham as
select Customer.CustomerName, Customer.Tel, Product.ProductName, Product.Quantity, Orders.OrderDate from Product
join OrderDetails
on OrderDetails.ProductID = Product.ProductID
join Orders
on Orders.OrderID = OrderDetails.OrderID
join Customer
on Customer.CustomerID = Orders.CustomerID
 
 select*from View_KhachHang_SanPham
