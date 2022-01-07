create database Assignment3
go
use Assignment3
go
create table customer(
      CusID int primary key,
      CusName nvarchar(100) not null,
	  CMND int unique not null,
	  address nvarchar(100) not null
)
go
create table Subscribers(
      SubNumber int unique not null,
	  SubType nvarchar(50),
	  registrationdate date,
	  CusID int foreign key references customer(CusID)
)
go

insert into customer(CusID,CusName,CMND,address) values (1,N'Nguyễn Nguyệt Nga',123456789,N'Hà Nội'),
                                                  (520,N'Nguyễn Đắc Dũng',052983181,N'Hà Nội'),
												  (03,N'Vũ Hải Đăng',924953828,N'Thái Bình'),
												  (24,N'Nguyễn Duy Triệu',113456789,N'Hưng Yên')
go
insert into Subscribers(SubNumber,SubType,registrationdate,CusID) values(123456789,N'Trả Trước','2002-12-12',1),
                                                                  (099999999,N'Trả Trước','2020-03-24',520),
																  (134647198,N'Trả Trước','2020-03-24',1),
																  (134647197,N'Trả Trước','2020-03-24',1),
																  (134647196,N'Trả Trước','2020-03-24',1),
																  (134647195,N'Trả Trước','2020-03-24',1),
																  (134647194,N'Trả Trước','2020-03-24',1),
																  (088888888,N'Trả Trước','2020-03-24',520)
go
--Hiển thị Thông Tin các khách hàng
select*from customer
--Hiển thị toàn bộ thông tin của các số thuê bao của công ty.
select SubNumber from Subscribers
--Hiển thị toàn bộ thông tin của thuê bao có số: 0123456789
select*from Subscribers
where SubNumber=123456789
--Hiển thị thông tin về khách hàng có số CMTND: 123456789
Select*from customer
where CMND=123456789
--Hiển thị các số thuê bao của khách hàng có số CMTND:123456789
select SubNumber from Subscribers
where CusID in( select CusID from customer
                  Where CMND= 123456789
				   )
				   go
--Liệt kê các thuê bao đăng ký vào ngày 2020-03-24
select*from Subscribers
where registrationdate='2020-03-24'
--Liệt kê các thuê bao có địa chỉ tại Hà Nội
select*from customer
where address=N'Hà Nội'
--Tổng số khách hàng của công ty.
select count(cusName)from customer
--Tổng số thuê bao của công ty.
select COUNT(SubNumber)from Subscribers
--Tổng số thuê bào đăng ký ngày2020-03-24 .
select COUNT(SubNumber)from Subscribers
where registrationdate='2020-03-24'
--Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.
Select*from customer
--Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
alter table Subscribers
alter column registrationdate date not null;
--Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09
select*from

create index Cus_Name on Customer(CusName); 

--View_KhachHang: Hiển thị các thông tin Mã khách hàng, Tên khách hàng, địa chỉ
create view View_KhachHang AS
select CusID,CusName,Address
from customer
select*from View_KhachHang
--View_KhachHang_ThueBao: Hiển thị thông tin Mã khách hàng, Tên khách hàng, Số thuê bao
create view View_KhachHang_ThueBao AS
select customer.CusID,customer.CusName,Subscribers.SubNumber
from customer
join Subscribers
on customer.CusID=Subscribers.CusID
select*from View_KhachHang_ThueBao
