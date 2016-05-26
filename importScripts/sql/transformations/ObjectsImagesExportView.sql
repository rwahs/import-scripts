CREATE OR REPLACE VIEW ObjectsImagesExport AS
SELECT
    NULLIF(TRIM(o.ItemType), '')                              AS ItemType,
    NULLIF(TRIM(i.Accession_Full_ID), '')                     AS Accession_Full_ID,
    NULLIF(TRIM(o.ItemName), '')                              AS ItemName,
    NULLIF(TRIM(ObjectsImagesID), '')                         AS ObjectsImagesID,
    NULLIF(TRIM(CONCAT_WS('/', REPLACE(
        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(ImageFilePath, '\\', '/'), 'Y:/', ''), 'Y:', ''),
                        '//Foyer/c/Images Mosaic/', ''), '//Foyer/c/Images Mosaic/', ''),
        '//SERVER1/Images Mosaic/', ''), ImageFileName)), '') AS ImagePath,
    IFNULL(NULLIF(TRIM(ImageDescription), ''), TRIM(o.ItemName))                        AS ImageDescription,
    NULLIF(TRIM(DisplayImage), '')                            AS DisplayImage,
    NULLIF(TRIM(DefaultImageIndicator), '')                   AS DefaultImageIndicator

FROM ObjectsImages i
    JOIN Objects o ON (i.Accession_Full_ID = o.Accession_Full_ID)
WHERE TRIM(ImageFileName) <> ''
ORDER BY ObjectsImagesID;
