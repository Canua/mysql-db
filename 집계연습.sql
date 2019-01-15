-- 집계 함수(통계)
select emp_no, avg(salary), sum(salary)
	from salaries
    where emp_no = 10060;
    
select from_date, avg(salary), sum(salary)
	from salaries
    where emp_no = 10060;
    
-- 직원들의 평균 월급 및 월급 총계 구하기
select emp_no, avg(salary), sum(salary)
	from salaries
    group by emp_no;
    
select max(salary), min(salary)
		from salaries
        where emp_no = 10060;
        
-- 서브 쿼
select *
	from( 
    select
	   max(salary) as max_salary, 
	   min(salary) as min_salary
	   from salaries
	   where emp_no = 10060) a;
       
select emp_no, count(*) from titles group by emp_no;


select emp_no, avg(salary)
	from salaries
    group by emp_no
    having avg(salary) > 50000;