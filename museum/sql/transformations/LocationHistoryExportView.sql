DROP TABLE IF EXISTS StandardisedLocations;
CREATE TABLE StandardisedLocations (
    id               INT AUTO_INCREMENT PRIMARY KEY,
    Alias            VARCHAR(255) NOT NULL,
    StandardisedName VARCHAR(255) NOT NULL
);
ALTER TABLE StandardisedLocations
ADD INDEX (Alias),
ADD INDEX (StandardisedName);

INSERT INTO StandardisedLocations (Alias, StandardisedName)
VALUES
    ('Artworks storeoom ,', 'Artworks room'),
    ('Artworks storeoom,', 'Artworks room'),
    ('Artworks storeoom', 'Artworks room'),
    ('Art Storeroom ,', 'Artworks room'),
    ('Art Storeroom,', 'Artworks room'),
    ('Art Storeroom', 'Artworks room'),
    ('Art Store ,', 'Artworks room'),
    ('Art Store,', 'Artworks room'),
    ('Art Store', 'Artworks room'),
    ('Artworks storeroom ,', 'Artworks room'),
    ('Artworks storeroom,', 'Artworks room'),
    ('Artworks storeroom', 'Artworks room'),
    ('Artworks Store room ,', 'Artworks room'),
    ('Artworks Store room,', 'Artworks room'),
    ('Artworks Store room', 'Artworks room'),
    ('Artworks room ,', 'Artworks room'),
    ('Artworks room,', 'Artworks room'),
    ('Artworks room', 'Artworks room'),
    ('Costume room ,', 'Costume room'),
    ('Costume room,', 'Costume room'),
    ('Costume room', 'Costume room'),
    ('Costume ,', 'Costume room'),
    ('Costume,', 'Costume room'),
    ('Costume', 'Costume room'),
    ('Exhibition room ,', 'Exhibition room'),
    ('Exhibition room,', 'Exhibition room'),
    ('Exhibition room', 'Exhibition room'),
    ('Museum Storeroom ,', 'Museum Store'),
    ('Museum Storeroom,', 'Museum Store'),
    ('Museum Storeroom', 'Museum Store'),
    ('Storeroom ,', 'Museum Store'),
    ('Storeroom,', 'Museum Store'),
    ('Storeroom', 'Museum Store'),
    ('Museum Room ,', 'Museum Store'),
    ('Museum Room,', 'Museum Store'),
    ('Museum Room', 'Museum Store'),
    ('Museum Store ,', 'Museum Store'),
    ('Museum Store,', 'Museum Store'),
    ('Museum Store', 'Museum Store'),
    ('Museum ,', 'Museum Store'),
    ('Museum,', 'Museum Store'),
    ('Museum', 'Museum Store'),
    ('Passage ,', 'Passage'),
    ('Passage ,', 'Passage'),
    ('Passage,', 'Passage'),
    ('Passage', 'Passage'),
    ('Foyer, ', 'Foyer'),
    ('Foyer', 'Foyer'),
    ('Meeting room ,', 'Meeting room'),
    ('Meeting room ,', 'Meeting room'),
    ('Meeting room,', 'Meeting room'),
    ('Meeting room', 'Meeting room'),
    ('Tranby room ,', 'Tranby room'),
    ('Tranby room,', 'Tranby room'),
    ('Museum Room (Tranby Room),', 'Tranby room'),
    ('Tranby room', 'Tranby room'),
    ('T.R.,', 'Tranby room'),
    ('T.R.', 'Tranby room'),
    ('Container ,', 'Container'),
    ('Container,', 'Container'),
    ('Container', 'Container'),
    ('Locked Storeroom ,', 'Locked Storeroom'),
    ('Locked Storeroom,', 'Locked Storeroom'),
    ('Locked Storeroom', 'Locked Storeroom'),
    ('Library ,', 'Library'),
    ('Library,', 'Library'),
    ('Library', 'Library');


CREATE OR REPLACE VIEW LocationHistoryExport AS
    SELECT
        NULLIF(lh.LocationHistoryID, '')                                  AS LocationHistoryID,
        NULLIF(lh.AuthorizedBy, '')                                       AS AuthorizedBy,
        NULLIF(lh.Location, '')                                           AS Location,
        NULLIF(lh.LocationDate, '')                                       AS LocationDate,
        NULLIF(lh.LocationStatus, '')                                     AS LocationStatus,
        NULLIF(lh.PrimaryKey_Object_Table, '')                            AS PrimaryKey_Object_Table,
        NULLIF(o.Accession_Full_ID, '')                                   AS o_Accession_Full_ID,
        NULLIF(o.ItemType, '')                                            AS o_ItemType,
        IFNULL(sl.StandardisedName, NULLIF(TRIM(lh.Location), ''))        AS topLevelLocation,
        NULLIF(TRIM(SUBSTR(TRIM(lh.Location), LENGTH(sl.Alias) + 1)), '') AS childStorageLocation,
        CASE
        WHEN ISNULL(NULLIF(TRIM(SUBSTR(TRIM(lh.Location), LENGTH(sl.Alias) + 1)), ''))
            THEN NULL
        WHEN TRIM(SUBSTR(TRIM(lh.Location), LENGTH(sl.Alias) + 1)) LIKE '%box%'
            THEN 'box'
        WHEN TRIM(SUBSTR(TRIM(lh.Location), LENGTH(sl.Alias) + 1)) LIKE '%draw%'
            THEN 'drawer'
        ELSE 'container'
        END                                                               AS childType
    FROM
        LocationHistory lh JOIN Objects o USING (PrimaryKey_Object_Table)
        LEFT JOIN StandardisedLocations sl
            ON LEFT(TRIM(lh.Location), LENGTH(sl.Alias)) = sl.Alias
    WHERE
        ItemType NOT IN ('Photograph', 'Memorials')
    GROUP BY lh.LocationHistoryID
    ORDER BY
        lh.LocationHistoryID, sl.id;
