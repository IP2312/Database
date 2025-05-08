--1.output of players' names who played for both team 1 and team 2.
SELECT (Select NAME from PLAYERS where PLAYERS.PLAYERNO = MATCHES.PLAYERNO) as Name
FROM matches
GROUP BY playerno
HAVING COUNT(distinct TEAMNO) = 2;

--2.output the NAME and INITIALS of the players who did not receive a penalty in 1980
SELECT NAME, INITIALS
from PLAYERS
where PLAYERNO in (Select PLAYERNO from PENALTIES where extract(year from PEN_DATE) = 1980);

--3.output of players who received at least one penalty over $80
SELECT PLAYERNO
from PLAYERS
where PLAYERNO IN (Select PLAYERNO from PENALTIES where AMOUNT > 80);

--4.output of players who had all penalties over $80. (no penalties under $80)
SELECT PLAYERNO
from PLAYERS
where PLAYERNO IN (Select PLAYERNO from PENALTIES where AMOUNT > 80)
  and PLAYERNO not in (Select PLAYERNO from PENALTIES where AMOUNT < 80);