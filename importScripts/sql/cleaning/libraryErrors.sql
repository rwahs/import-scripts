# Identify library records in source material that have errors
# 394 records
SELECT * FROM (
    SELECT
        LegacyID,
        Title
    FROM LibraryExport
    WHERE LENGTH(Collation) > 100
    UNION SELECT
              LegacyID,
              Title
          FROM LibraryExport
          WHERE length(CopyNo) > 5
    UNION SELECT
              LegacyID,
              Title
          FROM LibraryExport
          WHERE LENGTH(Review) > 255
    UNION SELECT
              LegacyID,
              Title
          FROM LibraryExport
          WHERE LENGTH(ISBN) > 13
    UNION SELECT
              LegacyID,
              Title
          FROM LibraryExport
          WHERE LENGTH(Size) > 20
    #     Error in DateOut field
    UNION SELECT
              LegacyID,
              Title
          FROM LibraryExport
          WHERE Notes LIKE '%2013/213%' OR
                Notes LIKE '%2013/214%' OR
                Notes LIKE '%2013/216%' OR
                Notes LIKE '%2013/210%' OR
                Notes LIKE '%2013/211%'
    UNION SELECT
              LegacyID,
              Title
          FROM LibraryExport
          WHERE Title LIKE '%William Dampier''s significance in Australia''s maritime discovery (in Early Days, Vol. 9, pt. 4, pp. 43 - 61)%'
          OR Title LIKE '%Wildflower Country%'
          OR Title LIKE '%Western Australia''s mining history; a bibliography%'
          OR Title LIKE '%31st Regiment. Receipt for allowances 1st April  to 30th June 1944 signed by N.H. Dunne, 3rd December 1844 (H/S Series HS/64)%'

) a ORDER BY Title
;
