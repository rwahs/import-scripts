CREATE OR REPLACE VIEW LibraryExport AS
    SELECT
        NULLIF(TRIM(l.PublicationID), '')                               AS PublicationID,
        NULLIF(TRIM(l.Title), '')                                       AS Title,
        NULLIF(TRIM(l.CopyNo), '')                                      AS CopyNo,
        NULLIF(TRIM(l.Series), '')                                      AS Series,
        NULLIF(TRIM(l.Size), '')                                        AS Size,
        NULLIF(TRIM(l.Edition), '')                                     AS Edition,
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
                                            REPLACE(REPLACE(REPLACE(l.OtherAuthors, ' and ', '; '), '&', '; '), '+',
                                                    '; ')
                                        ), ''), ';')
                )), '')                                                 AS Authors,
        NULLIF(TRIM(l.LastName), '')                                    AS LastName,
        NULLIF(TRIM(l.FirstNames), '')                                  AS FirstNames,
        NULLIF(TRIM(l.OtherAuthors), '')                                AS OtherAuthors,
        NULLIF(TRIM(l.HomeLocation), '')                                AS HomeLocation,
        NULLIF(TRIM(l.ISBN), '')                                        AS ISBN,
        NULLIF(TRIM(l.LastEditBy), '')                                  AS LastEditBy,
        NULLIF(TRIM(l.LastEditDate), '0000-00-00 00:00:00')             AS LastEditDate,
        NULLIF(TRIM(l.LibraryNo), '')                                   AS LibraryNo,
        NULLIF(TRIM(IF(l.Notes LIKE '%Review%',
                       LEFT(l.Notes, POSITION('Review' IN Notes) - 1),
                       l.Notes))
        , '')                                                           AS Notes,
        NULLIF(TRIM(l.PublicationType), '')                             AS PublicationType,
        NULLIF(TRIM(l.PublicationYear), 0)                              AS PublicationYear,
        NULLIF(TRIM(l.Publisher), '')                                   AS Publisher,
        NULLIF(TRIM(l.WherePublished), '')                              AS WherePublished,
        NULLIF(TRIM(l.Subject), '')                                     AS Subject,
        NULLIF(TRIM(l.XternalReference), '')                            AS XternalReference,
        NULLIF(TRIM(l.Xtra), '')                                        AS Xtra,
        NULLIF(TRIM(l.CopyrightNotes), '')                              AS CopyrightNotes,
        NULLIF(TRIM(l.CurrentLocation), '')                             AS CurrentLocation,
        NULLIF(TRIM(l.Illustrations), '')                               AS Illustrations,
        NULLIF(TRIM(l.Maps), '')                                        AS Maps,
        NULLIF(TRIM(l.Marks), '')                                       AS Marks,
        NULLIF(TRIM(l.Pages), '')                                       AS Pages,
        NULLIF(TRIM(l.Rare), '')                                        AS Rare,
        NULLIF(TRIM(l.Restrictions), '')                                AS Restrictions,
        NULLIF(TRIM(l.DateOut), '0000-00-00')                           AS DateOut,
        NULLIF(TRIM(l.DateDue), '0000-00-00')                           AS DateDue,
        NULLIF(TRIM(l.DateReturned), '0000-00-00')                      AS DateReturned,
        NULLIF(TRIM(l.VolumeNum), '')                                   AS VolumeNum,
        NULLIF(TRIM(l.MyText), '')                                      AS MyText,
        NULLIF(TRIM(l.DeweyNumber), '')                                 AS DeweyNumber,
        NULLIF(TRIM(l.Value), '')                                       AS `Value`,
        NULLIF(TRIM(l.Borrower), '')                                    AS Borrower,
        NULLIF(TRIM(CONCAT_WS(
                        ', ',
                        IF(l.Pages > 0 AND l.Marks NOT LIKE CONCAT('%', l.Pages, 'p.%'), CONCAT(l.Pages, 'p.'), NULL),
                        NULLIF(TRIM(l.Marks), ''),
                        IF(l.Maps = 1 AND l.Marks NOT LIKE '%map%', 'maps', NULL)
                    )), '')                                             AS `Collation`,
        IF(Notes LIKE '%donor%' OR Notes LIKE '%donated%', 'yes', 'no') AS Donated,
        IF(
            Notes LIKE '%purchased%' AND Notes NOT LIKE '%not purchased%',
            'yes',
            'no'
        )                                                               AS Purchased,
        IF(Notes LIKE '%Review%',
           NULLIF(TRIM(MID(REPLACE(REPLACE(Notes, 'Review:', 'Review'), 'Review :', 'Review'),
                           POSITION('Review' IN Notes) + 7)
                  ), ''), NULL)                                         AS Review


    FROM Library l

    ORDER BY PublicationID;
