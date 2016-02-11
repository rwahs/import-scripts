# find at least 2 representative values for each field
(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Accession_Full_ID IS NOT NULL  AND Accession_Full_ID <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ItemName IS NOT NULL  AND ItemName <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionPrefix IS NOT NULL  AND AccessionPrefix <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionYear IS NOT NULL  AND AccessionYear <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionNumber IS NOT NULL  AND AccessionNumber <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionSeries IS NOT NULL  AND AccessionSeries <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionParts IS NOT NULL  AND AccessionParts <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionBy IS NOT NULL  AND AccessionBy <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE AccessionDate IS NOT NULL  AND AccessionDate <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SourceName IS NOT NULL  AND SourceName <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Salutation IS NOT NULL  AND Salutation <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE FirstNames IS NOT NULL  AND FirstNames <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Initials IS NOT NULL  AND Initials <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE LastName IS NOT NULL  AND LastName <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Address IS NOT NULL  AND Address <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE TownCity IS NOT NULL  AND TownCity <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE State IS NOT NULL  AND State <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE PostCode IS NOT NULL  AND PostCode <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Phone IS NOT NULL  AND Phone <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE MobilePhone IS NOT NULL  AND MobilePhone <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Fax IS NOT NULL  AND Fax <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE EMail IS NOT NULL  AND EMail <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DonorNotes IS NOT NULL  AND DonorNotes <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Deceased IS NOT NULL  AND Deceased <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DonorAgentName IS NOT NULL  AND DonorAgentName <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DonorAgentAddress IS NOT NULL  AND DonorAgentAddress <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DonorAgentPhone IS NOT NULL  AND DonorAgentPhone <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SourceLastEditBy IS NOT NULL  AND SourceLastEditBy <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SourceLastEditDate IS NOT NULL  AND SourceLastEditDate <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SourceID IS NOT NULL  AND SourceID <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ReceiptNum IS NOT NULL  AND ReceiptNum <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE MethodDescription IS NOT NULL  AND MethodDescription <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Method IS NOT NULL  AND Method <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DateReceived IS NOT NULL  AND DateReceived <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ConditionOnReceipt IS NOT NULL  AND ConditionOnReceipt <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE LegalTitleYesNo IS NOT NULL  AND LegalTitleYesNo <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE TitleDetails IS NOT NULL  AND TitleDetails <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE CopyrightYesNo IS NOT NULL  AND CopyrightYesNo <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE CopyrightDetails IS NOT NULL  AND CopyrightDetails <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Correspondence IS NOT NULL  AND Correspondence <> '' LIMIT 2)
;
## now we've found the sample records use them as the source
SELECT
	Accession_Full_ID,
	ItemName,
	AccessionPrefix,
	AccessionYear,
	AccessionNumber,
	AccessionSeries,
	AccessionParts,
	AccessionBy,
	AccessionDate,
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
	SourceID,
	ReceiptNum,
	MethodDescription,
	Method,
	DateReceived,
	ConditionOnReceipt,
	LegalTitleYesNo,
	TitleDetails,
	CopyrightYesNo,
	CopyrightDetails,
	Correspondence
FROM
	ObjectsExport
WHERE
	PrimaryKey_Object_Table IN(29076,29100,29,30,1621,1622,47,48,1537,1570,26530,28676,4462,7203,28008,4239,27545,16216,3677,14844,679,750,3672,3837,2823,2830,2,3,51,52,11956,11960,8373,19066,1624,1646)
;
