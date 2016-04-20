CREATE OR REPLACE VIEW ObjectImagesExport AS
SELECT
    o.ItemType,
    i.Accession_Full_ID,
    CONCAT_WS('/', REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(ImageFilePath, '\\', '/'), 'Y:/', ''), 'Y:', ''),
                                           '//Foyer/c/Images Mosaic/', ''), '//Foyer/c/Images Mosaic/', ''),
                           '//SERVER1/Images Mosaic/', ''), ImageFileName) AS ImagePath,
    ImageDescription,
    DisplayImage,
    DefaultImageIndicator

FROM ObjectsImages i
    JOIN Objects o ON (i.Accession_Full_ID = o.Accession_Full_ID)
WHERE TRIM(ImageFileName) <> ''
ORDER BY ObjectsImagesID;
