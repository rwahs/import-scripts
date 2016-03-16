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
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE topLevelLocation IS NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE childStorageLocation IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE childType IS NOT NULL LIMIT 5)
UNION(SELECT GROUP_CONCAT(LocationHistoryID) FROM LocationHistoryExport GROUP BY PrimaryKey_Object_Table  HAVING count(LocationHistoryID)>1 LIMIT 5)

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
    LocationHistoryID IN(1,2,3,4,5,41,42,43,44,45,120,121,3720,26548,164,31780,155,156,3728,31761,221,3633,108,109,3737,3744,26936)
;
