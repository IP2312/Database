drop table parts;
create table parts (sub varchar2(3) not null primary key,
                    super varchar2(3),
                    price number(5,2))


INSERT INTO parts  VALUES('P1',NULL,130);
insert into parts values ('P2','P1',15);