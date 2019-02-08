(SELECT *
   FROM 
   -- Verlauf aus "01:FF"
   (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Fallführung (FF)' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v1
  WHERE regguid = '{009AA717-547D-49EF-BD48-48EB00F73D4D}')
UNION ALL
   -- Verlauf aus "02:Psychiatrie"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Psychiatrie' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v2
  WHERE regguid = '{65A87962-594B-4FD9-9955-045E5E429034}')
UNION ALL
   -- Verlauf aus "03:Somatik"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Somatik' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v3
  WHERE regguid = '{665EC52A-2F1D-44C2-B138-291CAA1B28F2}') 
UNION ALL
   -- Verlauf aus "04:Patientenadministration"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Patientenadministration' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v4
  WHERE regguid = '{92CD8367-2962-4AC9-A7B6-A52CFD8D68DA}') 
UNION ALL
   -- Verlauf aus "05:Pflege"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Pflege' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v5
  WHERE regguid = '{13C4BF23-DFBA-40D7-93A5-3AD882E545F8}') 
UNION ALL
   -- Verlauf aus "06:Körperteam/Physiotherapie"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Körperteam/Physiotherapie' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v6
  WHERE regguid = '{51C7AEAE-6F72-4269-8E4D-953603329D10}') 
UNION ALL
   -- Verlauf aus "07:Arbeitsintegration/Aktivierung"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Arbeitsintegration/Aktivierung' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v7
  WHERE regguid = '{B5963196-1E95-45C9-875D-F81FA8AD451F}') 
UNION ALL
   -- Verlauf aus "08:Therapeutische Dienste"
(SELECT *
   FROM (SELECT   gv.version_id AS gesamtv_versionid,
                  gv.detail_id AS gesamtv_detailid,
                  gv.gueltig_ab AS gesamtv_timestamp,
                  objtyp.wert as gesamtv_titel,
                  NULL as gesamtv_beschreibung,
                  gv.eintrag as gesamtv_beschreibungblb,
                  1 AS gesamtv_dringlichkeit, 1 AS gesamtv_status,
                  1 AS gesamtv_statushintergrund,
                  'Therapeutische Dienstleister' AS gesamtv_herkunft,
                  gv.eingetragen_durch AS gesamtv_autor,
                  de.erstellt AS gesamtv_erfasst,
                  TRUNC (gv.gueltig_ab) AS gesamtv_datum,
                  gv.gueltig_ab - TRUNC (gv.gueltig_ab) AS gesamtv_uhrzeit,
                  de.paid AS gesamtv_paid, de.faid AS gesamtv_faid,
                  'Verlaufseintrag' AS gesamtv_linkzieltyp,
                  getregisterguid (gv.struktur_element_id) regguid,
                  NULL AS gesamtv_rowfontcolor,  
                  NULL AS gesamtv_rowcolor  
             FROM docadmin.eldat_custtime_1173 gv,
                  dokument_eintrag de,
                  struktur_element sel,
                  eldat_klg klgdata,
                  (SELECT taid ID,
                             'T'
                          || getdfbyanbindung (taid,
                                               'Ta',
                                               'TXT',
                                               'BmTa5',
                                               'BmTa5'
                                              ) code,
                          bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, 'T' isselectable,
                          bezeichnung reihenfolge, knoten_id
                     FROM terminart
                    WHERE ttcode <> 'S'
                   UNION
                   SELECT df.dfid + 100000 ID, 'O' || df.code,
                          df.bezeichnung wert, -1 vater, NULL gueltig_ab,
                          NULL gueltig_bis, df.aktiviert AS isselectable,
                          df.bezeichnung reihenfolge, knoten_id
                     FROM docdf df, docdftyp dft
                    WHERE df.dftypid = dft.dftypid
                      AND dft.guid = '{E9BF29C8-5E25-467A-ADE7-7B43FA6BE9E6}') objtyp
            WHERE (gv.version_id = de.version_id)
              AND (gv.dokument_id = de.dokument_id)
              AND (de.paid = :paid)
              AND (gv.struktur_element_id = sel.struktur_element_id)
              AND (gv.detail_id = klgdata.detail_id)
              AND (klgdata.klgitem_id = objtyp.id (+))
              AND (klgdata.version_id = gv.version_id)
              AND (klgdata.element_detail_id = 6289)  -- bei migration anpassen!
         ORDER BY gv.detail_id) v8
  WHERE regguid = '{9385D72A-FE8D-4391-AEB3-7EEDA0EC5228}') 
