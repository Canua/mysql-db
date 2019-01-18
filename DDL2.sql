desc employee;
-- SET SQL_SAFE_UPDATES = 0; // UPDATE USING SAFE
-- 데이터 삽입 insert문
select * from employee;

insert 
	into employee
    values (null, 'test', null);
    
insert 
	into employee(name, no, department_no)
    values ('test2', null, null);
    
    
insert into employee(name)
	value('test3');

-- 데이터 변경 Update문
update employee
    set name = '도우너',
		department_no = 1
        where no = 5;
        
-- 데이터 삭제 Delete
delete from employee 
	where name = 'test2';


        