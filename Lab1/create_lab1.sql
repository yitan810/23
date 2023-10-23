-- YINGYI TAN
-- CSE180 Lab1

-- Create Tables
CREATE TABLE SubscriptionKinds (
  subscriptionMode CHAR(1),
  subscriptionInterval INTERVAL,
  rate NUMERIC(6, 2),
  stillOffered BOOL,
  PRIMARY KEY (subscriptionMode, subscriptionInterval)
);

CREATE TABLE Editions (
  editionDate DATE,
  numArticles INT,
  numPages INT,
  PRIMARY KEY (editionDate)
);

CREATE TABLE Subscribers (
  subscriberPhone INT,
  subscriberName VARCHAR(30),
  subscriberAddress VARCHAR(60),
  PRIMARY KEY (subscriberPhone)
);

CREATE TABLE Subscriptions (
  subscriberPhone INT,
  subscriberStartDate DATE, 
  subscriptionMode CHAR(1),
  subscriptionInterval INTERVAL,
  paymentReceived BOOL,
  PRIMARY KEY (subscriberPhone, subscriberStartDate),
  FOREIGN KEY (subscriberPhone) REFERENCES Subscribers,
  FOREIGN KEY (subscriptionMode, subscriptionInterval) REFERENCES SubscriptionKinds(subscriptionMode, subscriptionInterval)
);

CREATE TABLE Holds (
  subscriberPhone INT,
  subscriberStartDate DATE,
  holdStartDate DATE,
  holdEndDate DATE,
  PRIMARY KEY (subscriberPhone, subscriberStartDate, holdStartDate),
  FOREIGN KEY (subscriberPhone, subscriberStartDate) REFERENCES Subscriptions(subscriberPhone, subscriberStartDate)
);

CREATE TABLE Articles (
  editionDate DATE,
  articleNum INT,
  articleAuthor VARCHAR(30),
  ArticlePage INT,
  PRIMARY KEY (editionDate, articleNum),
  FOREIGN KEY (editionDate) REFERENCES Editions(editionDate)
);

CREATE TABLE ReadArticles (
  subscriberPhone INT,
  editionDate DATE,
  articleNum INT,
  readInterval INTERVAL,
  PRIMARY KEY (subscriberPhone, editionDate, articleNum),
  FOREIGN KEY (subscriberPhone) REFERENCES Subscribers(subscriberPhone),
  FOREIGN KEY (editionDate, articleNum) REFERENCES Articles(editionDate, articleNum)
);