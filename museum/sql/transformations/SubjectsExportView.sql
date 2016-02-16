CREATE OR REPLACE VIEW SubjectsExport AS
SELECT
    s.SubjectID AS s_SubjectID,
    s.Dates AS s_Dates,
    s.HeritageSite AS s_HeritageSite,
    s.LastEditBy AS s_LastEditBy,
    s.LastEditDate AS s_LastEditDate,
    s.LoadSubjectID AS s_LoadSubjectID,
    s.SubjectDescription AS s_SubjectDescription,
    s.SubjectName AS s_SubjectName,
    s.SubjectResearchBy AS s_SubjectResearchBy,
    s.SubjectType AS s_SubjectType,
    os.ObjectSubjectID AS os_ObjectSubjectID,
    os.Association AS os_Association,
    os.Dates AS os_Dates,
    os.DateMin AS os_DateMin,
    os.DateMax AS os_DateMax,
    o.Accession_Full_ID AS o_Accession_Full_ID,
    o.ItemType AS o_ItemType,
    ss.SubjectSubjectID AS ss_SubjectSubjectID,
    ss.SubjectID AS ss_SubjectID,
    ss.SubjectName AS ss_SubjectName,
    ss.Association AS ss_Association,
    ss.Dates AS ss_Dates,
    ss.DateMin AS ss_DateMin,
    ss.DateMax AS ss_DateMax,
    rs.SubjectType AS rs_SubjectType
FROM
    Subjects s
    LEFT JOIN ObjectsSubjects os ON os.SubjectName = s.SubjectName
    LEFT JOIN Objects o ON os.Accession_Full_ID = o.Accession_Full_ID
    LEFT JOIN SubjectsSubjects ss ON s.SubjectID = ss.SubjectID
    LEFT JOIN Subjects rs ON ss.SubjectName = rs.SubjectName;
