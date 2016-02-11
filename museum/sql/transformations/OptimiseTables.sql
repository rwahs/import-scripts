ALTER TABLE Objects
ADD PRIMARY KEY (PrimaryKey_Object_Table),
ADD INDEX (Accession_Full_ID),
ADD INDEX (ItemType),
ADD INDEX (ItemName),
ADD INDEX (SourceName);
ALTER TABLE Sources
ADD PRIMARY KEY (SourceID),
ADD INDEX (SourceName);
