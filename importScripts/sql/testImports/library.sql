# find at least 5 representative values for each field
(SELECT PublicationID FROM LibraryExport WHERE PublicationID IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Notes LIKE 'Accession%' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Title IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE CopyNo IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Series IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Size IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Edition IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Authors IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE FirstNames IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE LastName IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE OtherAuthors IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE HomeLocation IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE ISBN IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE LastEditBy IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE LastEditDate IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE LibraryNo IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Notes IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE PublicationType IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE PublicationYear IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Publisher IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE WherePublished IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Subject IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Subject LIKE('%;%') LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Subject LIKE('%-%') LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE CopyrightNotes IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE CurrentLocation IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Illustrations IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Maps IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Marks IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Pages IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Rare IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Restrictions IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE DateDue IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE DateOut IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE DateReturned IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE VolumeNum IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE DeweyNumber IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Borrower IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE `Value` IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE MyText IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE XternalReference IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Xtra IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE `Collation` IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Maps = 1 AND Marks NOT LIKE '%map%' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Maps = 1 AND Marks LIKE '%map%' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Maps = 0 AND Marks NOT LIKE '%map%' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Maps = 0 AND Pages < 1 AND Marks IS NOT NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Maps = 0 AND Pages < 1 AND Marks IS NULL LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Pages > 0 AND Marks LIKE CONCAT('%', Pages, 'p.%') LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Pages > 0 AND Marks NOT LIKE CONCAT('%', Pages, 'p.%') LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Purchased = 'yes' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Purchased <> 'yes' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Donated = 'yes' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Donated <> 'yes' LIMIT 2)
UNION(SELECT PublicationID FROM LibraryExport WHERE Review IS NOT NULL LIMIT 2)
;



## now we've found the sample records use them as the source
SELECT
    PublicationID,
    Title,
    PublicationID AS LegacyID,
    CopyNo,
    Series,
    Size,
    Edition,
    Authors,
    LastName,
    FirstNames,
    OtherAuthors,
    HomeLocation,
    ISBN,
    LastEditBy,
    LastEditDate,
    LibraryNo,
    Notes,
    PublicationType,
    PublicationYear,
    Publisher,
    WherePublished,
    Subject,
    CopyrightNotes,
    CurrentLocation,
    Illustrations,
    Maps,
    Marks,
    Pages,
    `Collation`,
    Rare,
    Restrictions,
    DateDue,
    DateOut,
    DateReturned,
    VolumeNum,
    DeweyNumber,
    Borrower,
    `Value`,
    MyText,
    XternalReference,
    Xtra,
    Purchased,
    Donated,
    Review
FROM
    LibraryExport
WHERE
    PublicationID IN(13738,218,541,673,3,4,33,9,17,32,139,19,6000,7992,844,1133,5,1239,10,74,555,14118,14119,88,120,12566,393,472,15,24,101,100,68,2847,7186,38,49)
;
