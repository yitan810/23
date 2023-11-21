BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- if tuple is alreadly existing
UPDATE ReadArticles r
    SET readInterval = n.readInterval
    FROM NewReadArticles n
    WHERE r.subscriberPhone = n.subscriberPhone
    AND r.editionDate = n.editionDate
    AND r.articleNum = n.articleNum;

    
-- if tuple is not already in ReadArticles
INSERT INTO ReadArticles(subscriberPhone, editionDate, articleNum, readInterval)
    SELECT n.subscriberPhone, n.editionDate, n.articleNum, n.readInterval
    FROM NewReadArticles n
    WHERE NOT EXISTS (SELECT *
                      FROM ReadArticles);

COMMIT TRANSACTION;