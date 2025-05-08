--1.NAME, INITIALS and number of sets won for each player
SELECT Players.name,
       Players.initials,
       (SELECT sum(WON)
        FROM matches
        WHERE Matches.playerno = Players.playerno) AS sets_won
FROM players;

--2.NAME, PEN_DATE and AMOUNT sorted in descending order by AMOUNT
SELECT (Select name from PLAYERS where PLAYERS.PLAYERNO = PENALTIES.PLAYERNO) as Name, PEN_DATE, AMOUNT
from PENALTIES order by  AMOUNT desc ;

--3.TEAMNO, NAME (of the captain) per team
Select TEAMNO, (Select NAME from PLAYERS where PLAYERS.PLAYERNO = TEAMS.PLAYERNO) as Captain
from TEAMS;

--4.NAME (player name), WON, LOST of all won matches
SELECT (Select NAME from PLAYERS where PLAYERS.PLAYERNO = MATCHES.PLAYERNO) as Name,Won, LOST from IPIFEAS.MATCHES where WON > lost;

--5.PLAYERNO, NAME and penalty amount for each team player. If a player has not yet received a penalty, it should still be issued. Sorting should be done in ascending order of penalty amount
SELECT PLAYERNO, NAME, (Select sum(AMOUNT) from PENALTIES where PLAYERS.PLAYERNO = PENALTIES.PLAYERNO) as penalties from PLAYERS order by penalties;