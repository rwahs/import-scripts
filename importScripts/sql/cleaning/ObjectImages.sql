SET GROUP_CONCAT_MAX_LEN = 1000000;
SELECT ImageFilePath, count(*) as numRecords, group_concat(Accession_Full_ID SEPARATOR ', ') as AccessionNumbers, group_concat(ImageFileName SEPARATOR ', ') as FileNames  FROM ObjectsImages WHERE TRIM(ImageFileName) <> ''GROUP BY ImageFilePath HAVING LEFT(ImageFilePath, 3) <> 'Y:\\' ORDER BY ImageFilePath;
