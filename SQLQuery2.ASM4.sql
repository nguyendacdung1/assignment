create database ASM4
go
use ASM4
go
create table NguoiNhan(
      idnguoinhan int primary key,
	  Tennguoinhan nvarchar(100)
)
go
create table LoaiSP(
      idLoaiSP varchar(50) primary key,
	  TenLoaiSP nvarchar(200),
	  idnguoinhan int foreign key references NguoiNhan(idnguoinhan)
)
go
create table SP(
       idSP int primary key,
	   TenSP nvarchar(200),
	   NgaySX date,
	   idLoaiSP varchar(50) foreign key references LoaiSP(idLoaiSP)
)
go
insert into NguoiNhan(idnguoinhan,Tennguoinhan) values (987688,N'Nguyễn Văn An'),
                                                       (987689,N'Nguyễn Duy Hoàng'),
													   (987687,N'Nguyễn Huy Hải'),
													   (987686,N'Mai Linh'),
													   (987685,N'Đỗ Hoàng Yến')
go
insert into LoaiSP(idLoaiSP,TenLoaiSP,idnguoinhan) values ('Z37E',N'Máy Tính Sách Tay',987688),
                                                          ('AN5',N'Acer nitro',987686),
														  ('AR5',N'Acer rizen',987685)
go
insert into SP(idSP,TenSP,NgaySX,idLoaiSP) values (111111,N'Máy Tính Sách Tay Z37','2009-12-12','Z37E'),
                                                  (123456,N'Acer nitro5 core i7 ','2021-11-24','AN5'),
												  (124567,N'Acer rizen5 core i5','2020-02-03','AR5'),
												  (123546,N'Acer nitro5 core i5 ','2019-11-24','AN5'),
												  (124576,N'Acer rizen5 core i7','2021-02-03','AR5')
go

--Liệt kê danh sách loại sản phẩm của công ty.
select TenLoaiSP from LoaiSP
go
--Liệt kê danh sách sản phẩm của công ty.
select TenSP from SP
go
--Liệt kê danh sách người chịu trách nhiệm của công ty.
select tennguoinhan from NguoiNhan
go
--Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
select TenLoaiSP from LoaiSP 
go
--Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
select tennguoinhan from NguoiNhan
go
--Liệt kê các sản phẩm của loại sản phẩm có mã số là AN5.
select*from SP
where idLoaiSP='AN5'
go
--Liệt kê các sản phẩm Đỗ Hoàng Yến chịu trách nhiệm theo thứ tự giảm đần của mã.
select*from SP
where idLoaiSP='AR5'
order by idSP DESC
go
--Số sản phẩm của từng loại sản phẩm.
select*from 
go
--Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm.
select*from LoaiSP
select*from SP
go
--Hiển thị toàn bộ thông tin về người chịu trách nhiêm, loại sản phẩm và sản phẩm.
select*from SP
where idLoaiSP in(
               select idLoaiSP from LoaiSP
			   where idnguoinhan=987685
			   )