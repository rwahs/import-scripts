CREATE OR REPLACE VIEW SourcesExport AS
    SELECT
        NULLIF(TRIM(REPLACE(s.SourceName, '<<N/A>>', 'N/A')), '') AS SourceName,
        NULLIF(TRIM(s.Address), '')                               AS Address,
        NULLIF(TRIM(s.Deceased), '')                              AS Deceased,
        NULLIF(TRIM(s.DonorNotes), '')                            AS DonorNotes,
        NULLIF(TRIM(s.EMail), '')                                 AS EMail,
        NULLIF(TRIM(s.Fax), '')                                   AS Fax,
        NULL                                                      AS DonorAgentName,
        NULL                                                      AS DonorAgentAddress,
        NULL                                                      AS DonorAgentPhone,
        NULLIF(TRIM(s.FirstNames), '')                            AS FirstNames,
        NULLIF(TRIM(s.Initials), '')                              AS Initials,
        NULLIF(TRIM(s.LastEditBy), '')                            AS SourceLastEditBy,
        NULLIF(TRIM(s.LastEditDate), '0000-00-00 00:00:00')       AS SourceLastEditDate,
        NULLIF(TRIM(REPLACE(s.LastName, '<<N/A>>', 'N/A')), '')   AS LastName,
        NULLIF(TRIM(s.Organisation), '')                          AS Organisation,
        NULLIF(TRIM(s.Phone), '')                                 AS Phone,
        NULLIF(TRIM(s.MobilePhone), '')                           AS MobilePhone,
        NULLIF(TRIM(s.PostCode), '')                              AS PostCode,
        NULLIF(TRIM(s.Salutation), '')                            AS Salutation,
        NULLIF(TRIM(s.SourceID), '')                              AS SourceID,
        NULLIF(TRIM(s.State), '')                                 AS State,
        NULLIF(TRIM(s.TownCity), '')                              AS TownCity,
        NULLIF(TRIM(s.XternalReference), '')                      AS XternalReference,
        NULLIF(TRIM(s.Xtra), '')                                  AS Xtra
    FROM
        Sources s
    ORDER BY
        s.SourceID;
