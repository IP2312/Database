drop table parts
/
create table parts (sub varchar2(3) not null primary key,
                    super varchar2(3),
                    price number(5,2))
/
insert into parts values ('P1',NULL,130)
/
insert into parts values ('P2','P1',15)
/
insert into parts values ('P3','P1',65)
/
insert into parts values ('P4','P1',20)
/
insert into parts values ('P9','P1',45)
/
insert into parts values ('P5','P2',10)
/
insert into parts values ('P6','P3',10)
/
insert into parts values ('P7','P3',20)
/
insert into parts values ('P8','P3',25)
/
insert into parts values ('P12','P7',10)
/
insert into parts values ('P10','P9',12)
/
insert into parts values ('P11','P9',21)
/

drop table players;

create table players(
  playerno number(4) not null,
  name varchar2(15),
  initials varchar2(3),
  year_of_birth number(4),
  sex char(1),
  year_joined number(4),
  street varchar2(15),
  houseno varchar2(4),
  postcode varchar2(6),
  town varchar2(10),
  phoneno varchar2(10),
  leagueno varchar2(4));

drop table teams;

create table teams(
  teamno number(2) not null,
  playerno number(4),
  division varchar2(6));

drop table matches;

create table matches(
  matchno number(5) not null,
  teamno number(2),
  playerno number(4),
  won number(1),
  lost number(1));

drop table penalties;

create table penalties(
  paymentno number(4) not null,
  playerno number(4),
  pen_date date,
  amount decimal(7,2));


  delete from players;

insert into players values
 (6,'Parmenter','R',1964,'M',1977,'Haseltine Lane',
  '80','1234KK','Stratford','070-476537','8467');
insert into players values
 (44,'Baker','E',1963,'M',1980,'Lewis Street',
  '23','4444LJ','Inglewood','070-368753','1124');
insert into players values
 (83,'Hope','PK',1956,'M',1982,'Magdalena Road',
  '16A','1812UP','Stratford','070-353548','1608');
insert into players values
 (2,'Everett','R',1948,'M',1975,'Stoney Road',
  '43','3575NH','Stratford','070-237893','2411');
insert into players values
 (27,'Collins','DD',1964,'F',1983,'Long Drive',
  '804','8457DK','Eltham','079-234857','2513');
insert into players values
 (104,'Moorman','D',1970,'F',1984,'Stout Street',
  '65','9437AO','Eltham','079-987571','7060');
insert into players values
 (7,'Wise','GWS',1963,'M',1981,'Edgecombe Way',
  '39','9758VB','Stratford','070-347689',NULL);
insert into players values
 (57,'Brown','M',1971,'M',1985,'Edgecombe Way',
  '16','4377CB','Stratford','070-473458','6409');
insert into players values
 (39,'Bishop','D',1956,'M',1980,'Eaton Square',
  '78','9629CD','Stratford','070-393435',NULL);
insert into players values
 (112,'Bailey','IP',1963,'F',1984,'Vixen Road',
  '8','6392LK','Plymouth','010-548745','1319');
insert into players values
 (8,'Newcastle','B',1962,'F',1980,'Station Road',
  '4','6584RQ','Inglewood','070-458458','2983');
insert into players values
 (100,'Parmenter','P',1963,'M',1979,'Haseltine Lane',
  '80','1234KK','Stratford','070-494593','6524');
insert into players values
 (28,'Collins','C',1963,'F',1979,'Old Main Road',
  '10','1294QK','Midhurst','071-659599',NULL);
insert into players(PLAYERNO,NAME,INITIALS,YEAR_OF_BIRTH,SEX,YEAR_JOINED,STREET,HOUSENO,POSTCODE,TOWN,PHONENO,LEAGUENO)  values
 (95,'Miller','P',1963,'M',1972,'High Street',
  '33A','5746OP','Douglas','070-867564',NULL);

delete from teams;

insert into teams values (1,6,'first');
insert into teams values (2,27,'second');

delete from matches;

insert into matches values (1,1,6,3,1);
insert into matches values (2,1,6,2,3);
insert into matches values (3,1,6,3,0);
insert into matches values (4,1,44,3,2);
insert into matches values (5,1,83,0,3);
insert into matches values (6,1,2,1,3);
insert into matches values (7,1,57,3,0);
insert into matches values (8,1,8,0,3);
insert into matches values (9,2,27,3,2);
insert into matches values (10,2,104,3,2);
insert into matches values (11,2,112,2,3);
insert into matches values (12,2,112,1,3);
insert into matches values (13,2,8,0,3);

delete from penalties;

insert into penalties values (1,6,'08-12-80',100.0);
insert into penalties values (2,44,'05-05-81',75.0);
insert into penalties values (3,27,'10-09-83',100.0);
insert into penalties values (4,104,'08-12-84',50.0);
insert into penalties values (5,44,'08-12-80',25.0);
insert into penalties values (6,8,'08-12-80',25.0);
insert into penalties values (7,44,'30-12-82',30.0);
insert into penalties values (8,27,'12-12-84',75.0);

drop table emp;
drop table dept;
drop table salgrade;

CREATE TABLE DEPT (
 DEPTNO              NUMBER(2) CONSTRAINT DEPT_PRIMARY_KEY PRIMARY KEY,
 DNAME               varchar2(14),
 LOC                 varchar2(13));

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP (
 EMPNO               NUMBER(4) CONSTRAINT EMP_PRIMARY_KEY PRIMARY KEY , 
 ENAME               varchar2(10),
 JOB                 varchar2(9),
 MGR                 NUMBER(4) CONSTRAINT EMP_SELF_KEY REFERENCES EMP (EMPNO),
 HIREDATE            DATE,
 SAL                 NUMBER(7,2),
 COMM                NUMBER(7,2),
 DEPTNO              NUMBER(2) NOT NULL CONSTRAINT EMP_FOREIGN_KEY REFERENCES DEPT (DEPTNO));

 /* disable constraint until we have the data in */
alter table emp disable constraint EMP_SELF_KEY;

INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17-12-80',800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20-02-81',1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22-02-81',1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'2-04-81',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'28-09-81',1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'1-05-81',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'9-06-81',2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'09-12-82',3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17-11-81',5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'8-08-81',1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'12-01-83',1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'3-12-81',950,NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'3-12-81',3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23-01-82',1300,NULL,10);


alter table emp enable constraint EMP_SELF_KEY;
  
CREATE TABLE SALGRADE (
 GRADE               NUMBER,
 LOSAL               NUMBER,
 HISAL               NUMBER);
 
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

DROP TABLE DUMMY;
 
CREATE TABLE DUMMY (
 DUMMY               NUMBER );
 
INSERT INTO DUMMY VALUES (0);
COMMIT;

select DNAME as ABTEILUNGSNAME from dept;