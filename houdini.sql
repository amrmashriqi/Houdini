SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `activation_key` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Penguin ID',
  `ActivationKey` char(255) NOT NULL COMMENT 'Penguin activation key'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin activation keys';

CREATE TABLE `ban` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Banned penguin ID',
  `Issued` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Issue date',
  `Expires` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Expiry date',
  `ModeratorID` int(10) UNSIGNED DEFAULT NULL COMMENT 'Moderator penguin ID',
  `Reason` tinyint(3) UNSIGNED NOT NULL COMMENT 'Reason #',
  `Comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin ban records';

CREATE TABLE `buddy_list` (
  `PenguinID` int(10) UNSIGNED NOT NULL,
  `BuddyID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin buddy relationships';

CREATE TABLE `care_inventory` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Owner penguin ID',
  `ItemID` int(10) UNSIGNED NOT NULL COMMENT 'Care item ID',
  `Quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Quantity owned'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `cover_stamps` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Unique penguin ID',
  `Stamp` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Cover stamp or item ID',
  `X` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Cover X position',
  `Y` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Cover Y position',
  `Type` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Cover item type',
  `Rotation` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stamp cover rotation',
  `Depth` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stamp cover depth\n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stamps placed on book cover';

CREATE TABLE `deck` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Owner penguin ID',
  `CardID` smallint(5) UNSIGNED NOT NULL COMMENT 'Card type ID',
  `Quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Quantity owned'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin card jitsu decks';

CREATE TABLE `floor_inventory` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Owner penguin ID',
  `FloorID` int(10) UNSIGNED NOT NULL COMMENT 'Floor ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `furniture_inventory` (
  `PenguinID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Owner penguin ID',
  `FurnitureID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Furniture item ID',
  `Quantity` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Quantity owned'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin owned furniture';

CREATE TABLE `igloo` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Unique igloo ID',
  `PenguinID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Owner penguin ID',
  `Type` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Igloo type ID',
  `Floor` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Igloo flooring ID',
  `Music` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Igloo music ID',
  `Location` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Igloo location ID',
  `Locked` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is igloo locked?'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin igloo settings';

CREATE TABLE `igloo_furniture` (
  `IglooID` int(10) UNSIGNED NOT NULL COMMENT 'Furniture igloo ID',
  `FurnitureID` mediumint(8) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Furniture item ID',
  `X` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Igloo X position',
  `Y` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Igloo Y position',
  `Frame` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Furniture frame ID',
  `Rotation` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Furniture rotation ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Furniture placed inside igloos';

CREATE TABLE `igloo_inventory` (
  `PenguinID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Owner penguin ID',
  `IglooID` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Igloo ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin owned igloos';

CREATE TABLE `igloo_likes` (
  `IglooID` int(10) UNSIGNED NOT NULL COMMENT 'Igloo''s unique ID',
  `OwnerID` int(10) UNSIGNED NOT NULL COMMENT 'Owner''s player ID',
  `PlayerID` int(10) UNSIGNED NOT NULL COMMENT 'Liker''s playeer ID',
  `Count` int(11) NOT NULL COMMENT 'Amount of likes',
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of like'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `ignore_list` (
  `PenguinID` int(10) UNSIGNED NOT NULL,
  `IgnoreID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin ignore relationships';

CREATE TABLE `inventory` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Owner penguin ID',
  `ItemID` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Clothing item ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin owned clothing items';

CREATE TABLE `location_inventory` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Owner penguin ID',
  `LocationID` int(10) UNSIGNED NOT NULL COMMENT 'Location ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `login` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Unique login ID',
  `PenguinID` int(10) UNSIGNED NOT NULL,
  `Date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `IPAddress` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin login records';

CREATE TABLE `penguin` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Unique penguin ID',
  `Username` varchar(12) NOT NULL COMMENT 'Penguin login name',
  `Nickname` varchar(12) NOT NULL COMMENT 'Penguin display name',
  `Approval` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Username approval',
  `Password` char(255) NOT NULL COMMENT 'Password hash',
  `LoginKey` char(255) DEFAULT '',
  `ConfirmationHash` char(255) DEFAULT NULL,
  `Email` varchar(255) NOT NULL COMMENT 'User email address',
  `RegistrationDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Active` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Email activated',
  `Igloo` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Player''s active igloo',
  `LastPaycheck` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'EPF previous paycheck',
  `MinutesPlayed` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total minutes connected',
  `Moderator` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is user moderator?',
  `MascotStamp` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Mascot stamp ID',
  `Coins` mediumint(8) UNSIGNED NOT NULL DEFAULT '500' COMMENT 'Penguin coins',
  `Color` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Penguin color ID',
  `Head` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin head item ID',
  `Face` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin face item ID',
  `Neck` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin neck item ID',
  `Body` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin body item ID',
  `Hand` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin hand item ID',
  `Feet` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin feet item ID',
  `Photo` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin background ID',
  `Flag` smallint(5) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Penguin pin ID',
  `Permaban` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is penguin banned forever?',
  `BookModified` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is book cover modified?',
  `BookColor` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Stampbook cover color',
  `BookHighlight` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Stampbook cover color',
  `BookPattern` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Stampbook cover pattern',
  `BookIcon` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Stampbook cover icon',
  `AgentStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is penguin EPF agent?',
  `FieldOpStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is field op complete?',
  `CareerMedals` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Total career medals',
  `AgentMedals` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Current medals',
  `LastFieldOp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of last field op',
  `NinjaRank` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Ninja rank',
  `NinjaProgress` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Ninja progress',
  `FireNinjaRank` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Fire ninja rank',
  `FireNinjaProgress` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Fire ninja progress',
  `WaterNinjaRank` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Water ninja rank',
  `WaterNinjaProgress` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Water ninja progress',
  `NinjaMatchesWon` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'CardJitsu matches won',
  `FireMatchesWon` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'JitsuFire matches won',
  `WaterMatchesWon` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'JitsuWater matces won',
  `RainbowAdoptability` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Rainbow puffle adoptability status',
  `HasDug` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Puffle digging boolean',
  `Nuggets` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Golden puffle nuggets'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguins';

INSERT INTO `penguin` (`ID`, `Username`, `Nickname`, `Approval`, `Password`, `LoginKey`, `ConfirmationHash`, `Email`, `RegistrationDate`, `Active`, `Igloo`, `LastPaycheck`, `MinutesPlayed`, `Moderator`, `MascotStamp`, `Coins`, `Color`, `Head`, `Face`, `Neck`, `Body`, `Hand`, `Feet`, `Photo`, `Flag`, `Permaban`, `BookModified`, `BookColor`, `BookHighlight`, `BookPattern`, `BookIcon`, `AgentStatus`, `FieldOpStatus`, `CareerMedals`, `AgentMedals`, `LastFieldOp`, `NinjaRank`, `NinjaProgress`, `FireNinjaRank`, `FireNinjaProgress`, `WaterNinjaRank`, `WaterNinjaProgress`, `NinjaMatchesWon`, `FireMatchesWon`, `WaterMatchesWon`, `RainbowAdoptability`, `HasDug`, `Nuggets`) VALUES
(101, 'Houdini', 'Houdini', 1, '$2y$12$8lNgd8WTUCakhP10fq05XOcU5MGxukpca3P/dVBVq4wCpjrIBsL7i', '', '', 'houdini@solero.me', '2018-08-11 03:16:14', 1, 1, '2018-08-01 00:00:00', 166, 0, 0, 243373, 4, 498, 0, 0, 24073, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, '2018-08-11 03:16:14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0);

CREATE TABLE `penguin_redemption` (
  `PenguinID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique penguin ID',
  `CodeID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique code ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Redeemed codes';

CREATE TABLE `postcard` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Unique postcard ID',
  `SenderID` int(10) UNSIGNED DEFAULT NULL COMMENT 'Sender penguin ID',
  `RecipientID` int(10) UNSIGNED NOT NULL COMMENT 'Recipient penguin ID',
  `Type` smallint(5) UNSIGNED NOT NULL COMMENT 'Postcard type ID',
  `SendDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date sent',
  `Details` char(255) NOT NULL DEFAULT '',
  `HasRead` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is read?'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Sent postcards';

CREATE TABLE `puffle` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Unique puffle ID',
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Owner penguin ID',
  `Name` varchar(16) NOT NULL COMMENT 'Puffle name',
  `AdoptionDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Date of adoption',
  `Type` tinyint(3) UNSIGNED NOT NULL COMMENT 'Puffle type ID',
  `Subtype` smallint(5) UNSIGNED NOT NULL COMMENT 'Puffle subtype ID',
  `Food` tinyint(3) UNSIGNED NOT NULL DEFAULT '100' COMMENT 'Puffle food %',
  `Play` tinyint(3) UNSIGNED NOT NULL DEFAULT '100' COMMENT 'Puffle play %',
  `Rest` tinyint(3) UNSIGNED NOT NULL DEFAULT '100' COMMENT 'Puffle rest %',
  `Clean` tinyint(3) UNSIGNED NOT NULL DEFAULT '100' COMMENT 'Puffle clean %',
  `Walking` tinyint(4) DEFAULT '0',
  `Hat` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Puffle hat ID',
  `Backyard` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Determines the puffle''s location',
  `HasDug` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Digging status boolean'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Adopted puffles';

CREATE TABLE `puffle_quest` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Penguin ID',
  `TaskID` tinyint(4) UNSIGNED NOT NULL COMMENT 'Task ID',
  `Completed` datetime DEFAULT NULL COMMENT 'Time of completion',
  `ItemCollected` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Item collection status',
  `CoinsCollected` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Coins collection status'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `redemption_award` (
  `CodeID` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Unique code ID',
  `Award` smallint(5) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Award item ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Redemption code awards';

CREATE TABLE `redemption_code` (
  `ID` int(10) UNSIGNED NOT NULL COMMENT 'Unique code ID',
  `Code` varchar(16) NOT NULL DEFAULT '' COMMENT 'Remption code',
  `Type` enum('DS','BLANKET','CARD','GOLDEN','CAMPAIGN') NOT NULL DEFAULT 'BLANKET' COMMENT 'Code type',
  `Coins` mediumint(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Code coins amount',
  `Expires` datetime DEFAULT NULL COMMENT 'Expiry date'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Redemption codes';

CREATE TABLE `stamp` (
  `PenguinID` int(10) UNSIGNED NOT NULL COMMENT 'Stamp penguin ID',
  `Stamp` smallint(5) UNSIGNED NOT NULL COMMENT 'Stamp ID',
  `Recent` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Is recently earned?'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Penguin earned stamps';


ALTER TABLE `activation_key`
  ADD PRIMARY KEY (`PenguinID`,`ActivationKey`);

ALTER TABLE `ban`
  ADD PRIMARY KEY (`PenguinID`,`Issued`,`Expires`),
  ADD KEY `ModeratorID` (`ModeratorID`);

ALTER TABLE `buddy_list`
  ADD PRIMARY KEY (`PenguinID`,`BuddyID`),
  ADD KEY `BuddyID` (`BuddyID`);

ALTER TABLE `care_inventory`
  ADD PRIMARY KEY (`PenguinID`,`ItemID`);

ALTER TABLE `cover_stamps`
  ADD PRIMARY KEY (`PenguinID`,`Stamp`);

ALTER TABLE `deck`
  ADD PRIMARY KEY (`PenguinID`,`CardID`),
  ADD KEY `PenguinID` (`PenguinID`);

ALTER TABLE `floor_inventory`
  ADD PRIMARY KEY (`PenguinID`,`FloorID`);

ALTER TABLE `furniture_inventory`
  ADD PRIMARY KEY (`PenguinID`,`FurnitureID`);

ALTER TABLE `igloo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PenguinID` (`PenguinID`);

ALTER TABLE `igloo_furniture`
  ADD PRIMARY KEY (`IglooID`,`FurnitureID`,`X`,`Y`,`Frame`,`Rotation`),
  ADD KEY `igloo_furniture_ibfk_1` (`IglooID`);

ALTER TABLE `igloo_inventory`
  ADD PRIMARY KEY (`PenguinID`,`IglooID`);

ALTER TABLE `igloo_likes`
  ADD PRIMARY KEY (`IglooID`,`PlayerID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `PlayerID` (`PlayerID`);

ALTER TABLE `ignore_list`
  ADD PRIMARY KEY (`PenguinID`,`IgnoreID`),
  ADD KEY `IgnoreID` (`IgnoreID`);

ALTER TABLE `inventory`
  ADD PRIMARY KEY (`PenguinID`,`ItemID`);

ALTER TABLE `location_inventory`
  ADD PRIMARY KEY (`PenguinID`,`LocationID`);

ALTER TABLE `login`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PenguinID` (`PenguinID`);

ALTER TABLE `penguin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Username` (`Username`),
  ADD KEY `Email` (`Email`);

ALTER TABLE `penguin_redemption`
  ADD PRIMARY KEY (`PenguinID`,`CodeID`),
  ADD KEY `penguin_redemption_redemption_code_ID_fk` (`CodeID`);

ALTER TABLE `postcard`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SenderID` (`SenderID`),
  ADD KEY `RecipientID` (`RecipientID`);

ALTER TABLE `puffle`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PenguinID` (`PenguinID`);

ALTER TABLE `puffle_quest`
  ADD PRIMARY KEY (`PenguinID`,`TaskID`);

ALTER TABLE `redemption_award`
  ADD PRIMARY KEY (`CodeID`,`Award`);

ALTER TABLE `redemption_code`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `remption_code_ID_uindex` (`ID`);

ALTER TABLE `stamp`
  ADD PRIMARY KEY (`PenguinID`,`Stamp`);


ALTER TABLE `igloo`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique igloo ID';

ALTER TABLE `login`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique login ID';

ALTER TABLE `penguin`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique penguin ID', AUTO_INCREMENT=102;

ALTER TABLE `postcard`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique postcard ID';

ALTER TABLE `puffle`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique puffle ID';

ALTER TABLE `redemption_code`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Unique code ID';


ALTER TABLE `ban`
  ADD CONSTRAINT `ban_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ban_ibfk_2` FOREIGN KEY (`ModeratorID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `buddy_list`
  ADD CONSTRAINT `buddy_list_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buddy_list_ibfk_2` FOREIGN KEY (`BuddyID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `care_inventory`
  ADD CONSTRAINT `care_inventory_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `cover_stamps`
  ADD CONSTRAINT `cover_stamps_penguin_ID_fk` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `deck`
  ADD CONSTRAINT `deck_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `floor_inventory`
  ADD CONSTRAINT `floor_inventory_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `furniture_inventory`
  ADD CONSTRAINT `furniture_inventory_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `igloo`
  ADD CONSTRAINT `igloo_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `igloo_furniture`
  ADD CONSTRAINT `igloo_furniture_ibfk_1` FOREIGN KEY (`IglooID`) REFERENCES `igloo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `igloo_inventory`
  ADD CONSTRAINT `igloo_inventory_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `igloo_likes`
  ADD CONSTRAINT `igloo_likes_ibfk_1` FOREIGN KEY (`IglooID`) REFERENCES `igloo` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `igloo_likes_ibfk_2` FOREIGN KEY (`OwnerID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `igloo_likes_ibfk_3` FOREIGN KEY (`PlayerID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ignore_list`
  ADD CONSTRAINT `ignore_list_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ignore_list_ibfk_2` FOREIGN KEY (`IgnoreID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `location_inventory`
  ADD CONSTRAINT `location_inventory_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `penguin_redemption`
  ADD CONSTRAINT `penguin_redemption_penguin_ID_fk` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penguin_redemption_redemption_code_ID_fk` FOREIGN KEY (`CodeID`) REFERENCES `redemption_code` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `postcard`
  ADD CONSTRAINT `postcard_ibfk_1` FOREIGN KEY (`SenderID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `postcard_ibfk_2` FOREIGN KEY (`RecipientID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `puffle`
  ADD CONSTRAINT `puffle_ibfk_1` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `redemption_award`
  ADD CONSTRAINT `redemption_award_remption_code_ID_fk` FOREIGN KEY (`CodeID`) REFERENCES `redemption_code` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `stamp`
  ADD CONSTRAINT `stamp_penguin_ID_fk` FOREIGN KEY (`PenguinID`) REFERENCES `penguin` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
