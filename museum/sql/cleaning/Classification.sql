SELECT PrimaryClass, SecondaryClass, TertiaryClass, COUNT(*) as NumRecords, GROUP_CONCAT(DISTINCT ItemType)
FROM Objects o GROUP BY PrimaryClass, SecondaryClass, TertiaryClass
ORDER BY PrimaryClass, SecondaryClass, TertiaryClass;
