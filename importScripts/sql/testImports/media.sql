# find at least 2 representative values for each field

(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE ItemType IS NOT NULL  LIMIT 2)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE Accession_Full_ID IS NOT NULL  LIMIT 2)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE ItemName IS NOT NULL  LIMIT 2)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE ObjectsImagesID IS NOT NULL  LIMIT 2)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE ImagePath IS NOT NULL  LIMIT 2)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE ImageDescription IS NOT NULL  LIMIT 2)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE DisplayImage = 0  LIMIT 5)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE DisplayImage = 1  LIMIT 5)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE DefaultImageIndicator = 0 LIMIT 5)
UNION(SELECT ObjectsImagesID FROM ObjectsImagesExport WHERE DefaultImageIndicator = 1 LIMIT 5)

;
## now we've found the sample records use them as the source
SELECT
    ObjectsImagesID,
    ImageDescription,
    ItemType,
    Accession_Full_ID,
    ItemName,
    ImagePath,
    DisplayImage,
    DefaultImageIndicator
FROM
    ObjectsImagesExport
WHERE
    ObjectsImagesID IN (32,33,34,9814,10010,10388,14336,18991,35,36,37,43,47,51,38)
;
