# find at least 2 representative values for each field
(SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE StoredLocation
       IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE
           BoxType IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE
           Copied = 1
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE
           Copied = 0
       LIMIT 2);
## now we've found the sample records use them as the source
SELECT
    Accession_Full_ID,
    ItemName,
    PrimaryKey_Object_Table,
    StoredLocation,
    BoxType,
    Copied
FROM
    ObjectsExport
WHERE
    PrimaryKey_Object_Table IN (404,675,750,679);
