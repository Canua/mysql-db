select * from employees;
select * from employees order by hire_date;
-- 1
select concat(first_name, ' ', last_name) as '사원 이름' from employees where emp_no = '10944';

-- 2
select first_name as '이름', gender as '성별', hire_date as '입사일' from employees order by hire_date;

-- 3
select count(if(gender = 'm', gender, null)) as '남직원 수' ,count(if(gender = 'f', gender, null)) as '여직원 수' from employees;

-- 4
select count(*) as '근무중인 직원 수' from salaries where to_date = '9999-01-01';
-- select * from salaries;

-- 5
select * from departments;
select distinct count(dept_name) as '부서의 수' from departments;

-- 6
select *from dept_manager;
select count(*) as '근무중인 직원 수' from dept_manager where to_date = '9999-01-01';

-- 7
select distinct dept_name as '부서명' from departments order by length(dept_name) desc;

-- 8
select * from dept_emp;
select * from salaries;
select count(emp_no) as '급여 120,000 이상 사원' from salaries where salary >= 120000 and to_date = '9999-01-01';

-- 9
select * from titles;
select distinct title as '직책명' from titles order by length(title) desc;

-- 10
select count(emp_no) as 'Enginner 직책의 사원 수' from titles where tit리le = 'Engineer';

-- 11
select count(emp_no) from titles where emp_no = '13250';
select from_date as '시간', title as '직책' from titles where emp_no = '13250' order by to_date;
select concat(from_date, ' ' , to_date) as '시간', title as '직책' from titles where emp_no = '13250' order by to_date;

select * from employees
limit 2000, 1000;

select emp_no, first_name, hire_date from employees;

-- column heading alias
select emp_no as '번호',
	first_name as '이름',
	last_name as '성',
	hire_date as '입사일'
	from employees;

-- concat column의 값을 합친 것
select emp_no as '번호',
	concat(first_name, ' ', last_name) as '이름',
    hire_date as '입사일'
    from employees;
    
-- distinct 중복 값 제거
select distinct title from titles;
    
-- 
select concat(first_name, ' ', last_name) as '이름',
		gender,
        hire_date
        from employees
        order by hire_date asc;

select * from salaries
-- where '2000-12-31' < from_date and from_date < '2002-01-10';
where from_date like '2001-%';

select emp_no, salary
	from salaries
	where from_date like '2001-%'
	order by salary desc;

select first_name,
	gender,
	hire_date
	from employees
    where hire_date < '1991-01-01'
    and gender ='f';

select *
	from dept_emp
    where dept_no = 'd005'
    or dept_no = 'doo9';

select *
	from dept_emp
    where dept_no in ('d005', 'd009');
    
    
select first_name,
	gender,
    hire_date
    from employees
    where hire_date like '1989-__-__';
    
    
