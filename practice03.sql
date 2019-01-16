select *from employees;
select *from salaries;
select *from departments;
select *from titles;
select *from dept_emp;

-- 다 현재 <>9999-01-01
-- 1
select a.emp_no as '사번', a.first_name as '이름' , b.salary as '연봉'
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    order by salary desc;
    
-- 2
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름', b.title as '직책'
	from employees a, titles b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    order by concat(a.first_name, ' ', a.last_name) asc;
    
-- 3
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름', c.dept_name as '부서'
	from employees a, dept_emp b, departments c
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    order by concat(a.first_name, ' ', a.last_name) asc;
    
    
-- 4
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름', d.salary as '연봉', e.title as '직책', c.dept_name as '부서'
	from employees a, dept_emp b, departments c, salaries d, titles e
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and a.emp_no = d.emp_no 
    and a.emp_no = e.emp_no
    and b.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and e.to_date = '9999-01-01'
    order by concat(a.first_name, ' ', a.last_name) asc;
    
-- 5
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름'
	from employees a, titles b
    where a.emp_no = b.emp_no
    and b.title = 'Technique Leader'
    and b.to_date <> '9999-01-01';
    
-- 6
select concat(a.first_name, ' ', a.last_name) as '이름',  c.dept_name as '부서명', d.title as '직책'
	from employees a, dept_emp b, departments c, titles d
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and a.emp_no = d.emp_no 
    and b.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and a.last_name like 'S%';

    
-- 7
select concat(a.first_name, ' ', a.last_name) as '사원 이름'
	from employees a, titles b, salaries c
    where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
	and b.title = 'Engineer'
    and c.salary > 40000
    order by c.salary desc;
    
-- 8
select c.title, b.salary
     from employees a, salaries b, titles c
    where a.emp_no = b.emp_no
      and a.emp_no = c.emp_no
      and b.to_date = '9999-01-01'
      and c.to_date - '9999-01-01'
	  and b.salary > 50000
 order by b.salary desc;

    
-- 9
select d.dept_name, avg(salary)
     from employees a, dept_emp b, salaries c, departments d
	 where a.emp_no = b.emp_no
       and a.emp_no = c.emp_no
       and b.dept_no = d.dept_no
       and b.to_date = '9999-01-01'
       and c.to_date - '9999-01-01'      
  group by d.dept_name
  order by avg(salary) desc; 
   
-- 10
select c.title, avg(b.salary)
     from employees a, salaries b, titles c
    where a.emp_no = b.emp_no
      and a.emp_no = c.emp_no
      and b.to_date = '9999-01-01'
      and c.to_date - '9999-01-01'
 group by c.title
 order by avg(b.salary) desc;
    
-- ppt
-- 5
-- if(count(a.emp_no) > 100, avg(a.salary), null)
select b.title as '직책', avg(a.salary) as '평균 연봉', count(b.title) as '인원 수'
	from salaries a, titles b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title
    having count(b.title)> 100;
    
-- 6
select c.dept_name as '부서', avg(d.salary) as 'Enginner 평균 급여'
	from titles a, dept_emp b, departments c, salaries d
    where a.emp_no = b.emp_no
    and a.emp_no = d.emp_no
    and b.dept_no = c.dept_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and a.title = 'Engineer'
	group by c.dept_name;

-- 7 
select a.title as '직책', sum(b.salary)
	from titles a, salaries b
    where a.emp_no = b.emp_no
    group by a.title
    having a.title <> 'Engineer'
	and sum(b.salary) > 2000000000;