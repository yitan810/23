SELECT DISTINCT sb.subscriberName AS theSubscriberName, sb.subscriberAddress AS theSubscriberAddress, 
a.editionDate AS theEditionDate
FROM Subscribers sb, Articles a
WHERE sb.subscriberName = a.articleAuthor
AND EXISTS (SELECT *
            FROM Articles a2
            WHERE a.articleAuthor = a2.articleAuthor
            AND a.editionDate = a2.editionDate
            AND a.articleNum != a2.articleNum
            );