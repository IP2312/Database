Select YEAR_JOINED, count(*)
from Players
group by YEAR_JOINED
order by YEAR_JOINED;

SELECT avg(count(*))
from PENALTIES
group by PLAYERNO;

SELECT count(*)
from PENALTIES
where extract(YEAR from PEN_DATE) < 1983;

SELECT TOWN, count(TOWN)
from PLAYERS
group by TOWN
having count(TOWN) > 4;

Select PLAYERNO
from PENALTIES
group by PLAYERNO
having sum(AMOUNT) > 150;



SELECT PLAYERS.NAME, PLAYERS.INITIALS, count(*) as Penalties
from PLAYERS,
     PENALTIES
where PLAYERS.PLAYERNO = PENALTIES.PLAYERNO
group by PLAYERS.NAME, PLAYERS.INITIALS
having count(*) > 1;

SElect Extract(year from PEN_DATE)
from PENALTIES
group by Extract(year from PEN_DATE)
having count(*) = 2;

SELECT PLAYERS.name, PLAYERS.initials, sum(PENALTIES.AMOUNT)
from PLAYERS,
     PENALTIES
where players.PLAYERNO = PENALTIES.PLAYERNO
group by PLAYERS.name, PLAYERS.initials
having sum(AMOUNT) > 40;

SELECT PLAYERS.name, PLAYERS.initials, sum(PENALTIES.AMOUNT)
from PLAYERS,
     PENALTIES
where players.PLAYERNO = PENALTIES.PLAYERNO
group by PLAYERS.name, PLAYERS.initials
having sum(AMOUNT) = (Select max(sum(AMOUNT)) from PENALTIES group by PLAYERNO);

SELECT extract(year from PEN_DATE), count(*) Penalties
from PENALTIES
group by extract(year from PEN_DATE)
having count(*) = (select max(count(*)) from PENALTIES group by extract(year from PEN_DATE));

SELECT PLAYERNO, TEAMNO, (WON - LOST)
from MATCHES
order by (WON - LOST) DESC;



