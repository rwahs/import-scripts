SELECT
    s.SubjectID,
    s.SubjectName,
    s.SubjectDescription,
    s.SubjectType,
    GROUP_CONCAT(DISTINCT o.ItemType)      AS ObjectTypes,
    COUNT(o.PrimaryKey_Object_Table)       AS NumObjects,
    GROUP_CONCAT(DISTINCT sss.SubjectType) AS RelatedSubjectTypes,
    GROUP_CONCAT(DISTINCT sss.SubjectName) AS RelatedSubjects,
    COUNT(DISTINCT ss.SubjectName)         AS NumRelatedSubjects
FROM Subjects s
    LEFT JOIN ObjectsSubjects os ON (os.SubjectName = s.SubjectName)
    LEFT JOIN Objects o ON (os.Accession_Full_ID = o.Accession_Full_ID)
    LEFT JOIN SubjectsSubjects ss ON (s.SubjectID = ss.SubjectID)
    LEFT JOIN Subjects sss ON (sss.SubjectName = ss.SubjectName)
GROUP BY SubjectName
ORDER BY SubjectName;
