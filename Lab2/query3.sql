SELECT DISTINCT a.articleNum, a.articleAuthor, a.articlePage
FROM Articles a
WHERE NOT EXISTS (SELECT *
              FROM ReadArticles r, Subscribers s
              WHERE r.editionDate = a.editionDate
              AND r.articleNum = a.articleNum
              AND r.readInterval >  INTERVAL '20' MINUTE
              AND s.subscriberPhone = r.subscriberPhone
              AND s.subscriberName LIKE '%er%'
              );