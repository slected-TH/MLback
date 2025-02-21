CREATE TABLE `users` (
  `userID` varchar(255) PRIMARY KEY,
  `userName` varchar(255),
  `userPhoneNo` integer,
  `userPasswordHash` varchar(255),
  `personalColor` varchar(255)
);

CREATE TABLE `usedItem` (
  `usedItemID` varchar(255) PRIMARY KEY,
  `sellerID` varchar(255),
  `title` varchar(255),
  `body` text COMMENT 'Content of the post',
  `price` integer,
  `image` longblob
);

CREATE TABLE `newClothes` (
  `ID` varchar(255) PRIMARY KEY,
  `brand` varchar(255),
  `itemName` varchar(255),
  `productLink` varchar(255),
  `imageFileName` varchar(255),
  `imageLinkBlob` varchar(255),
  `colorHex` varchar(7),
  `personalCol` varchar(255),
  `category` varchar(255)
);

CREATE TABLE `AIClassification` (
  `classificationID` integer PRIMARY KEY,
  `usedItemID` integer,
  `detectedCategory` varchar(255),
  `detectedColHex` varchar(7),
  `assignedPersonalCol` varchar(255)
);

CREATE TABLE `Favorites` (
  `favoriteID` varchar(255) PRIMARY KEY,
  `userID` varchar(255),
  `usedItemID` varchar(255)
);

CREATE TABLE `Transactions` (
  `transactionID` varchar(255) PRIMARY KEY,
  `buyerID` varchar(255),
  `usedItemID` varchar(255),
  `status` varchar(255),
  `createdAt` timestamp
);

CREATE TABLE `Messages` (
  `messageID` varchar(255) PRIMARY KEY,
  `senderID` varchar(255),
  `receiverID` varchar(255),
  `message` text,
  `messageTime` timestamp
);

ALTER TABLE `usedItem` ADD FOREIGN KEY (`sellerID`) REFERENCES `users` (`userID`);

ALTER TABLE `usedItem` ADD FOREIGN KEY (`usedItemID`) REFERENCES `AIClassification` (`usedItemID`);

ALTER TABLE `Favorites` ADD FOREIGN KEY (`userID`) REFERENCES `users` (`userID`);

ALTER TABLE `Favorites` ADD FOREIGN KEY (`usedItemID`) REFERENCES `usedItem` (`usedItemID`);

ALTER TABLE `Transactions` ADD FOREIGN KEY (`buyerID`) REFERENCES `users` (`userID`);

ALTER TABLE `usedItem` ADD FOREIGN KEY (`usedItemID`) REFERENCES `Transactions` (`usedItemID`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`senderID`) REFERENCES `users` (`userID`);

ALTER TABLE `Messages` ADD FOREIGN KEY (`receiverID`) REFERENCES `users` (`userID`);
