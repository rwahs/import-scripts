DROP TABLE IF EXISTS datareport;
SET @sql = NULL;
-- may need to be bigger depending on how many tables, columns you have and the length of data in those columns
SET @@group_concat_max_len = 50000000000;
SELECT GROUP_CONCAT(
    CONCAT_WS('',
              'SELECT "', TABLE_NAME, '" AS tableName, "',
              COLUMN_NAME, '" AS field,
              COUNT(DISTINCT `', COLUMN_NAME, '`) AS numDistinctValues,
              COUNT(`', COLUMN_NAME, '`) AS numRecords,
              MIN(LENGTH(`', COLUMN_NAME, '`)) AS minLength,
              MAX(LENGTH(`', COLUMN_NAME, '`)) AS maxLength,
              AVG(LENGTH(`', COLUMN_NAME, '`)) AS meanLength,
              LEFT(GROUP_CONCAT(DISTINCT TRIM(`', COLUMN_NAME, '`) SEPARATOR "|"), 1024) AS sampleValues
              FROM `', TABLE_NAME, '`
              WHERE `', COLUMN_NAME, '` IS NOT NULL
              AND trim(`', COLUMN_NAME, '`) != ""
              GROUP BY 1 ') SEPARATOR "UNION \n\t")
INTO @sql
FROM information_schema.COLUMNS
WHERE TABLE_SCHEMA = 'rwahs_museum';

SET @sql = CONCAT('CREATE TABLE datareport AS ', @sql, ';');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
