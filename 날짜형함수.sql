-- 날짜형 함수
select curdate(), current_date();

select curtime(), current_time();

-- now(), sysdate() 차이점
-- now 쿼리가 실행 될 때 시간이 계속 유지
-- sysdate은 쿼리가 실행(출력)될 때마다 현재 시간으로 세팅
select now(), sysdate();
select emp_no, now()
	from employees;
select emp_no, sysdate()
	from employees;    

-- 포맷팅
select first_name,
	date_format(hire_date, '%Y-%m-%d %h:%i:%s')
    from employees;
select first_name,
	date_format(hire_date, '%Y년 %m월 %d일  %h:%i:%s')
    from employees;
    
-- 각 직원들에 대해 직원의 이름과 근무개월수
select first_name,
	   concat(
       cast( period_diff(
			date_format(curdate(), '%Y%m'),
			date_format(hire_date, '%Y%m')) as char),
			'개월')
       from employees;

-- 각사원들 입사 후, 6개월 뒤에 정규직으로 발령이 된다.
-- 발령날은 언제?
-- month , week, year, day
select first_name,
	   hire_date,
	   date_add(hire_date, interval 6 month)
       from employees;
-- 내가 태어난지 100일 후 날짜 구하기
select date_add(
			cast('1994-7-25' as DATE),
				interval 100 day);