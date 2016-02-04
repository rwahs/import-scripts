# find at least 2 representative values for each field
(SELECT PrimaryKey_Object_Table FROM Objects WHERE ItemType IS NOT NULL LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM Objects WHERE Accession_Full_ID IS NOT NULL LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM Objects WHERE ItemName IS NOT NULL LIMIT 2)
;
## now we've found the sample records use them as the source
SELECT
		Accession_Full_ID,
		ItemName,
		ItemType,
		PrimaryKey_Object_Table
FROM
	Objects
WHERE
	PrimaryKey_Object_Table IN(25580,25579)
;
