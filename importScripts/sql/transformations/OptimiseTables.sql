ALTER TABLE Objects
ADD PRIMARY KEY (PrimaryKey_Object_Table),
ADD INDEX (Accession_Full_ID),
ADD INDEX (ItemType),
ADD INDEX (ItemName),
ADD INDEX (SourceName),
ADD INDEX (VisualCondition),
ADD INDEX (PhysicalCondition),
ADD INDEX (ConditionOnReceipt);

ALTER TABLE Sources
ADD PRIMARY KEY (SourceID),
ADD INDEX (SourceName);

ALTER TABLE LocationHistory
ADD PRIMARY KEY (LocationHistoryID),
ADD INDEX (PrimaryKey_Object_Table),
ADD INDEX (LocationStatus),
ADD INDEX (LocationDate);

ALTER TABLE ReceiptConditions
ADD PRIMARY KEY (SequenceOnForm),
ADD INDEX (`Condition`),
ADD INDEX (`ConditionDescription`);

ALTER TABLE Library
ADD PRIMARY KEY (PublicationID),
ADD INDEX (PublicationType),
ADD INDEX (HomeLocation);

ALTER TABLE ObjectsImages
MODIFY ImageFilePath VARCHAR(255),
ADD PRIMARY KEY (ObjectsImagesID),
ADD INDEX (Accession_Full_ID),
ADD INDEX (ImageFileName),
ADD INDEX (ImageFilePath);

