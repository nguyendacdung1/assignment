create database ASM5
go
use ASM5
go
create table danhba(
     Name nvarchar(100),
	 address nvarchar(200),
	 birdday date,
	 Phone int unique
)
go
insert into danhba(Name,address,birdday,Phone) values (N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18',987654321),
(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18',09873452),
(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18',09832323),
(N'Nguyễn Văn An',N'111 Nguyễn Trãi, Thanh Xuân, Hà Nội','1987-11-18',09434343)
--Liệt kê danh sách những người trong danh bạ
select name from danhba
--Liệt kê danh sách số điện thoại có trong danh bạ
select Phone from danhba
--Liệt kê các số điện thoại của người có thên là Nguyễn Văn An.
select Phone from danhba
where Name=N'Nguyễn Văn An'
--Liệt kê những người có ngày sinh là 12/12/09
select* from danhba
where birdday='2009-12-12'
--Tìm số lượng số điện thoại của mỗi người trong danh bạ.
select Name,count(phone) as Tong from danhba
group by Name
--Tìm tổng số người trong danh bạ sinh vào thang 12.
select COUNT(Name) as tong from danhba
group by birdday




