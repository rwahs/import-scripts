CREATE OR REPLACE VIEW SubjectsExport AS
SELECT
    NULLIF(s.SubjectID,'') AS s_SubjectID,
    NULLIF(s.Dates,'') AS s_Dates,
    NULLIF(s.HeritageSite,0) AS s_HeritageSite,
    NULLIF(s.LastEditBy,'') AS s_LastEditBy,
    NULLIF(s.LastEditDate,'0000-00-00 00:00:00') AS s_LastEditDate,
    NULLIF(s.LoadSubjectID,'') AS s_LoadSubjectID,
    NULLIF(s.SubjectDescription,'') AS s_SubjectDescription,
    NULLIF(s.SubjectName,'') AS s_SubjectName,
    NULLIF(s.SubjectResearchBy,'') AS s_SubjectResearchBy,
    NULLIF(s.SubjectType,'') AS s_SubjectType,
    NULLIF(os.ObjectSubjectID,'') AS os_ObjectSubjectID,
    NULLIF(os.Association,'') AS os_Association,
    NULLIF(os.Dates,'') AS os_Dates,
    NULLIF(os.DateMin,'') AS os_DateMin,
    NULLIF(os.DateMax,'') AS os_DateMax,
    NULLIF(o.Accession_Full_ID,'') AS o_Accession_Full_ID,
    NULLIF(o.ItemType,'') AS o_ItemType,
    NULLIF(ss.SubjectSubjectID,'') AS ss_SubjectSubjectID,
    NULLIF(relatedSubject.SubjectID,'') AS relatedSubject_SubjectID,
    NULLIF(relatedSubject.SubjectName,'') AS relatedSubject_SubjectName,
    NULLIF(ss.Association,'') AS ss_Association,
    NULLIF(ss.Dates,'') AS ss_Dates,
    NULLIF(ss.DateMin,'') AS ss_DateMin,
    NULLIF(ss.DateMax,'') AS ss_DateMax,
    NULLIF(relatedSubject.SubjectType,'') AS relatedSubject_SubjectType
FROM
    Subjects s
    LEFT JOIN ObjectsSubjects os ON os.SubjectName = s.SubjectName
    LEFT JOIN Objects o ON os.Accession_Full_ID = o.Accession_Full_ID
    LEFT JOIN SubjectsSubjects ss ON s.SubjectID = ss.SubjectID
    LEFT JOIN Subjects relatedSubject ON ss.SubjectName = relatedSubject.SubjectName
ORDER BY
    s.SubjectID,
    os.ObjectSubjectID,
    ss.SubjectSubjectID
;
