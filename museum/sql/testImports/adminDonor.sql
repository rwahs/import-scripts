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
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SourceID IS NOT NULL  AND SourceID <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ReceiptNum IS NOT NULL  AND ReceiptNum <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE MethodDescription IS NOT NULL  AND MethodDescription <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Method IS NOT NULL  AND Method <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DateReceived IS NOT NULL  AND DateReceived <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ConditionOnReceipt IS NOT NULL  AND ConditionOnReceipt <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ConditionOnReceiptCode IS NOT NULL AND ConditionOnReceiptCode <> '' LIMIT 2)
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
	SourceID,
	ReceiptNum,
	MethodDescription,
	Method,
	DateReceived,
	ConditionOnReceipt,
	ConditionOnReceiptCode,
	LegalTitleYesNo,
	TitleDetails,
	CopyrightYesNo,
	CopyrightDetails,
	Correspondence
FROM
	ObjectsExport
WHERE
	PrimaryKey_Object_Table IN(29076,29100,29,30,1621,1622,47,48,1537,1570,26530,28676,4462,7203,28008,4239,27545,16216,3677,14844,679,750,3672,3837,3,6,10,24,1723,1726,2823,2830,2,3,51,52,8,23,11956,11960,8373,19066,1624,1646,404)
;
