-- practice01
-- 1
select concat(first_name, ' ', last_name) as '사원 이름' from employees where emp_no = '10944';

-- 2
select first_name as '이름', gender as '성별', hire_date as '입사일' from employees order by hire_date;

-- 3
select count(if(gender = 'm', gender, null)) as '남직원 수' ,count(if(gender = 'f', gender, null)) as '여직원 수' from employees;

-- 4
select count(*) as '근무중인 직원 수' from salaries where to_date = '9999-01-01';

-- 5
select distinct count(dept_name) as '부서의 수' from departments;

-- 6
select count(*) as '근무중인 직원 수' from dept_manager where to_date = '9999-01-01';

-- 7
select distinct dept_name as '부서명' from departments order by length(dept_name) desc;

-- 8
select count(emp_no) as '급여 120,000 이상 사원' from salaries where salary >= 120000 and to_date = '9999-01-01';

-- 9
select distinct title as '직책명' from titles order by length(title) desc;

-- 10
select count(emp_no) as 'Enginner 직책의 사원 수' from titles where title = 'Engineer' and to_date = '9999-01-01';

-- 11
select to_date as '시간', title as '직책' from titles where emp_no = '13250' order by to_date;
-- select concat(from_date, ' ' , to_date) as '시간', title as '직책' from titles where emp_no = '13250' order by to_date;

