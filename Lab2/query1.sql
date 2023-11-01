SELECT DISTINCT e.editionDate AS theEditionDate
FROM Editions e
WHERE EXISTS (SELECT *
              FROM Articles a
              WHERE a.articleNum > e.numArticles
              AND a.articlePage > e.numPages
              AND a.editionDate = e.editionDate);