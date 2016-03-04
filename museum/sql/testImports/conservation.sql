# find at least 2 representative values for each field

(SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE ConditionReport IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE ConditionSurveyedBy IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE PhysicalCondition IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE PhysicalConditionCode IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE Recommendations IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE ReminderDate IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE VisualCondition IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE VisualConditionCode IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE WhyReminder IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE Conservation IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE ConservationDate IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE ConservationHistoryID IS NOT NULL
       LIMIT 2)
UNION (SELECT PrimaryKey_Object_Table
       FROM ObjectsExport
       WHERE ConservationBy IS NOT NULL
       LIMIT 2)
;
## now we've found the sample records use them as the source
SELECT
    Accession_Full_ID,
    ItemName,
    ConditionReport,
    ConditionSurveyedBy,
    PhysicalCondition,
    PhysicalConditionCode,
    PhysicalConditionDescription,
    Recommendations,
    ReminderDate,
    VisualCondition,
    VisualConditionCode,
    VisualConditionDescription,
    WhyReminder,
    Conservation,
    ConservationDate,
    ConservationHistoryID,
    ConservationBy
FROM
    ObjectsExport
WHERE
    PrimaryKey_Object_Table IN (3,6,7863,8,11,7708,7709);
