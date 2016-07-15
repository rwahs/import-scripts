CREATE OR REPLACE VIEW LocationHistoryExport AS
SELECT
    NULLIF(TRIM(lh.LocationHistoryID), '')       AS LocationHistoryID,
    NULLIF(TRIM(lh.AuthorizedBy), '')            AS AuthorizedBy,
    NULLIF(TRIM(lh.Location), '')                AS Location,
    NULLIF(TRIM(lh.LocationDate), '')            AS LocationDate,
    NULLIF(TRIM(lh.LocationStatus), '')          AS LocationStatus,
    NULLIF(TRIM(lh.PrimaryKey_Object_Table), '') AS PrimaryKey_Object_Table,
    NULLIF(TRIM(o.Accession_Full_ID), '')        AS o_Accession_Full_ID,
    NULLIF(
        LOWER(REPLACE(TRIM(o.ItemType), ' ', ''))
        , ''
    )                                            AS o_ItemType,
    NULLIF(TRIM(lhc.Room), '')                   AS Room,
    NULLIF(TRIM(lhc.ShelfDrawer), '')            AS ShelfDrawer,
    IF(
        lhc.ShelfDrawer NOT LIKE '%drawer%',
        NULLIF(TRIM(lhc.ShelfDrawer), ''),
        NULL
    )                                            AS Shelf,
    IF(
        lhc.ShelfDrawer LIKE '%drawer%',
        NULLIF(TRIM(lhc.ShelfDrawer), ''),
        NULL
    )                                            AS Drawer,
    NULLIF(TRIM(lhc.Box), '')                    AS Box,
    NULLIF(TRIM(lhc.LibraryNo), '')              AS LibraryNo,
    NULLIF(TRIM(lhc.OldLocation), '')            AS OldLocation,
    COALESCE(
        NULLIF(TRIM(lhc.Box), ''),
        NULLIF(TRIM(lhc.ShelfDrawer), ''),
        NULLIF(TRIM(lhc.Room), ''),
        NULLIF(TRIM(lh.Location), '')
    )                                            AS lowestLocation,
    CASE
    WHEN NULLIF(TRIM(lhc.Box), '') IS NOT NULL
        THEN 'box'
    WHEN NULLIF(TRIM(lhc.ShelfDrawer), '') IS NOT NULL AND lhc.ShelfDrawer like '%drawer%'
        THEN 'drawer'
    WHEN NULLIF(TRIM(lhc.ShelfDrawer), '') IS NOT NULL
        THEN 'shelf'
    WHEN NULLIF(TRIM(lhc.Room), '') IS NOT NULL
        THEN 'room'
    ELSE 'container'
    END                                          AS lowestLocationType

FROM
    LocationHistory lh
    JOIN Objects o USING (PrimaryKey_Object_Table)
    LEFT JOIN LocationHistoryCleaned lhc USING (LocationHistoryID)
WHERE
    ItemType NOT IN ('Photograph', 'Memorials') AND
    (lhc.OldLocation = FALSE OR lhc.OldLocation IS NULL)
GROUP BY lh.LocationHistoryID
ORDER BY
    lh.LocationHistoryID;
