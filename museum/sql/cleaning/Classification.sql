SELECT
    PrimaryClass,
    SecondaryClass,
    TertiaryClass,
    COUNT(*) as NumRecords,
    GROUP_CONCAT(DISTINCT ItemType) AS ObjectTypes
FROM Objects o
GROUP BY PrimaryClass, SecondaryClass, TertiaryClass
ORDER BY PrimaryClass, SecondaryClass, TertiaryClass;
