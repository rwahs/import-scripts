# find at least 2 representative values for each field
(SELECT s_SubjectID FROM SubjectsExport WHERE s_Dates IS NOT NULL AND s_Dates <> '' LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_HeritageSite IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_LastEditBy IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_LastEditDate IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_LoadSubjectID IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_SubjectDescription IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_SubjectName IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_SubjectResearchBy IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_SubjectType IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE os_ObjectSubjectID IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE os_Association IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE os_Dates IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE os_DateMin IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE os_DateMax IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE o_Accession_Full_ID IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE o_ItemType IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE ss_SubjectSubjectID IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE relatedSubject_SubjectID IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE relatedSubject_SubjectName IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE ss_Association IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE ss_Dates IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE ss_DateMin IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE ss_DateMax IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE relatedSubject_SubjectType IS NOT NULL LIMIT 2)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_SubjectName LIKE 'PRINSEP%' OR relatedSubject_SubjectName LIKE 'PRINSEP%' OR relatedSubject_SubjectName LIKE 'Bussel%' OR s_SubjectName LIKE 'Bussel%')
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE length(s_SubjectName) > 30 OR length(relatedSubject_SubjectName) > 30)
UNION(SELECT s_SubjectID FROM SubjectsExport WHERE s_SubjectName IN ('VVV', 'Properjohn'))
;
## now we've found the sample records use them as the source
SELECT
    s_SubjectID,
    s_Dates,
    s_HeritageSite,
    s_LastEditBy,
    s_LastEditDate,
    s_LoadSubjectID,
    s_SubjectDescription,
    s_SubjectName,
    s_SubjectResearchBy,
    s_SubjectType,
    os_ObjectSubjectID,
    os_Association,
    os_Dates,
    os_DateMin,
    os_DateMax,
    o_Accession_Full_ID,
    o_ItemType,
    ss_SubjectSubjectID,
    relatedSubject_SubjectID,
    relatedSubject_SubjectName,
    ss_Association,
    ss_Dates,
    ss_DateMin,
    ss_DateMax,
    relatedSubject_SubjectType
FROM
    SubjectsExport
WHERE
    s_SubjectID IN(105,36,200,104,142,202,124,106,68,167,218,103,144,170,97,110)
;
