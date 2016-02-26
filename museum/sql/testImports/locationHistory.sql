# find at least 2 representative values for each field
(SELECT LocationHistoryID FROM LocationHistoryExport WHERE LocationHistoryID IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE AuthorizedBy IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE Location IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE LocationDate IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE LocationStatus IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE PrimaryKey_Object_Table IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE o_Accession_Full_ID IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE o_ItemType IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE topLevelLocation IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE childStorageLocation IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE childType IS NOT NULL LIMIT 5)

;
## now we've found the sample records use them as the source
SELECT
    LocationHistoryID,
    AuthorizedBy,
    Location,
    LocationDate,
    LocationStatus,
    PrimaryKey_Object_Table,
    o_Accession_Full_ID,
    o_ItemType,
    topLevelLocation,
    childStorageLocation,
    childType
FROM
    LocationHistoryExport
WHERE
    LocationHistoryID IN(1,2,3,4,5)
;
