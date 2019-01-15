-- basic Query 연습

drop table pet;
-- table 제거

create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

desc pet;

insert into pet values('마음이', '대혁', 'dog', 'f', '2018-10-10', null);
insert into pet values('음이', '혁', 'dog', 'f', '2018-10-10', null);

select *from pet;



-- load data
load data local infile 'c:\\pet.txt' into table pet;

-- sql select 모든 데이터 검색
select * from pet;
-- where문 추가, name이 Bowser인 pet 검색
select * from pet where name = 'Bowser';
-- birth 1998-01-01 이후인 pet 검색
select * from pet where birth >= '1998-01-01';
-- 암컷 강아지를 고르세요
select * from pet where gender = 'f';
-- 강아지, gender가 m인 pet
select * from pet where species = 'dog' and gender = 'm';

-- 종이 snake 또는 bird인 펫
select *
	from pet
	where species = 'snake'
    or species = 'bird';
    
-- projection 반환될 열 조회
select name, birth from pet;

-- order by
-- default : asc
select name from pet order by birth;
select name, birth from pet order by birth desc;
select name, birth from pet order by birth asc;
-- gedner로 정렬한 후 birth로 재정렬
select name, birth, gender from pet order by gender asc, birth desc;

-- null 다루기
-- gender가 null 찾기
select * from pet where gender is null;
select * from pet where gender is not null;
select * from pet where death = '0000-00-00';


-- LIKE 검색 b로 시작하는 name을 가진 pet찾기
select *
	from pet
    where name like 'b%';

-- b로 시작하는 5자의 name을 가진 pet 찾기
select *
	from pet
    where name like 'b_____';

-- fy로 끝나는 name을 가진 pet 찾기    
select *
	from pet
    where name like '%fy';
-- w 문자열을 포함한 name을 가진 pet 찾기
select *
	from pet
    where name like '%w%';
-- 5자의 name을 가진 pet 찾기
select *
	from pet
    where name like '_____';
-- length를 사용한 5자의 이름을 가진 pet 찾기
select *
	from pet
    where length(name) = 5;

-- 애완견 수 세기
select count(*) from pet;
-- colume명 바꾸기
select count(*) as '총 애완동물 수' from pet;

-- 통계 함수 group by
select owner, count(*) as '애완동물 수'
from pet
group by owner;

-- having
select owner, count(*) as '애완동물 수'
from pet
group by owner
having count(*) > 1;

select owner, count(*)
from pet
where death is null
or death = '0000-00-00'
group by owner
having count(*) > 1;


