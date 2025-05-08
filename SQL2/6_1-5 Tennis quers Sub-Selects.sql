SELECT
    Players.name,
    Players.initials,
    (
        SELECT COUNT(*)
        FROM matches
        WHERE Matches.playerno = Players.playerno
    ) AS sets_won
FROM players ;