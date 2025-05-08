-- 1.NAME, INITIALS and number of sets won for each player
SELECT PLAYERS.NAME, PLAYERS.INITIALS, sum(MATCHES.WON)
from PLAYERS
Join MATCHES On PLAYERS.PLAYERNO = MATCHES.PLAYERNO
group by PLAYERS.NAME, PLAYERS.INITIALS;

-- 2.NAME, PEN_DATE and AMOUNT sorted in descending order by AMOUNT
SELECT PLAYERS.NAME, PENALTIES.PEN_DATE , PENALTIES.AMOUNT from PLAYERS join PENALTIES on PLAYERS.PLAYERNO = PENALTIES.PLAYERNO order by AMOUNT desc ;

-- 3.TEAMNO, NAME (of the captain) per team
SELECT  TEAMNO, NAME from TEAMS join PLAYERS on TEAMS.PLAYERNO = PLAYERS.PLAYERNO;
-- 4.NAME (player name), WON, LOST of all won matches
SELECT  NAME,  WON, LOST from PLAYERS join MATCHES on PLAYERS.PLAYERNO = MATCHES.PLAYERNO where won > LOST;

-- 5. PLAYERNO, NAME and penalty amount for each team player. If a player has not yet received a penalty, it should still be issued. Sorting should be done in ascending order of penalty amount
SELECT  PLAYERS.PLAYERNO, PLAYERS.NAME, sum(PENALTIES.AMOUNT) as Penalties from PLAYERS left join penalties on PLAYERS.PLAYERNO = PENALTIES.PLAYERNO group by PLAYERS.PLAYERNO, PLAYERS.NAME order by Penalties;