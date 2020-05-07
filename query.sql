use classicmodels;

-- Example IN PARAM

delimiter //
create procedure get_cus_id (in in_cus_id int)
begin
select * from customers where customerNumber = in_cus_id;
end //
delimiter ;

call get_cus_id(175);

-- Example OUT PARAM

delimiter //
create procedure GetCustomerCountByCity(in in_city varchar(50), out total int)
begin
	select count(customerNumber) into total from customers where city = in_city;
end//
delimiter ;

call GetCustomerCountByCity('Lyon',@total);
select @total;

-- Example INOUT PARAM

delimiter //
create procedure increase_count (inout count int, in input int)
begin 
	set count = count + input;
end//
delimiter ;

set @counter  = 2 ;
call increase_count (@counter,2);

select @counter;
