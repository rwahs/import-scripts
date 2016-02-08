CREATE OR REPLACE VIEW ObjectsExport AS
		SELECT
				o.*,
				m.MethodDescription,
				s.Address,
				s.Deceased,
				s.DonorNotes,
				s.EMail,
				s.Fax,
				NULL           AS DonorAgentName,
				NULL           AS DonorAgentAddress,
				NULL           AS DonorAgentPhoneNumber,
				s.FirstNames,
				s.Initials,
				s.LastEditBy   AS SourceLastEditBy,
				s.LastEditDate AS SourceLastEditDate,
				s.LastName,
				s.Phone,
				s.MobilePhone,
				s.PostCode,
				s.Salutation,
				s.SourceID,
				s.State,
				s.TownCity
		FROM
				Objects o
				LEFT JOIN Methods m ON (o.Method = m.Method)
				LEFT JOIN Sources s ON (o.SourceName = s.SourceName);

SELECT DISTINCT Sources.Address
FROM Sources;
SELECT * FROM ObjectsExport;
