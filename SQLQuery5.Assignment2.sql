create database Asignment2
go
use Asignment2
go
create table Hang(
      MaH int primary key,
	  TenH nvarchar(100) not null,
	  DiaChi nvarchar(200) not null,
	  SDT varchar(15) not null
)
go
create table SP(
      MaSP int primary key,
	  TenSP nvarchar(100) not null,
	  MaH int foreign key references Hang(MaH)
)
go
      
create table LoaiSP(
      MaLoaiSP int primary key,
	  TenLoaiSP nvarchar(200) not null,
	  MoTa nvarchar(200),
	  DonVi nvarchar(50),
	  Gia money,
	  SoLuong int not null,
	  MaSP int foreign key references SP(MaSP)
)
go

insert into Hang(MaH,TenH,DiaChi,SDT) values (123,N'Asus',N'USA','983232'),
                                             (133,N'Apple',N'USA','944232'),
											 (143,N'Samsung',N'Korea','984332')
                                              
go
insert into SP(MaSP,TenSP,MaH) values (1223,N'Máy Tính',123),
                                      (1232,N'Điện Thoại',123),
									  (1422,N'Máy in',123)
go
 insert into LoaiSP(MaLoaiSP,TenLoaiSP,MoTa,DonVi,Gia,SoLuong,MaSP) values(1223,N'Máy Tính T450',N'Máy nhập cũ',N'Chiếc','1000',10,1223),
                                      (1531,N'Asus ZenBook',N'Máy Mới',N'Chiếc','25199000',100,1223),
									  (4212,N'Asus ROG',N'Máy Mới',N'Chiếc','22499000',100,1223),
									  (1431,N'Iphone Xs Max 64GB',N'Đang Hot',N'Chiếc','11390000',50,1232),
									  (1234,N'Nokia1080',N'Đang hot',N'Chiếc','200',200,1232),
									  (1245,N'Máy in Samsung 450',N'Máy Loại',N'Chiếc','100',10,1422)
go
--Hiển thị các Hãng
select TenH from Hang 
--Hiển thị các Sản Phẩm
select TenSP from SP
--Liệt kê danh sách theo thứ tự ngược anphabet của tên
select*from LoaiSP
order by TenLoaiSP desc;
--Liệt kê danh sách sản phẩm của cửa hàng theo thứ thự giá giảm dần.
select*from LoaiSP
order by Gia desc;
--Hiển thị thông tin của hãng Asus.
select*from Hang
where TenH = N'Asus'
--Liệt kê danh sách sản phẩm còn ít hơn 11 chiếc trong kho
select*from LoaiSP
where SoLuong <=11
--Số hãng sản phẩm mà cửa hàng có.
select*from LoaiSP
where SoLuong>0
--Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
select sum(SoLuong)from LoaiSP
as"tong" 
where SoLuong>0;
--Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
update LoaiSP
     set Gia=100
	 where (Gia>0)

--index and view
create index Ten_H on Hang(TenH);
go
create index Mo_Ta on LoaiSP(MoTa);
go
--View_SanPham: với các cột Mã sản phẩm, Tên sản phẩm, Giá bán
create view View_SanPham AS
select MaSP,TenLoaiSP,Gia
from LoaiSP
select*from View_SanPham
--View_SanPham_Hang: với các cột Mã SP, Tên sản phẩm, Hãng sản xuất
create view View_SanPham_Hang AS
select sp.MaSP,sp.TenSP,hang.TenH
from Hang
join SP
on sp.MaH=Hang.MaH
select*from View_SanPham_Hang








