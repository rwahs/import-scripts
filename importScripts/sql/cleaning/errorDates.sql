SELECT
    DateOfCreation,
    count(*) as numRecords,
    IF(
        Accession_Full_ID IN ('P1995.31d', 'P2013.2327', 'P2014.609', 'P2015.902', 'P2015.903', 'P2015.904', 'P2015.905', 'P1999.1016Copied', 'P1999.1020Copied', 'P1999.1050copied', 'P1999.1051copied', 'P1999.1126copied', 'P1999.1255copied', 'P1999.1274copied', 'P1999.6259', 'P1999.6260', 'P1999.6261', 'P1999.6262', 'P1999.1303', 'P1999.6263', 'P1999.6265', 'P1999.6266', 'P1999.6269', 'P1999.6270', 'P1999.1318Copied', 'P1999.6271', 'P1999.6272', 'P1999.6273', 'P1999.6274', 'P1999.6275', 'P1999.6276', 'P1999.6277', 'P1999.6278', 'P1999.6279', 'P1999.6280', 'P1999.6281', 'P1999.6282', 'P1999.6285', 'P1999.6286', 'P1999.6289', 'P1999.6290', 'P1999.6296', 'P1999.6297', 'P1999.6298', 'P1999.6299', 'P1999.6300', 'P1999.6301', 'P1999.1409copied', 'P1999.1459copied', 'P1999.1462copied', 'P1999.1465copied', 'P1999.1497copied', 'P1999.1498copied', 'P1999.1499copied', 'P1999.1509copied', 'P1999.1521copied', 'P1999.1524Copied', 'P1999.3531copied', 'P1999.1554copied', 'P1999.1614copied', 'P1999.1625copied', 'P1999.1626copied', 'P1999.6304', 'P1999.6306', 'P1999.6307', 'P1999.6308', 'P1999.6323', 'P1999.6324', 'P1999.6325', 'P1999.6327', 'P1999.6328', 'P1999.6332', 'P1999.6333', 'P1999.6335', 'P1999.6337', 'P1999.6338', 'P1999.6339', 'P1999.6340', 'P1999.6343', 'P1999.6344', 'P1999.6345', 'P1999.6347', 'P1999.6348', 'P1999.6349', 'P1999.6352', 'P1999.6353', 'P1999.6354', 'P1999.6355', 'P1999.6356', 'P1999.6357', 'P1999.6358', 'P1999.6359', 'P1999.6360', 'P1999.1675copied', 'P1999.1878copied', 'P1999.6361', 'P1999.6362', 'P1999.6363', 'P1999.6364', 'P1999.6365', 'P1999.6368', 'P1999.6370', 'P1999.6371', 'P1999.6372', 'P1999.6375', 'P1999.6373', 'P1999.6376', 'P1999.6378', 'P1999.6379', 'P1999.6380', 'P1999.6385', 'P1999.6402', 'P1999.2001Copied', 'P1999.6397', 'P1999.6392copied', 'P1999.6395', 'P1999.6412', 'P1999.6393', 'P1999.6394', 'P1999.6499copied', 'P1999.6500copied', 'P1984.241FP', 'P1999.3605copied', 'P1999.2120copied', 'P1999.6686', 'P1999.6687', 'P1999.6773', 'P1999.6865', 'P1999.6868', 'P1999.6869', 'P1999.6886Copied', 'P1999.6959', 'P1999.7057', 'P1999.7065', 'P1999.7138', 'P1999.7295', 'P1999.7297', 'P1999.7368', 'P2007.80FP', 'P1999.2333copied', 'P2007.130uncopied', 'P2007.132uncopied', 'P2008.160uncopied', 'P2008.161uncopied', 'P2008.4', 'P2008.12', 'P2008.14', 'P2008.17uncopied', 'P2008.18uncopied', 'P2008.19', 'P2008.20', 'P2008.21', 'P2008.22', 'P2008.23', 'P2008.24', 'P2008.25', 'P2008.26', 'P2008.27', 'P2008.28uncopied', 'P2008.28', 'P2008.29', 'P2008.30', 'P2008.31', 'P2008.32', 'P1999.447', 'P1999.458', 'P1999.461', 'P2008.44a', 'P1999.469', 'P2008.44b', 'P1999.798', 'P1999.821', 'P2009.824', 'P1999.476', 'P2008.57a', 'P2008.57b', 'P1999.1753', 'P2008.45', 'P1999.1026.1', 'P2009.257', 'P2009.260', 'P2002.30', 'P2002.38', 'P2009.265', 'P2009.269', 'P2003.1004', 'P2003.1005', 'P2003.1006', 'P2003.1007', 'P2004.432', 'P2005.768', 'P2005.769', 'P2005.770', 'P2005.771', 'P2005.772', 'P2005.773', 'P2005.774', 'P2005.775', 'P2005.776', 'P2005.1201', 'P1999.2114', 'P1999.2115', 'P2006.1201', 'P2002.36aa', 'P2002.36bb', 'P2002.36jj', 'P1999.4065', 'P1999.3706copied', 'P1999.2156', 'P1999.2184', 'P1999.2186', 'P1999.2187', 'P1999.2192', 'P1999.2193', 'P1999.2197', 'P1999.2198', 'P1999.2200', 'P1999.2202', 'P1999.2204', 'P1999.2205', 'P1999.2209', 'P1999.2211', 'P1999.1713', 'P1999.4279copied', 'P2009.275', 'P2009.276', 'P2009.288', 'P2009.289', 'P2009.290', 'P2009.293', 'P2009.294', 'P2009.295', 'P2009.296', 'P1999.3590', 'P1999.4123', 'P1999.5060', 'P1999.5061', 'P1999.5062', 'P1999.5063', 'P1999.5064', 'P1999.5065', 'P1999.5066', 'P1999.5067', 'P1999.5068', 'P1999.5069', 'P1999.5070', 'P1999.5071', 'P1999.5072', 'P2009.488', 'P1999.291', 'P1999.312', 'P1999.313', 'P1999.318', 'P1999.319', 'P1999.320', 'P1999.1382', 'P1999.1383', 'P1999.1384', 'P1999.1378', 'P1999.2936', 'P1999.3418', 'P1999.3419', 'P1999.3422', 'P1999.3479', 'P1999.3480', 'P1999.3482', 'P1999.3487', 'P1999.3488', 'P2011.19', 'P2011.20', 'P1999.3559', 'P1999.3572', 'P1999.3678', 'P1999.3679', 'P1999.3680', 'P2011.470', 'P2011.114', 'P2011.137', 'P2011.1159', 'P2011.1158', 'P1999.623', 'P1999.2497copied', 'P2011.1069', 'P2011.1048', 'P2011.1047', 'P1999.5256', 'P2012.278', 'P2012.280', 'P2012.281', 'P2012.283', 'P2012.284', 'P2012.282', 'P2012.1642', 'P2012.1644', 'P2012.1646', 'P2012.1645', 'P2013.418', 'P2013.128', 'P1999.4801copied', 'P2013.434', 'P2013.1300', 'P1999.1026.2', 'P1999.1026.3', 'P1999.1026.4', 'P1999.1026.5', 'P1999.1026.6', 'P1999.1026.7', 'P1999.1026.8', 'P1999.1026.9', 'P1999.1026.10', 'P1999.1026.11', 'P1999.1026.12', 'P1999.1026.13', 'P1999.1026.14', 'P1999.1026.16', 'P1999.1026.17', 'P1999.1026.18', 'P1999.1026.19', 'P1999.1026.20', 'P1999.1026.21', 'P1999.1026.22', 'P1999.1026.23', 'P1999.1026.24', 'P1999.1026.25', 'P1999.1026.26', 'P1999.1026.27', 'P1999.1026.28', 'P2013.2416', 'P2013.2417', 'P2014.2418', 'P2013.2420', 'P2013.2421', 'P2014.125', 'P2014.82', 'P2014.83', 'P2014.747', 'P2014.748', 'P2014.749', 'P2014.750', 'P2014.751', 'P2014.752', 'P2014.753', 'P2014.754', 'P2014.755', 'P2014.756', 'P2014.757', 'P2014.758', 'P2014.759', 'P2014.760', 'P2014.761', 'P2014.762', 'P2014.763', 'P2014.764', 'P2014.765', 'P2014.258', 'P2014.799', 'P2014.740', 'P2014.741', 'P2014.742', 'P2014.198', 'P2014.199', 'P2014.200', 'P2014.203', 'P2014.205', 'P2014.204', 'P2014.238', 'P2014.245', 'P2014.941', 'P2014.938', 'P2014.946', 'P2014.947', 'P2014.949', 'P2014.950', 'P2014.980', 'P2014.967', 'P2014.1147', 'P2014.1146', 'P2014.1143', 'P2015.639', 'P2015.415', 'P2015.417', 'P2015.418', 'P2015.419', 'P2015.', 'P2015.420', 'P2015.421', 'P2015.422', 'P2015.423', 'P2015.424', 'P2015.426', 'P2015.427', 'P2015.1713', 'P2015.5', 'P2015.6', 'P2015.7', 'P2015.8', 'P2015.9', 'P2015.10', 'P2015.11', 'P2015.12', 'P2015.13', 'P2015.14', 'P2015.717', 'P2015.718', 'P2015.981', 'P2015.982', 'P2015.970', 'P2015.579', 'P2015.580', 'P2015.582', 'P2015.583', 'P2015.585', 'P2015.584', 'P2015.586', 'P2015.589', 'P2015.590', 'P2015.591', 'P2015.592', 'P2015.593', 'P2015.596', 'P2015.667', 'P2015.668', 'P2015.669'),
        true,
        false
) AS hasError

FROM ObjectsExport
    WHERE DateOFCreation IS NOT NULL
  GROUP BY DateOfCreation
ORDER BY hasError DESC,  numRecords DESC, DateOfCreation
;

SELECT DateOut from LibraryExport WHERE Notes like '%2013/213%' OR
Notes like '%2013/214%' OR
                                        Notes like '%2013/216%' OR
                                        Notes like '%2013/210%' OR
                                        Notes like '%2013/211%';

SELECT DateReceived from ObjectsExport WHERE Accession_Full_ID = 'P2013.1704';
SELECT ItemDates, EarliestYear, LatestYear from ObjectsExport WHERE Accession_Full_ID IN (
    'P1999.1675copied','P1999.2120copied','P1999.4279copied','P2011.470','P1999.2497copied','P1999.4801copied','P2013.1300'
);
