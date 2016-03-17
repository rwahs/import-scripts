CREATE OR REPLACE VIEW LibraryExport AS
    SELECT
        NULLIF(TRIM(l.PublicationID), '')                   AS PublicationID,
        NULLIF(TRIM(l.Title), '')                           AS Title,
        NULLIF(TRIM(l.CopyNo), '')                          AS CopyNo,
        NULLIF(TRIM(l.Series), '')                          AS Series,
        NULLIF(TRIM(l.Size), '')                            AS Size,
        NULLIF(TRIM(l.Edition), '')                         AS Edition,
        NULLIF(
            TRIM(
                CONCAT_WS('; ',
                          # Format First author as Lastname, FirstNames
                          NULLIF(NULLIF(TRIM(REPLACE(REPLACE(REPLACE(
                                                     CONCAT_WS(
                                                         ', ',
                                                         NULLIF(TRIM(l.LastName), ''),
                                                         NULLIF(TRIM(l.FirstNames), '')
                                                     ), ' and ', '; '), '&', '; '), '+', '; '))
                          , ''), ';'),
                          # And then add other authors, replacing delimiters with a standard delimiter
                          NULLIF(NULLIF(TRIM(
                                     REPLACE(REPLACE(REPLACE(l.OtherAuthors, ' and ', '; '), '&', '; '), '+', '; ')
                                 ), ''), ';')
                )), '')                                     AS Authors,
        NULLIF(TRIM(l.LastName), '')                        AS LastName,
        NULLIF(TRIM(l.FirstNames), '')                      AS FirstNames,
        NULLIF(TRIM(l.OtherAuthors), '')                    AS OtherAuthors,
        NULLIF(TRIM(l.HomeLocation), '')                    AS HomeLocation,
        NULLIF(TRIM(l.ISBN), '')                            AS ISBN,
        NULLIF(TRIM(l.LastEditBy), '')                      AS LastEditBy,
        NULLIF(TRIM(l.LastEditDate), '0000-00-00 00:00:00') AS LastEditDate,
        NULLIF(TRIM(l.LibraryNo), '')                       AS LibraryNo,
        NULLIF(TRIM(l.Notes), '')                           AS Notes,
        NULLIF(TRIM(l.PublicationType), '')                 AS PublicationType,
        NULLIF(TRIM(l.PublicationYear), 0)                 AS PublicationYear,
        NULLIF(TRIM(l.Publisher), '')                       AS Publisher,
        NULLIF(TRIM(l.WherePublished), '')                  AS WherePublished,
        NULLIF(TRIM(l.Subject), '')                         AS Subject,
        NULLIF(TRIM(l.XternalReference), '')                AS XternalReference,
        NULLIF(TRIM(l.Xtra), '')                            AS Xtra,
        NULLIF(TRIM(l.CopyrightNotes), '')                  AS CopyrightNotes,
        NULLIF(TRIM(l.CurrentLocation), '')                 AS CurrentLocation,
        NULLIF(TRIM(l.Illustrations), '')                   AS Illustrations,
        NULLIF(TRIM(l.Maps), '')                            AS Maps,
        NULLIF(TRIM(l.Marks), '')                           AS Marks,
        NULLIF(TRIM(l.Pages), '')                           AS Pages,
        NULLIF(TRIM(l.Rare), '')                            AS Rare,
        NULLIF(TRIM(l.Restrictions), '')                    AS Restrictions,
        NULLIF(TRIM(l.DateOut), '0000-00-00')               AS DateOut,
        NULLIF(TRIM(l.DateDue), '0000-00-00')               AS DateDue,
        NULLIF(TRIM(l.DateReturned), '0000-00-00')          AS DateReturned,
        NULLIF(TRIM(l.VolumeNum), '')                       AS VolumeNum,
        NULLIF(TRIM(l.MyText), '')                          AS MyText,
        NULLIF(TRIM(l.DeweyNumber), '')                     AS DeweyNumber,
        NULLIF(TRIM(l.Value), '')                           AS `Value`,
        NULLIF(TRIM(l.Borrower), '')                        AS Borrower

    FROM Library l

    ORDER BY PublicationID;

SELECT *
FROM LibraryExport;

SELECT DISTINCT Authors
FROM LibraryExport;

SELECT
    Authors,
    count(*) AS numRecords
FROM LibraryExport
    WHERE Authors IS NOT NULL
GROUP BY Authors  ORDER BY Authors;
SELECT
    PublicationType,
    count(*) AS numRecords
FROM LibraryExport
GROUP BY PublicationType;
SELECT
    CurrentLocation,
    count(*) AS numRecords
FROM LibraryExport
GROUP BY CurrentLocation;
SELECT
    `Subject`,
    count(*) AS numRecords
FROM LibraryExport
GROUP BY `Subject`;
SELECT
    Series,
    count(*) AS numRecords
FROM LibraryExport
GROUP BY Series;
SELECT
    Restrictions,
    count(*) AS numRecords
FROM LibraryExport
GROUP BY Restrictions;
SELECT DISTINCT ISBN FROM LibraryExport;
SELECT PublicationID,Notes from LibraryExport WHERE Notes LIKE '%Accession%';
