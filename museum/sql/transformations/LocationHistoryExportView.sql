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
    ('Museum Room (Tranby Room),', 'Tranby room'),
    ('Museum Room (Tranby Room)', 'Tranby room'),
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
    NULLIF(lh.LocationHistoryID, '')       AS LocationHistoryID,
    NULLIF(lh.AuthorizedBy, '')            AS AuthorizedBy,
    NULLIF(lh.Location, '')                AS Location,
    NULLIF(lh.LocationDate, '')            AS LocationDate,
    NULLIF(lh.LocationStatus, '')          AS LocationStatus,
    NULLIF(lh.PrimaryKey_Object_Table, '') AS PrimaryKey_Object_Table,
    NULLIF(o.Accession_Full_ID, '')        AS o_Accession_Full_ID,
    NULLIF(o.ItemType, '')                 AS o_ItemType,
    CASE
    WHEN
        # The location has no parent, and will appear in `childStorageLocation` below
        TRIM(lh.Location) = sl.Alias
        THEN NULL
    ELSE
        # Otherwise we fill in from the standardised name
        sl.StandardisedName
    END                                    AS topLevelLocation,
    CASE
    WHEN
        # Fill in the standardised name for an item which only has a single level
        TRIM(lh.Location) = sl.Alias
        THEN sl.StandardisedName
    WHEN
        ISNULL(sl.StandardisedName)
        THEN TRIM(lh.Location)
    ELSE
        TRIM(SUBSTR(lh.Location, POSITION(sl.Alias IN lh.Location) + length(sl.Alias)))
    END                                    AS childStorageLocation,
    CASE
    WHEN
        ISNULL(sl.StandardisedName)
        THEN 'container'
    WHEN TRIM(lh.Location) = sl.Alias
        THEN 'room'
    WHEN lh.Location LIKE '%box%'
        THEN 'box'
    WHEN lh.Location LIKE '%draw%'
        THEN 'drawer'
    ELSE 'container'
    END                                    AS childType
FROM
    LocationHistory lh JOIN Objects o USING (PrimaryKey_Object_Table)
    LEFT JOIN StandardisedLocations sl
        ON LEFT(TRIM(lh.Location), LENGTH(sl.Alias)) = sl.Alias
WHERE
    ItemType NOT IN ('Photograph', 'Memorials')
GROUP BY lh.LocationHistoryID
ORDER BY
    lh.LocationHistoryID, sl.id;
