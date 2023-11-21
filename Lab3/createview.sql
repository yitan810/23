CREATE VIEW ProlificIn2021View AS
    SELECT articleAuthor, COUNT(*) AS articleCount2021, COUNT(DISTINCT editionDate) AS differentEditionCount2021
    FROM Articles
    WHERE editionDate >= DATE '2021-01-01'
    AND editionDate < DATE '2022-01-01'
    GROUP BY articleAuthor
    HAVING COUNT(*) >= 3 AND COUNT(DISTINCT editionDate) >= 2;

CREATE VIEW ProlificIn2022View AS
    SELECT articleAuthor, COUNT(*) AS articleCount2022, COUNT(DISTINCT editionDate) AS differentEditionCount2022
    FROM Articles
    WHERE editionDate >= DATE '2022-01-01'
    AND editionDate < DATE '2023-01-01'
    GROUP BY articleAuthor;