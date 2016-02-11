# find at least 2 representative values for each field
(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Accession_Full_ID IS NOT NULL  AND Accession_Full_ID <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Description IS NOT NULL  AND Description <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE MakersMarks IS NOT NULL  AND MakersMarks <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ItemDates IS NOT NULL  AND ItemDates <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE EarliestYear IS NOT NULL  AND EarliestYear <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE LatestYear IS NOT NULL  AND LatestYear <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE HistoricalDetails IS NOT NULL  AND HistoricalDetails <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ResearchBy IS NOT NULL  AND ResearchBy <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE BibliographReferences IS NOT NULL  AND BibliographReferences <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Importance IS NOT NULL  AND Importance <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Aesthetic IS NOT NULL  AND Significance_Aesthetic <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Historic IS NOT NULL  AND Significance_Historic <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Scientific IS NOT NULL  AND Significance_Scientific <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Social IS NOT NULL  AND Significance_Social <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Interpretive IS NOT NULL  AND Significance_Interpretive <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Provenance IS NOT NULL  AND Significance_Provenance <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Rarity IS NOT NULL  AND Significance_Rarity <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Condition IS NOT NULL  AND Significance_Condition <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE PhysicalCondition IS NOT NULL  AND PhysicalCondition <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Representativeness IS NOT NULL  AND Significance_Representativeness <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE StatementOfSignificance IS NOT NULL  AND StatementOfSignificance <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Materials IS NOT NULL  AND Materials <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Dimensions IS NOT NULL  AND Dimensions <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE PrimaryClass IS NOT NULL  AND PrimaryClass <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SecondaryClass IS NOT NULL  AND SecondaryClass <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE TertiaryClass IS NOT NULL  AND TertiaryClass <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ResearchYesNo IS NOT NULL  AND ResearchYesNo <> '' LIMIT 2)

;
## now we've found the sample records use them as the source
SELECT
    Accession_Full_ID,
    ItemName,
    Description,
    MakersMarks,
    ItemDates,
    EarliestYear,
    LatestYear,
    HistoricalDetails,
    ResearchBy,
    BibliographReferences,
    Importance,
    Significance_Aesthetic,
    Significance_Historic,
    Significance_Scientific,
    Significance_Social,
    Significance_Interpretive,
    Significance_Provenance,
    Significance_Rarity,
    Significance_Condition,
    PhysicalCondition,
    Significance_Representativeness,
    StatementOfSignificance,
    Materials,
    Dimensions,
    PrimaryClass,
    SecondaryClass,
    TertiaryClass,
    ResearchYesNo
FROM
    ObjectsExport
WHERE
    PrimaryKey_Object_Table IN(29076,29100,29,30,47,48,4138,1584,1621,1622,755,1841,679,750)
;
