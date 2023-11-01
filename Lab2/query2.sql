SELECT DISTINCT s.subscriberPhone, s.subscriberName
FROM Subscribers s
WHERE EXISTS (SELECT *
              FROM Subscriptions p
              WHERE p.subscriberPhone = s.subscriberPhone
              AND NOT p.paymentReceived
              AND EXISTS (SELECT *
                          FROM SubscriptionKinds k
                          WHERE p.subscriptionMode = k.subscriptionMode
                          AND p.subscriptionInterval = k.subscriptionInterval
                          AND k.rate > 137.25))
ORDER BY subscriberName, subscriberPhone DESC;