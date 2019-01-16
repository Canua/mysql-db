
-- subquery

    
select a.emp_no , a.first_name, b.dept_no
	from employees a, dept_emp b
    where a.emp_no = b.emp_no
    and b.dept_no = (select  b.dept_no
					from employees a, dept_emp b
					where a.emp_no = b.emp_no
					and concat(a.first_name , ' ' , a.last_name) = 'Fai Bale'
					and b.to_date = '9999-01-01');
                    
                    

-- ex1) 현재 전체사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내시오
select a.first_name, b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and salary < (select avg(salary)
					from salaries 
                    where to_date = '9999-01-01')
order by b.salary desc;

-- ex2) 현재 가장 적은 평균 급여를 받고 있는 직책에 대한 평균 급여
select title, avg(a.salary) as avg_salary
			  from salaries a , titles b
			  where a.emp_no = b.emp_no
			  and a.to_date = '9999-01-01'
			  and b.to_date = '9999-01-01'
			  group by title;



select min(avg_salary)
		from(select title, round(avg(a.salary)) as avg_salary
			  from salaries a , titles b
			  where a.emp_no = b.emp_no
			  and a.to_date = '9999-01-01'
			  and b.to_date = '9999-01-01'
			  group by title) a;
              
              
              
              
select title, avg(a.salary) as avg_salary
 from salaries a , titles b
 where a.emp_no = b.emp_no
 and a.to_date = '9999-01-01'
 and b.to_date = '9999-01-01'
 group by title
 having round(avg(a.salary)) = ( select round(min(avg_salary))
		from(select title, avg(a.salary) as avg_salary
			  from salaries a , titles b
			  where a.emp_no = b.emp_no
			  and a.to_date = '9999-01-01'
			  and b.to_date = '9999-01-01'
			  group by title) a);