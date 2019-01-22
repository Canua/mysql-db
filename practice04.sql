-- practice04
-- 1
select count(*)
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and b.salary > (select avg(salary)
	from salaries
    where to_date = '9999-01-01');

-- 2 
select a.emp_no as '사번', who as '이름', dept as '부서', max as '연봉'
from(select concat(a.first_name,' ' ,a.last_name) as who, a.emp_no, max(b.salary) as max, d.dept_name as dept
				from employees a, salaries b, dept_emp c, departments d
				where a.emp_no = b.emp_no
				and a.emp_no = c.emp_no
				and c.dept_no = d.dept_no
				and b.to_date = '9999-01-01'
				and c.to_date = '9999-01-01'
				group by d.dept_name
				having max(b.salary)) a
				group by max desc;

select concat(a.first_name,' ' ,a.last_name) as who, a.emp_no, max(b.salary) as max, d.dept_name as dept
		from employees a, salaries b, dept_emp c, departments d
		where a.emp_no = b.emp_no
		and a.emp_no = c.emp_no
		and c.dept_no = d.dept_no
		and b.to_date = '9999-01-01'
		and c.to_date = '9999-01-01'
		group by d.dept_name
        having max(b.salary);
-- 3
select a.emp_no, concat(a.first_name,' ' ,a.last_name), b.salary as '연봉', d.dept_name as '부서'
	from employees a, salaries b, dept_emp c, departments d, (select d.dept_name , avg(b.salary) as avg_salary
				from employees a, salaries b, dept_emp c, departments d
				where a.emp_no = b.emp_no
				and a.emp_no = c.emp_no
				and c.dept_no = d.dept_no
				and b.to_date = '9999-01-01'
				and c.to_date = '9999-01-01'
				group by d.dept_name
				) e
		where a.emp_no = b.emp_no
		and a.emp_no = c.emp_no
		and c.dept_no = d.dept_no
		and d.dept_name = e.dept_name
		and b.salary > avg_salary
		and b.to_date = '9999-01-01'
		and c.to_date = '9999-01-01';



select d.dept_name , avg(b.salary)
	from employees a, salaries b, dept_emp c, departments d
    where a.emp_no = b.emp_no
		and a.emp_no = c.emp_no
		and c.dept_no = d.dept_no
		and b.to_date = '9999-01-01'
		and c.to_date = '9999-01-01'
        group by d.dept_name;
        
        
-- 4 



-- 5
select a.emp_no, concat(a.first_name,' ' ,a.last_name), b.salary as '연봉', e.title as '직책'
	from employees a, salaries b, dept_emp c, departments d, titles e
     where a.emp_no = b.emp_no
	 and a.emp_no = c.emp_no
	 and c.dept_no = d.dept_no
     and a.emp_no = e.emp_no
	 and b.to_date = '9999-01-01'
	 and c.to_date = '9999-01-01'
     and e.to_date = '9999-01-01'
     and d.dept_name = (select d.dept_name
					from employees a, salaries b, dept_emp c, departments d
					where a.emp_no = b.emp_no
					and a.emp_no = c.emp_no
					and c.dept_no = d.dept_no
					and b.to_date = '9999-01-01'
					and c.to_date = '9999-01-01'
					group by d.dept_name
					order by b.salary desc
					limit 0,1)
					order by b.salary desc;


-- 6
select d.dept_name
	from employees a, salaries b, dept_emp c, departments d
			where a.emp_no = b.emp_no
			and a.emp_no = c.emp_no
			and c.dept_no = d.dept_no
			and b.to_date = '9999-01-01'
			and c.to_date = '9999-01-01'
            group by d.dept_name
            having d.dept_name = (select d.dept_name
						from employees a, salaries b, dept_emp c, departments d
						where a.emp_no = b.emp_no
						and a.emp_no = c.emp_no
						and c.dept_no = d.dept_no
						and b.to_date = '9999-01-01'
						and c.to_date = '9999-01-01'
						group by d.dept_name
						order by avg(b.salary) desc
						limit 0,1
            );
            
            
            
            select d.dept_name, avg(b.salary) as max_avg
	from employees a, salaries b, dept_emp c, departments d
    where a.emp_no = b.emp_no
			and a.emp_no = c.emp_no
			and c.dept_no = d.dept_no
			and b.to_date = '9999-01-01'
			and c.to_date = '9999-01-01'
            group by d.dept_name;
			

-- 7 평균 연봉이 가장 높은 직책?
SELECT 
    c.title, ROUND(AVG(b.salary)) AS avg_salary
FROM
    employees a,
    salaries b,
    titles c
WHERE
    a.emp_no = b.emp_no
        AND a.emp_no = c.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
GROUP BY c.title
HAVING avg_salary = (SELECT 
        MAX(avg_salary)
    FROM
        (SELECT 
            ROUND(AVG(b.salary)) AS avg_salary
        FROM
            employees a, salaries b, titles c
        WHERE
            a.emp_no = b.emp_no
                AND a.emp_no = c.emp_no
                AND b.to_date = '9999-01-01'
                AND c.to_date = '9999-01-01'
        GROUP BY c.title) a);



-- 8 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
SELECT 
    f.dept_name AS '부서이름',
    a.first_name AS '사원이름',
    d.salary AS '연봉',
    g.first_name AS '매니저 이름',
    e.salary AS '매니저 연봉'
FROM
    employees a,
    dept_emp b,
    dept_manager c,
    salaries d,
    salaries e,
    departments f,
    employees g
WHERE
    a.emp_no = b.emp_no
        AND c.dept_no = b.dept_no
        AND a.emp_no = d.emp_no
        AND c.emp_no = e.emp_no
        AND c.dept_no = f.dept_no
        AND c.emp_no = g.emp_no
        AND b.to_date = '9999-01-01'
        AND c.to_date = '9999-01-01'
        AND d.to_date = '9999-01-01'
        AND e.to_date = '9999-01-01'
        AND d.salary > e.salary;




select * from employees;
select * from salaries;
select * from dept_emp;
select * from departments;
select * from titles;
select * from dept_manager;