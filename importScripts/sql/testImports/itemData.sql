# find at least 2 representative values for each field
(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Accession_Full_ID IS NOT NULL AND Accession_Full_ID <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Description IS NOT NULL AND Description <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE MakersMarks IS NOT NULL AND MakersMarks <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ItemDates IS NOT NULL AND ItemDates <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE EarliestYear IS NOT NULL AND EarliestYear <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE LatestYear IS NOT NULL AND LatestYear <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE HistoricalDetails IS NOT NULL AND HistoricalDetails <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ResearchBy IS NOT NULL AND ResearchBy <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE BibliographReferences IS NOT NULL AND BibliographReferences <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Importance IS NOT NULL AND Importance <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Aesthetic IS NOT NULL AND Significance_Aesthetic = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Historic IS NOT NULL AND Significance_Historic = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Scientific IS NOT NULL AND Significance_Scientific = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Social IS NOT NULL AND Significance_Social = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Interpretive IS NOT NULL AND Significance_Interpretive = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Provenance IS NOT NULL AND Significance_Provenance = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Rarity IS NOT NULL AND Significance_Rarity = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Condition IS NOT NULL AND Significance_Condition = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE PhysicalCondition IS NOT NULL AND PhysicalCondition <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Significance_Representativeness IS NOT NULL AND Significance_Representativeness = 1 LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE StatementOfSignificance IS NOT NULL AND StatementOfSignificance <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Materials IS NOT NULL AND Materials <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Dimensions IS NOT NULL AND Dimensions <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE PrimaryClass IS NOT NULL AND PrimaryClass <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SecondaryClass IS NOT NULL AND SecondaryClass <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE TertiaryClass IS NOT NULL AND TertiaryClass <> '' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE SignificanceCriteria LIKE '%;%' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE ComparativeCriteria LIKE '%;%' LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE Classification IS NOT NULL LIMIT 2)
UNION(SELECT PrimaryKey_Object_Table FROM ObjectsExport WHERE DefaultCurrentLocation IS NOT NULL LIMIT 2)

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
    SignificanceCriteria,
    Significance_Aesthetic,
    Significance_Historic,
    Significance_Scientific,
    Significance_Social,
    ComparativeCriteria,
    Significance_Interpretive,
    Significance_Provenance,
    Significance_Rarity,
    Significance_Condition,
    PhysicalCondition,
    Significance_Representativeness,
    StatementOfSignificance,
    Materials,
    Dimensions,
    Classification,
    PrimaryClass,
    SecondaryClass,
    TertiaryClass,
    DefaultCurrentLocation
FROM
    ObjectsExport
WHERE
    PrimaryKey_Object_Table IN(3,6,8,23,25,29,30,47,48,4138,1584,1621,1622,755,1841,3977,4406,3767,4324,4496,5773,679,750,17084,3058,12836,679,13671,27992,11114,14390,11423,14712,11457,12626,26488,28319,8789,8260,3369)
;
