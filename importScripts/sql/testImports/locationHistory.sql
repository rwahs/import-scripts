# find at least 2 representative values for each field
(SELECT LocationHistoryID FROM LocationHistoryExport WHERE LocationHistoryID IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE AuthorizedBy IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE Location IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE LocationDate IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE LocationStatus IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE PrimaryKey_Object_Table IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE o_Accession_Full_ID IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE o_ItemType IS NOT NULL LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE Room IS NOT NULL LIMIT 5)
UNION(SELECT GROUP_CONCAT(LocationHistoryID) FROM LocationHistoryExport GROUP BY PrimaryKey_Object_Table  HAVING count(LocationHistoryID)>1 LIMIT 5)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE ShelfDrawer IS NULL LIMIT 2)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE Shelf IS NULL LIMIT 2)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE Drawer IS NULL LIMIT 2)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE Box IS NULL LIMIT 2)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE lowestLocation IS NULL LIMIT 2)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE lowestLocationType IS NULL LIMIT 2)
UNION(SELECT LocationHistoryID FROM LocationHistoryExport WHERE o_ItemType = 'museumartefact' IS NULL LIMIT 2)
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
    Room,
    ShelfDrawer,
    Shelf,
    Drawer,
    Box,
    LibraryNo,
    OldLocation,
    lowestLocation,
    lowestLocationType
FROM
    LocationHistoryExport
WHERE
    LocationHistoryID IN(1,2,3,4,5,31759,3725,31758,24246,8845,8846,32962,21850,16162,8849,24493,8850,26937,3660,24198,15883,24936,21113,26026,3535,6998,170,1475,41,42,43,44,45,120,155,164,3633,3728,3737,3744,26548,26936,31761,31780)
;
