# find at least 5 representative values for each field
(SELECT SourceID FROM SourcesExport WHERE SourceName IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Address IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Deceased IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE DonorNotes IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE EMail IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Fax IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE DonorAgentName IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE DonorAgentAddress IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE DonorAgentPhone IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE FirstNames IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Initials IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE SourceLastEditBy IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE SourceLastEditDate IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE LastName IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Organisation IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Phone IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE MobilePhone IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE PostCode IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Salutation IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE SourceID IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE State IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE TownCity IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE XternalReference IS NOT NULL LIMIT 5)
 UNION(SELECT SourceID FROM SourcesExport WHERE Xtra IS NOT NULL LIMIT 5)
;
## now we've found the sample records use them as the source
SELECT
    SourceID,
    SourceName,
    Salutation,
    FirstNames,
    Initials,
    LastName,
    Address,
    TownCity,
    State,
    PostCode,
    Phone,
    MobilePhone,
    Fax,
    EMail,
    DonorNotes,
    Deceased,
    DonorAgentName,
    DonorAgentAddress,
    DonorAgentPhone,
    SourceLastEditBy,
    SourceLastEditDate,
    Organisation,
    XternalReference,
    Xtra
FROM
    SourcesExport
WHERE
    SourceID IN(1,1880,1740,1293,1601,4,5,8,9,10,489,511,550,565,578,6,13,494,1223,1310,1333,1686,2,7,12,29,123,141,151,1395,1649,1650,1662,11)
;
