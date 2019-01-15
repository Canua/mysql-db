-- practice02
-- 1
select max(salary)-min(salary) as '최고 임금 - 최저 임금' from salaries;

-- 2
select date_format(max(hire_date), '%Y년 %m월 %d일') from employees;
-- 조인
select date_format(max(hire_date), '%Y년 %m월 %d일') from employees, salaries
where employees.emp_no = salaries.emp_no and to_date = '9999-01-01';
-- 3
select date_format(min(hire_date), '%Y년 %m월 %d일') as '가장 오래 근속한 직원의 입사일' from employees;

-- 4
select avg(salary) from salaries where to_date = '9999-01-01';

-- 5
select max(salary) as '최고 연봉', min(salary) as '최저 연봉' from salaries where to_date = '9999-01-01';

-- 6
select YEAR(curdate()) - YEAR(min(birth_date)) as '최고 연장자' , YEAR(curdate())- YEAR(max(birth_date)) as '최고 어린 사원' from employees;
-- DATEDIFF