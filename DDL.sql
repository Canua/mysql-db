-- 테이블 생성 Create Table
drop table member;

create table member (
	no int unsigned not null,
    email varchar(50) not null,
    password varchar(20) not null,
    name varchar (20),
    department_name varchar(20) not null default 'none',
    
    primary key(no)
);
desc member;
select * from member;

-- 테이블 수정
-- column 추가
alter table member add column juminbunho char(13) not null;
-- column 삭제
alter table member drop column juminbunho;
-- column 추가 위치 지정
alter table member add column juminbunho char(13) not null first;
-- column 삭제
alter table member drop column juminbunho;
-- cloumn 추가 위치 지정2
alter table member add column juminbunho char(13) not null after name;
-- column 삭제
alter table member drop column juminbunho;
-- join_date 추가
alter table member add column join_date datetime not null;
-- no 변경
alter table member change no no int unsigned not null auto_increment;
-- depatment_name 변경
alter table member change department_name dept_name varchar(20) not null default 'none';

desc member;

-- table 이름 변경
alter table member rename user;

desc user;

-- foreign key constraint 외래키 (제약조건 : 데이터의 생성, 삭제, 수정에 제약을 준다.)

-- dept  테이블 생성
create table dept(
	no int unsigned not null auto_increment,
    name varchar(50) not null, 
    primary key(no)
);
desc dept;

drop table user;

-- user 변경 값을 다 가진 테이블 생성
create table user (
	no int unsigned not null auto_increment,
    email varchar(50) not null,
    password varchar(64) not null,
    name varchar (20),
    juminbunho char(13) not null, 
    join_date datetime not null,
    dept_no int unsigned,
    
    primary key(no),
    -- 외래키 
    foreign key(dept_no) references dept(no)
       on delete set null -- restrict, set null, cascade
);

insert into dept(name) values('개발팀');
select * from dept;

insert into user values (null, 'a@a.com', password('1234'), '둘리', '', now(), 3);

-- on delete restrict
delete from user where no = 3;
delete from dept where no = 2;

select * from user;
desc user;



