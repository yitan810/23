SELECT sp.subscriberPhone, sp.subscriptionStartDate, 
DATE(sp.subscriptionStartDate + sp.subscriptionInterval) AS subcriptionEndDate, sb.subscriberName, 
sk.rate AS subcriptionRate
FROM Subscriptions sp, Subscribers sb, SubscriptionKinds sk
WHERE sp.subscriptionStartDate <= DATE'2022-12-07'
AND DATE(sp.subscriptionStartDate + sp.subscriptionInterval) >= '2023-10-03'
AND sp.subscriberPhone = sb.subscriberPhone
AND sb.subscriberAddress IS NOT NULL
AND sp.subscriptionMode = sk.subscriptionMode
AND sp.subscriptionInterval = sk.subscriptionInterval
AND sk.stillOffered
AND EXISTS (SELECT *
            FROM Holds h
            WHERE h.subscriberPhone = sp.subscriberPhone
            AND h.subscriptionStartDate = sp.subscriptionStartDate    
            );