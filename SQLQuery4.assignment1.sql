create database Assignment1
go
use Assignment1
go
--  bảng lưu trữ thông tin khách hàng
create table Customer(
	CustomerID int primary key,
	CustomerName nvarchar(150) not null,
	CustomerAddress nvarchar(300) not null,
	Tel varchar(40) not null,
)
go
--  bảng lưu trữ sản phẩm trong kho
create table Product(
	ProductID varchar(40) primary key,
	ProductName nvarchar(200) not null,
	Unit nvarchar(40),
	Price money,
	Quantity int,
	ProductStatus nvarchar(300)
)
go
-- bảng lưu trữ Đơn Hàng
create table Orders(
	OrderID varchar(40) primary key,
	CustomerID int foreign key references Customer(CustomerID),
	OrderDate date
)
go
-- bảng lưu trữ thông tin chi tiết Đơn hàng
create table OrderDetails(
	OrderID varchar(40) foreign key references Orders(OrderID),
	ProductID varchar(40) foreign key references Product(ProductID),
	OrderStatus nvarchar(300),
	Price money,
	Quantity int
)
go
-- Thêm dữ liệu vào các bảng
insert into Customer(CustomerID, CustomerName, CustomerAddress, Tel)
	values
		(520, N'Nguyễn Đắc Dũng', N'Khoái Châu - Hưng Yên', '(+84) 585009531'),
		(521, N'Nguyễn Hải Tú', N'Hà Nội', '(+84) 999999999'),
		(522, N'Tạ Hữu Minh', N'Hòa Bình', '(+84) 988888888'),
		(123, N'Nguyễn Văn An', N'111 Nguyễn Trãi,Thanh Xuân,Hà Nội','(+84) 987654321')
go
insert into Product(ProductID, ProductName, ProductStatus, Unit, Price, Quantity)
	values
		('IT1', N'Laptop Acer nitro5 i7', N'Hàng Mới Nhập', N'Chiếc', 27850000, 1),
		('IT2', N'Máy Tính T450', N'Hàng Mới Nhập', N'Chiếc', 1000, 1),
		('IT3', N'SmartPhone Nokia5670', N'Điện thoại đang hot', N'Chiếc', 200, 2),
		('IT4', N'Máy In Samsung450', N'Đang Ế', N'Chiếc', 100, 1)
go
insert into Orders (OrderID, CustomerID, OrderDate)
	values
		('ord1', 520, '2021-12-24'),
		('ord2', 521, '2021-12-25'),
		('ord3', 522, '2021-12-26'),
		('ord4', 123, '2021-12-24')
go
insert into OrderDetails(OrderID, ProductID, OrderStatus, Price, Quantity)
	values
		('ord1', 'IT1', N'Đã nhận đơn', 27850000, 1),
		('ord4', 'IT2', N'Đã nhận đơn', 1000, 1),
		('ord4', 'IT3', N'Đang Kiểm Tra', 200, 2),
		('ord4', 'IT4', N'Đang giao hàng', 100, 1),
		('ord2', 'IT1', N'Đang giao hàng', 27850000, 1)
go
-- 4. Câu lệnh truy vấn
	-- Liệt kê danh sách khách hàng đã mua ở cửa hàng
	select CustomerName from Customer 
	where CustomerID in (
		select CustomerID from Orders
	)
	go
	-- Liệt kê danh sách sản phẩm của cửa hàng
	select ProductName from Product
	go
	-- Liệt kê danh sách các đơn hàng của cửa hàng
	select OrderID from Orders
	go
-- 5. Câu lệnh truy vấn
	-- Liệt kê danh sách khách hàng theo thứ tự alphabet
	select CustomerName from Customer
	order by CustomerName 
	go
	-- Liệt kê danh sách sản phẩm của cửa hàng theo thứ từ giá giảm dần
	select ProductName,Price from Product
	order by Price DESC
	go
	-- Liệt kê sản phẩm mà khách hàng Nguyễn Văn An đã mua
	select ProductName from Product
	where ProductID in (
		select ProductID from OrderDetails
		where OrderID in (
			select OrderID from Orders
			where CustomerID = 123
		)
	)
	go
-- 6. Câu lệnh truy vấn
	-- Số khách hàng đã mua hàng
	select COUNT (Distinct CustomerID) from Orders
	-- Số mặt hàng mà cửa hàng bán
	select count (ProductID) from Product
	-- Tổng tiền của từng đơn hàng
	select OrderID, sum(Price*Quantity) as 'TotalAmount' from OrderDetails
	group by OrderID 
-- 7. thay Đổi thông tin
	-- Thay đổi trường giá tiền của từng mặt hàng >0
	update Product
		set Price= 100
		where (Price > 0)
		go
	alter table OrderDetails
		add constraint Ck_OrdDetails_Price Check(Price > 0)
	-- Thay đổi ngày đặt hàng nhỏ hơn ngày hiện tại
	alter table Orders
		add constraint Ck_Ord_Date Check (OrderDate < getDate())
	-- Thêm trường ngày xuất hiện của sản phẩm trên thị trường
	alter table Product
		add PublicDate date	