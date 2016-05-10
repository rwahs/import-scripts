CREATE OR REPLACE VIEW ObjectsExport AS
    SELECT
        NULLIF(TRIM(o.PrimaryKey_Object_Table), '')               AS PrimaryKey_Object_Table,
        NULLIF(TRIM(o.AccessionPrefix), '')                       AS AccessionPrefix,
        NULLIF(TRIM(o.AccessionYear), '')                         AS AccessionYear,
        NULLIF(TRIM(o.AccessionNumber), '')                       AS AccessionNumber,
        NULLIF(TRIM(o.AccessionSeries), '')                       AS AccessionSeries,
        NULLIF(TRIM(o.AccessionParts), '')                        AS AccessionParts,
        NULLIF(TRIM(o.Accession_Full_ID), '')                     AS Accession_Full_ID,
        NULLIF(TRIM(o.AccessionBy), '')                           AS AccessionBy,
        NULLIF(TRIM(o.AccessionDate), '0000-00-00')               AS AccessionDate,
        NULLIF(TRIM(o.AdminText1), '')                            AS AdminText1,
        NULLIF(TRIM(o.AdminText2), '')                            AS AdminText2,
        NULLIF(TRIM(o.AmountPaid), '')                            AS AmountPaid,
        NULLIF(TRIM(o.AuditID), '')                               AS AuditID,
        NULLIF(TRIM(o.AuditSightedYesNo), '')                     AS AuditSightedYesNo,
        NULLIF(TRIM(o.AuthorizedBy), '')                          AS AuthorizedBy,
        NULLIF(TRIM(o.BibliographReferences), '')                 AS BibliographReferences,
        NULLIF(TRIM(o.CompletedYesNo), '')                        AS CompletedYesNo,
        NULLIF(TRIM(o.ConditionOnReceipt), '')                    AS ConditionOnReceipt,
        rc.`Condition`                                            AS ConditionOnReceiptCode,
        rc.SequenceOnForm                                         AS ConditionOnReceiptSequenceOnForm,
        NULLIF(TRIM(o.ConditionReport), '')                       AS ConditionReport,
        NULLIF(TRIM(o.ConditionSurveyedBy), '')                   AS ConditionSurveyedBy,
        NULLIF(TRIM(o.CopyrightDetails), '')                      AS CopyrightDetails,
        NULLIF(TRIM(o.CopyrightYesNo), '')                        AS CopyrightYesNo,
        NULLIF(TRIM(o.Correspondence), '')                        AS Correspondence,
        NULLIF(TRIM(o.DateReceived), '')                          AS DateReceived,
        NULLIF(TRIM(o.DeAccessionedYesNo), '')                    AS DeAccessionedYesNo,
        NULLIF(TRIM(d.DeaccessionReason), '')                     AS DeaccessionReason,
        NULLIF(TRIM(d.DeaccessionDisposal), '')                   AS DeaccessionDisposal,
        CASE WHEN o.ItemType = 'Photograph'
            THEN NULL
        ELSE
            NULLIF(TRIM(o.Description), '') END                   AS Description,
        CASE WHEN o.ItemType = 'Photograph'
            THEN NULLIF(TRIM(o.Description), '')
        ELSE
            NULL END                                              AS Summary,
        NULLIF(TRIM(o.Dimensions), '')                            AS Dimensions,
        NULLIF(TRIM(o.EarliestYear), 0)                           AS EarliestYear,
        NULLIF(TRIM(o.ExhibitLoanNeeds), '')                      AS ExhibitLoanNeeds,
        NULLIF(TRIM(o.ExportYesNo), '')                           AS ExportYesNo,
        NULLIF(TRIM(o.FileNum), '')                               AS FileNum,
        NULLIF(TRIM(o.HistoricalDetails), '')                     AS HistoricalDetails,
        NULLIF(TRIM(o.HistoryText1), '')                          AS HistoryText1,
        NULLIF(TRIM(o.Importance), '')                            AS Importance,
        NULLIF(TRIM(o.InsuranceDate), '0000-00-00')               AS InsuranceDate,
        NULLIF(TRIM(o.InsuranceValue), '')                        AS InsuranceValue,
        NULLIF(TRIM(o.ItemDates), '')                             AS ItemDates,
        NULLIF(TRIM(o.ItemName), '')                              AS ItemName,
        NULLIF(TRIM(o.ItemType), '')                              AS ItemType,
        NULLIF(TRIM(o.LastEditDate), '0000-00-00 00:00:00')       AS LastEditDate,
        NULLIF(TRIM(o.LastEditBy), '')                            AS LastEditBy,
        NULLIF(TRIM(o.LatestYear), 0)                             AS LatestYear,
        NULLIF(TRIM(o.LegalTitleYesNo), '')                       AS LegalTitleYesNo,
        NULLIF(TRIM(o.Location), '')                              AS Location,
        NULLIF(TRIM(o.LocationDate), '0000-00-00')                AS LocationDate,
        NULLIF(TRIM(o.LocationStatus), '')                        AS LocationStatus,
        NULLIF(TRIM(o.LoggedDate), '0000-00-00')                  AS LoggedDate,
        CASE WHEN o.ItemType IN ('Photograph', 'Memorials')
            THEN NULL
        ELSE
            NULLIF(TRIM(o.MakersMarks), '') END                   AS MakersMarks,
        CASE WHEN o.ItemType IN ('Photograph', 'Memorials')
            THEN
                NULLIF(TRIM(o.MakersMarks), '')
        ELSE
            NULL END                                              AS Creator,
        NULLIF(TRIM(o.Materials), '')                             AS Materials,
        NULLIF(TRIM(o.Method), '')                                AS Method,
        NULLIF(TRIM(o.NegativeNum), '')                           AS NegativeNum,
        NULLIF(TRIM(o.ObjectImageYesNo), '')                      AS ObjectImageYesNo,
        NULLIF(TRIM(o.OtherNum), '')                              AS OtherNum,
        NULLIF(TRIM(o.PhotoNum), '')                              AS PhotoNum,
        NULLIF(TRIM(o.PhysicalCondition), '')                     AS PhysicalCondition,
        pc.Condition                                              AS PhysicalConditionCode,
        pc.ConditionDescription                                   AS PhysicalConditionDescription,
        # When SecondaryClass is blank then PrimaryClass's value is already in `Classification`
        CASE WHEN
            TRIM(o.SecondaryClass) = ''
            THEN NULL
        WHEN TRIM(o.PrimaryClass) = ''
            THEN NULL
        ELSE TRIM(o.PrimaryClass) END                             AS PrimaryClass,
        NULLIF(TRIM(o.QualityFailsYesNo), '')                     AS QualityFailsYesNo,
        NULLIF(TRIM(o.ReceiptNum), '')                            AS ReceiptNum,
        NULLIF(TRIM(o.ReceivedBy), '')                            AS ReceivedBy,
        NULLIF(TRIM(o.Recommendations), '')                       AS Recommendations,
        NULLIF(TRIM(o.ReminderDate), '0000-00-00')                AS ReminderDate,
        NULLIF(TRIM(o.ResearchBy), '')                            AS ResearchBy,
        NULLIF(TRIM(o.ResearchText1), '')                         AS ResearchText1,
        NULLIF(TRIM(o.ResearchText2), '')                         AS ResearchText2,
        NULLIF(TRIM(o.ResearchYesNo), '')                         AS ResearchYesNo,
        NULLIF(TRIM(o.Restrictions), '')                          AS Restrictions,
        NULLIF(TRIM(o.RestrictionsDetails), '')                   AS RestrictionsDetails,
        NULLIF(TRIM(o.ReturnedYesNo), '')                         AS ReturnedYesNo,
        # When TertiaryClass is blank then SecondaryClass's value is already in `Classification`
        CASE WHEN
            TRIM(o.TertiaryClass) = ''
            THEN NULL
        WHEN TRIM(o.SecondaryClass) = ''
            THEN NULL
        ELSE TRIM(o.SecondaryClass) END                           AS SecondaryClass,
        NULLIF(TRIM(o.Significance_Aesthetic), 0)                 AS Significance_Aesthetic,
        NULLIF(TRIM(o.Significance_Historic), 0)                  AS Significance_Historic,
        NULLIF(TRIM(replace(o.SourceName, '<<N/A>>', 'N/A')), '') AS SourceName,
        s.SourceID                                                AS SourceID,
        NULLIF(TRIM(o.Significance_Scientific), 0)                AS Significance_Scientific,
        NULLIF(TRIM(o.Significance_Social), 0)                    AS Significance_Social,
        NULLIF(TRIM(o.Significance_Condition), 0)                 AS Significance_Condition,
        NULLIF(TRIM(o.Significance_Interpretive), 0)              AS Significance_Interpretive,
        NULLIF(TRIM(o.Significance_Provenance), 0)                AS Significance_Provenance,
        NULLIF(TRIM(o.Significance_Rarity), 0)                    AS Significance_Rarity,
        NULLIF(TRIM(o.Significance_Representativeness), 0)        AS Significance_Representativeness,
        NULLIF(TRIM(o.SizeMass), '')                              AS SizeMass,
        NULLIF(TRIM(o.StatementOfSignificance), '')               AS StatementOfSignificance,
        NULLIF(TRIM(o.TertiaryClass), '')                         AS TertiaryClass,
        NULLIF(TRIM(o.TitleDetails), '')                          AS TitleDetails,
        NULLIF(TRIM(o.TreatmentCompleteYesNo), '')                AS TreatmentCompleteYesNo,
        NULLIF(TRIM(o.TreatmentPriority), '')                     AS TreatmentPriority,
        NULLIF(TRIM(o.UsualLocation), '')                         AS UsualLocation,
        NULLIF(TRIM(o.ValuationGroup), '')                        AS ValuationGroup,
        NULLIF(TRIM(o.ValuationID), '')                           AS ValuationID,
        NULLIF(TRIM(o.VisualCondition), '')                       AS VisualCondition,
        vc.Condition                                              AS VisualConditionCode,
        vc.ConditionDescription                                   AS VisualConditionDescription,
        NULLIF(TRIM(o.WhyReminder), '')                           AS WhyReminder,
        NULLIF(TRIM(o.XternalReference), '')                      AS XternalReference,
        NULLIF(TRIM(o.Xtra), '')                                  AS Xtra,
        # Synthesised fields or join fields
        NULLIF(TRIM(m.MethodDescription), '')                     AS MethodDescription,

        NULLIF(CONCAT_WS(';',
                         IF(Significance_Aesthetic = 1, 'aesthetic', NULL),
                         IF(Significance_Historic = 1, 'historic', NULL),
                         IF(Significance_Scientific = 1, 'scientific', NULL),
                         IF(Significance_Social = 1, 'social', NULL)
               ), '')                                             AS SignificanceCriteria,
        NULLIF(CONCAT_WS(';',
                         IF(Significance_Interpretive = 1, 'interpretive', NULL),
                         IF(Significance_Provenance = 1, 'provenance', NULL),
                         IF(Significance_Rarity = 1, 'rarity', NULL),
                         IF(Significance_Condition = 1, 'condition', NULL),
                         IF(Significance_Representativeness = 1, 'representativeness', NULL)
               ), '')                                             AS ComparativeCriteria,
        COALESCE(
            NULLIF(TRIM(o.TertiaryClass), ''),
            NULLIF(TRIM(o.SecondaryClass), ''),
            NULLIF(TRIM(o.PrimaryClass), '')
        )                                                         AS Classification,
        # Conservation fields
        NULLIF(TRIM(c.ConservationHistoryID), '')                 AS ConservationHistoryID,
        NULLIF(TRIM(c.ConservationBy), '')                        AS ConservationBy,
        NULLIF(TRIM(c.ConservationDate), '0000-00-00')            AS ConservationDate,
        NULLIF(TRIM(c.Conservation), '')                          AS Conservation
    FROM
        Objects o
        LEFT JOIN Methods m ON (o.Method = m.Method)
        LEFT JOIN Sources s ON (o.SourceName = s.SourceName)
        LEFT JOIN DeAccessions d USING (Accession_Full_ID)
        LEFT JOIN ReceiptConditions vc ON (o.VisualCondition = vc.SequenceOnForm)
        LEFT JOIN ReceiptConditions pc ON (o.PhysicalCondition = pc.SequenceOnForm)
        LEFT JOIN ReceiptConditions rc ON (o.ConditionOnReceipt = rc.ConditionDescription)
        LEFT JOIN ConservationHistory c ON (o.Accession_Full_ID = c.Accession_Full_ID)
    ORDER BY o.PrimaryKey_Object_Table;
