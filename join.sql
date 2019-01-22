select * from salaries;
select * from employees;
select * from dept_emp;
select * from departments;
-- equijoin ( inner join )

-- 현재 근무중인 직원의 이름과 직책을 출력하세요.
select a.emp_no, a.first_name, b.title
	from employees a, titles b
	where a.emp_no = b.emp_no       -- join 조건 ( 연관 관계)
    and b.to_date = '9999-01-01';    -- 선택 조건
    
    
-- 현재 근무중인 직책이 Senior Enginner인 
-- 여자 직원의 이름을 출력하세요.
select a.emp_no, a.first_name
	from employees a, titles b
	where a.emp_no = b.emp_no       -- join 조건 ( 연관 관계)
    and b.to_date = '9999-01-01'    -- 선택 조건
    and b.title = 'Senior Engineer'
    and a.gender = 'f';
    
    
-- 
-- ANSI/ISO SQL의 JOIN
-- 

-- 1. natural join
select a.emp_no, a.first_name, b.title
	from employees a
    natural join titles b
	where b.to_date = '9999-01-01';   

-- 2. join ~ using  2개 이상의 공통된 column이 있을 때 사용
select a.emp_no, a.first_name, b.title
	from employees a
    join titles b 
    using (emp_no)
	where b.to_date = '9999-01-01';   

-- 3. join ~ on 공통된 이름의 column이 없는 경우 보편적 사용
select a.emp_no, a.first_name, b.title
	from employees a
    join titles b 
    on a.emp_no = b.emp_no
	where b.to_date = '9999-01-01';   

-- ex1)
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름' , c.dept_name as '근무 부서'
	from employees a, dept_emp b, departments c
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    order by concat(a.first_name, ' ', a.last_name) asc;


-- ex2)
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름', b.salary as '연봉'
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
     order by concat(a.first_name, ' ', a.last_name) asc;
    

select emp_no, first_name, last_name , hire_date from employees;


select emp_no, concat(first_name, ' ' ,last_name) hire_date from employees where  concat(first_name, ' ' ,last_name) like '%G';
