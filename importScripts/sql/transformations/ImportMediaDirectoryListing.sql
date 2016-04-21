DROP TABLE IF EXISTS MediaDirectoryListing;
CREATE TABLE MediaDirectoryListing(
FileName VARCHAR(255) NOT NULL PRIMARY KEY );

LOAD DATA LOCAL INFILE 'source/media-list.txt' INTO TABLE MediaDirectoryListing;

