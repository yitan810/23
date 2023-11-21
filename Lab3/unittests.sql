-- INSERT command that violates the foregin constraint 1
INSERT INTO subscriptions
    VALUES (8123456, '2023-01-01', 'D', '1 years', FALSE);

-- INSERT command that violates the foregin constraint 2
INSERT INTO Subscriptions( subscriberPhone, subscriptionStartDate, subscriptionMode, subscriptionInterval, paymentReceived )
    VALUES (8315512, '2018-01-01', 'D', '10 years', FALSE );

-- INSERT command that violates the foregin constraint 3
INSERT INTO Holds
    VALUES (6123456, '2022-12-06', '2023-01-01', '2023-11-01');

-- UPDATE command that meets the general constraint 1
UPDATE SubscriptionKinds
SET rate = 20
    WHERE subscriptionMode = 'D'
    AND subscriptionInterval = '1 years'
    AND stillOffered = TRUE;

-- UPDATE command that violates the general constraint 1
UPDATE SubscriptionKinds
SET rate = -20
    WHERE subscriptionMode = 'D'
    AND subscriptionInterval = '1 years'
    AND stillOffered = TRUE;

-- UPDATE command that meets the general constraint 2
UPDATE Holds
SET holdEndDate =  '2023-03-01'
    WHERE subscriptionStartDate =  '2022-12-06'
    AND holdStartDate =  '2023-01-01'
    AND subscriberPhone = 6502123;

-- UPDATE command that violates the general constraint 2
UPDATE Holds
SET holdEndDate =  '2021-03-01'
    WHERE subscriptionStartDate =  '2022-12-06'
    AND holdStartDate =  '2023-01-01'
    AND subscriberPhone = 6502123;

-- UPDATE command that meets the general constraint 3
UPDATE Subscribers
SET subscriberName = 'First Last'
    WHERE subscriberPhone = 8315512;

-- UPDATE command that violates the general constraint 3
UPDATE Subscribers
SET subscriberName = NULL
    WHERE subscriberPhone = 8315512;