ALTER TABLE subscriptions
    ADD CONSTRAINT subscriber FOREIGN KEY(subscriberPhone)
    REFERENCES subscribers(subscriberPhone)
    ON DELETE RESTRICT
    ON UPDATE CASCADE;

ALTER TABLE subscriptions
    ADD CONSTRAINT Kind FOREIGN KEY(subscriptionMode, subscriptionInterval)
    REFERENCES SubscriptionKinds(subscriptionMode, subscriptionInterval)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE Holds
    ADD CONSTRAINT HoldInfo FOREIGN KEY(subscriberPhone, subscriptionStartDate)
    REFERENCES subscriptions(subscriberPhone, subscriptionStartDate)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT;