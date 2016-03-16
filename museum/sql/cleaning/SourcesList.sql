SELECT s.*, group_concat(DISTINCT o.ItemType) as ObjectTypes, count(o.PrimaryKey_Object_Table) as NumRecords from Sources s LEFT JOIN Objects o ON (s.SourceName = o.SourceName) GROUP BY s.SourceName;
