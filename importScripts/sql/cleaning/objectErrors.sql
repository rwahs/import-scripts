# Identifiy object records to re-import
SELECT PrimaryKey_Object_Table from ObjectsExport WHERE length(BoxType) > 30
UNION SELECT PrimaryKey_Object_Table from ObjectsExport WHERE LENGTH(OtherNum) > 30
UNION SELECT PrimaryKey_Object_Table from ObjectsExport WHERE LENGTH(Recommendations) > 255
UNION SELECT PrimaryKey_Object_Table from ObjectsExport WHERE LENGTH(ConditionSurveyedBy) > 30
UNION SELECT PrimaryKey_Object_Table from ObjectsExport WHERE DateReceived = '13/.6/2013'
;
