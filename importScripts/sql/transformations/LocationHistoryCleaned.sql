DROP TABLE IF EXISTS LocationHistoryCleaned;
CREATE TABLE LocationHistoryCleaned(
    `LocationHistoryID` int(11) NOT NULL DEFAULT '0',
    `AuthorizedBy` varchar(100) DEFAULT NULL,
    `Location` varchar(200) DEFAULT NULL,
    `LocationDate` date DEFAULT NULL,
    `LocationStatus` varchar(40) DEFAULT NULL,
    `PrimaryKey_Object_Table` int(11) DEFAULT NULL,
    o_Accession_Full_ID VARCHAR(255),
    o_ItemType VARCHAR(255),
    topLevelLocation VARCHAR(255),
    childStorageLocation VARCHAR(255),
    childType VARCHAR(255),
    Location_refined VARCHAR(255),
    UniqueRooms VARCHAR(255),
    Room VARCHAR(255),
    ShelfDrawer VARCHAR(255),
    Box VARCHAR(255),
    LibraryNo VARCHAR(255),
    OldLocation BOOLEAN,
    PRIMARY KEY (`LocationHistoryID`),
    KEY (`PrimaryKey_Object_Table`),
    KEY (`LocationStatus`),
    KEY (`LocationDate`),
    KEY (o_Accession_Full_ID)
);
LOAD DATA LOCAL INFILE 'sql/transformations/LocationHistoryCleaned.tsv' INTO TABLE LocationHistoryCleaned
IGNORE 1 LINES;
