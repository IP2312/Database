Select *
from NNEAGOE.TEST;

INSERT INTO NNEAGOE.test (user_id, user_name, email, birth_date)
VALUES (8, 'Iason', 'iason@example.com', TO_DATE('1988-12-23', 'YYYY-MM-DD'));


update NNEAGOE.test
set user_name = 'deadlock2'
where user_id = 1;



SELECT *
from NNEAGOE.test;



update NNEAGOE.test
set USER_Name = 'test'
where user_id = 5;
INSERT INTO NNEAGOE.test
VALUES (1, 'Dan', 'dana@example.com', to_date('1988-09-30', 'YYYY-MM-DD'));
SELECT *
from NNEAGOE.test
where user_id = 1;



drop table accounts;
CREATE TABLE accounts
(
    id      NUMBER PRIMARY KEY,
    balance NUMBER
);


--alter table NNEAGOE.test drop constraint user_primary_key;


INSERT INTO accounts
VALUES (1, 100);
INSERT INTO accounts
VALUES (2, 200);
INSERT INTO accounts
values (3, 400);
COMMIT;

grant all on accounts to NNEAGOE;

UPDATE accounts
SET balance = balance + 10
WHERE id = 1;
UPDATE accounts
SET balance = balance + 20
WHERE id = 2;

SELECT *
from accounts;

SELECT balance
from accounts
where id = 1;
SELECT balance
from accounts
where id = 2;
SELECT balance
from accounts
where id = 3;

select balance
from accounts
where balance > 100;

update accounts
set balance = balance - 100
where balance > 100;

revoke all on accounts from NNEAGOE;
Select *
from DBA_ROLE_PRIVS
where GRANTEE = 'NNEAGOE';
SELECT *
from USER_ROLE_PRIVS;

create table accounts2
(
    id      number(10) primary key,
    balance number(20)
)