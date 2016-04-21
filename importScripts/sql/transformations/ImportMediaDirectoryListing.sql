DROP TABLE IF EXISTS MediaDirectoryListing;
CREATE TABLE MediaDirectoryListing(
FileName VARCHAR(255) NOT NULL PRIMARY KEY );

LOAD DATA LOCAL INFILE 'source/media-list.txt' INTO TABLE MediaDirectoryListing;
DELETE FROM MediaDirectoryListing WHERE FileName IS NULL OR FileName = '';
