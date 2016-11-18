# Box Type must be no more than 30 characters long
SELECT MAX(LENGTH(BoxType)) from ObjectsExport;
# Was: 30 updated to 255
# Result: 52
SELECT count(*) from ObjectsExport WHERE length(BoxType) > 30;
# Result: 425

# Other Number must be no more than 30 characters long
SELECT MAX(LENGTH(OtherNum)) FROM ObjectsExport;
# Was 30 updated to 255
# Result: 54
SELECT count(*) from ObjectsExport WHERE LENGTH(OtherNum) > 30;
# Result: 5

# Recommendation must be no more than 255 characters long
SELECT MAX(LENGTH(Recommendations)) from ObjectsExport;
# Was 255 updated to 1023
# Result 262
SELECT COUNT(*) from ObjectsExport WHERE  LENGTH(Recommendations) > 255;
# Result 1


# Could not add intrinsic  to ca_objects: surveyed By must be no more than 30 characters long
SELECT max(length(ConditionSurveyedBy)) from ObjectsExport;
# Was 30 updated to 255
# Result 33
SELECT count(*) from ObjectsExport WHERE LENGTH(ConditionSurveyedBy) > 30;
# Result 1

#Collation (Physical Description) must be no more than 100 characters long
SELECT MAX(LENGTH(Collation)) from LibraryExport;
# Was 100 updated to 255
# Result 238
SELECT COUNT(*) from LibraryExport WHERE LENGTH(Collation) > 100;
# Result 17

# Copy Number must be no more than 5 characters long
SELECT max(LENGTH(CopyNo)) from LibraryExport;
# Was 5 updated to 64
# result 17
SELECT count(*) FROM LibraryExport WHERE length(CopyNo) > 5;
# Result 142

SELECT MAX(LENGTH(Review)) from LibraryExport;
# Result: 333
# Was 255 updated to 1023
SELECT count(*) from LibraryExport WHERE LENGTH(Review) > 255;
# Result : 3
# Invalid Review; values were Review = Newsletter RWAHS, Vol. 12, no. 3, April 1973 p. 8/R.P.W.also review newsletter Vol 13 no. 10 Nov/Dec, 1974 p. 6, review Vol. 3 RWAHS newsletter Vol 8, no. 4, p. 5/E.S.W. review Vol. 17  History West Vol. 47, no. 2 March 2008 p.5/Anne Rogers
# Invalid Review; values were Review = of 'Per Ardua'; ''Moonda''; ''The Seabrooks and the Robinsons''; ''Old Brookton Flour Mill''; draft of ''Pompiya and Kouok''; ''Pompiya and Kouok'', ''Memoirs of Wade, William''; Bates, Daisy; Sir Rason, Cornthwaite Hector; Mattinson, J. A.; Yule, Thomas; interview with Bateman, Topsy  (Accession no. 1996.54a-j)
# Invalid Review; values were Review = RWAHS newsletter, Vol.27, no.2, March 1988, p.8Accession number HS PR/795

# ISBN/ISSN must be no more than 13 characters long
SELECT max(length(ISBN)) FROM LibraryExport;
# Result 16
# Was 13 updated to 24
SELECT count(*) from LibraryExport WHERE LENGTH(ISBN) > 13;
# Result 1


# Size must be no more than 20 characters long
SELECT MAX(LENGTH(Size)) FROM LibraryExport ;
# Result 39
# Was 20 now 64
SELECT COUNT(*) from LibraryExport WHERE LENGTH(Size) > 20;
# Result 226


# update library export mapping
/*
Could not set preferred label for entity Access to these Private Papers is restricted. For further information please contact the RWAHS Library. Seabrook, Jack; ''Undercliffe: Home and Hospital''; Miles, Norma; ''John Seabrook of Brookton House''; ''Memoirs' an autobiography by Leggoe, John; ''Woodich''; Bussell, Bessie, ''So Harsh their Land'', Monger, Peter; review of 'Per Ardua'; ''Moonda''; ''The Seabrooks and the Robinsons''; ''Old Brookton Flour Mill''; draft of ''Pompiya and Kouok''; ''Pompiya and Kouok'', ''Memoirs of Wade, William''; Bates, Daisy; Sir Rason, Cornthwaite Hector; Mattinson, J. A.; Yule, Thomas; interview with Bateman, Topsy (Accession no. 1996.54a-j) Donor: A. Lendall: Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Accession no: 2012/130 Donor Booksale. Cover 'Your guide to a complete South West and W.A. experience. Inset maps, scenic drives, town maps, detailed road atlas, must-see attractions': Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Accession no: 2012/85. Donor: P. McGowan. Veronica McGowan reviewed her mother's (Ellen Stokes) oral history tapes and family memories.: Forename must not be more than 100 characters long
Could not set preferred label for entity Accession No: 2013/17 Donor: Lyall Hunt. International series. Topographic Series Stations marked and Index to adjoining maps. Prepared by the Chief Draughtsman's Branch, Dept of Lands and Surveys..: Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Accession no: 2013/252. Donor: A. White This book accompanies Author's Private Papers held in Library. Illustrated by William Boissevain. Access to these Private Papers is restricted. For further information please contact the RWAHS Library: Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Accession No: 2015/18, Donor: Lindsay Peet Estate. Locality map. Red & white col. Lot numbers and sized marked. Divided by South Western Railway & Cannington Station. Bounded by Renou St., Charlotte & Gerard Sts., Morgan St. and Grey St. Note: For Main Road and River Frontages obtain No 1 Map.: Forename must not be more than 100 characters long
Could not set preferred label for entity Accession no: 2015/6. Donor: Estate of Lindsay Peet. Chart on card to hang in office (with pink string). Star with five points : Peets Popular Property Purchase Plan and motto Terram Vendimus. Map has been copied to CD 91: Forename must not be more than 100 characters long
Could not set preferred label for entity Accession no: 2016 / 54. Donor; Estate of G.C. Bolton. : Ex Libris G.C.Bolton. Series. Australia in the war of 1939 - 1945, Series 4 (Civil) (iv): Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Accession no: 2016 / 55. Donor; Estate of G.C. Bolton. : Ex Libris G.C.BoltonSeries. Australia in the war of 1939 - 1945, Series 4 Civil (III): Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Accession no.: 2016/24 Donor: Winsome Sutton E. Keatch was a booking clerk to District Superintendent, Railways at Geraldton in 1917: Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Includes transcript of an interview with B.K. Thompson & Julie & Joe Cameron; scrapbook of cuttings, photographs, cards, certificates relating to BK.B. Thompson & family & friends; CD entitles Ken's story; 7 Masonic certificates & a small photographs album. Donor: Robin Faulkner (nee South) Access to these Private Papers is restricted. For further information please contact the RWAHS Library.: Surname/organisation must not be more than 100 characters long
Could not set preferred label for entity Library has Vols 1-16; index and biographical register. A. N. 86.133. Donor: Melbourne University Press Library has supplement (1580-1980). Library has Vols. 1-17. Vol.17 is A-K 1981-1990. Vol. 18 is L-Z 1981-1990. Vol. 4 - review: Newsletter RWAHS, Vol. 12, no. 3, April 1973 p. 8/R.P.W.also review newsletter Vol 13 no. 10 Nov/Dec, 1974 p. 6, review Vol. 3 RWAHS newsletter Vol 8, no. 4, p. 5/E.S.W. review Vol. 17 History West Vol. 47, no. 2 March 2008 p.5/Anne Rogers Volume 6 - Review: Newsletter RWAHS, Vol. 16, No. 1 Feb. 1977, p. 7 / A E Williams.: Surname/organisation must not be more than 100 characters long
*/

SELECT l.LegacyID, l.Title as name
from LibraryExport l WHERE l.Donor IN (
    "Access to these Private Papers is restricted. For further information please contact the RWAHS Library. Seabrook, Jack; ''Undercliffe: Home and Hospital''; Miles, Norma; ''John Seabrook of Brookton House''; ''Memoirs' an autobiography by Leggoe, John; ''Woodich''; Bussell, Bessie, ''So Harsh their Land'', Monger, Peter; review of 'Per Ardua'; ''Moonda''; ''The Seabrooks and the Robinsons''; ''Old Brookton Flour Mill''; draft of ''Pompiya and Kouok''; ''Pompiya and Kouok'', ''Memoirs of Wade, William''; Bates, Daisy; Sir Rason, Cornthwaite Hector; Mattinson, J. A.; Yule, Thomas; interview with Bateman, Topsy (Accession no. 1996.54a-j) Donor: A. Lendall",
    "Accession no: 2012/130 Donor Booksale. Cover 'Your guide to a complete South West and W.A. experience. Inset maps, scenic drives, town maps, detailed road atlas, must-see attractions'",
    "Accession no: 2012/85. Donor: P. McGowan. Veronica McGowan reviewed her mother's (Ellen Stokes) oral history tapes and family memories.",
    "Accession No: 2013/17 Donor: Lyall Hunt. International series. Topographic Series Stations marked and Index to adjoining maps. Prepared by the Chief Draughtsman's Branch, Dept of Lands and Surveys..",
    "Accession no: 2013/252. Donor: A. White This book accompanies Author's Private Papers held in Library. Illustrated by William Boissevain. Access to these Private Papers is restricted. For further information please contact the RWAHS Library",
    "Accession No: 2015/18, Donor: Lindsay Peet Estate. Locality map. Red & white col. Lot numbers and sized marked. Divided by South Western Railway & Cannington Station. Bounded by Renou St., Charlotte & Gerard Sts., Morgan St. and Grey St. Note: For Main Road and River Frontages obtain No 1 Map.",
    "Accession no: 2015/6. Donor: Estate of Lindsay Peet. Chart on card to hang in office (with pink string). Star with five points : Peets Popular Property Purchase Plan and motto Terram Vendimus. Map has been copied to CD 91",
    "Accession no: 2016 / 54. Donor; Estate of G.C. Bolton. : Ex Libris G.C.Bolton. Series. Australia in the war of 1939 - 1945, Series 4 (Civil) (iv)",
    "Accession no: 2016 / 55. Donor; Estate of G.C. Bolton. : Ex Libris G.C.BoltonSeries. Australia in the war of 1939 - 1945, Series 4 Civil (III)",
    "Accession no.: 2016/24 Donor: Winsome Sutton E. Keatch was a booking clerk to District Superintendent, Railways at Geraldton in 1917",
    "Includes transcript of an interview with B.K. Thompson & Julie & Joe Cameron; scrapbook of cuttings, photographs, cards, certificates relating to BK.B. Thompson & family & friends; CD entitles Ken's story; 7 Masonic certificates & a small photographs album. Donor: Robin Faulkner (nee South) Access to these Private Papers is restricted. For further information please contact the RWAHS Library.",
    "Library has Vols 1-16; index and biographical register. A. N. 86.133. Donor: Melbourne University Press Library has supplement (1580-1980). Library has Vols. 1-17. Vol.17 is A-K 1981-1990. Vol. 18 is L-Z 1981-1990. Vol. 4 - review: Newsletter RWAHS, Vol. 12, no. 3, April 1973 p. 8/R.P.W.also review newsletter Vol 13 no. 10 Nov/Dec, 1974 p. 6, review Vol. 3 RWAHS newsletter Vol 8, no. 4, p. 5/E.S.W. review Vol. 17 History West Vol. 47, no. 2 March 2008 p.5/Anne Rogers Volume 6 - Review: Newsletter RWAHS, Vol. 16, No. 1 Feb. 1977, p. 7 / A E Williams."
);
# Date Of Publication is invalid

# Could not add intrinsic  to ca_objects: Date Received is invalid

# Could not add intrinsic  to ca_objects: Earliest Year is invalid; Latest Year is invalid

# Box Type must be no more than 30 characters long; Date Of Creation is invalid
# Date of creation is invalid
# 1 Record
# Date Of Creation is invalid
# 418 Records

#Copy Number must be no more than 5 characters long; Date Of Publication is invalid
# 1 Record
# Date Of Publication is invalid
# 2 Records

# Date Out is invalid
# 6 Records

# Duplicate images - no need to import - due to overlap with existing data import
/*Could not add related object representation with: Duplicate entry '16026-4296' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '16028-4297' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '16029-4298' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '16030-4299' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '16031-4300' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '16032-4301' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '4613-4295' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5296-4273' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5297-4274' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5299-4277' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5300-4278' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5301-4279' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5304-4286' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5306-4289' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5307-4290' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5308-4291' for key 'u_all' [251]
Could not add related object representation with: Duplicate entry '5309-4292' for key 'u_all' [251]
*/
# log_2016-08-07.txt:2016-08-07 20:56:22 - ERROR --> Could not insert object representation CULHAM HOUSE, TOODYAY: File could not be copied for media; can't convert mimetype 'application/pdf' to extension
# 1 Record
# No media was specified
# 93 Records

# Type must be specified
# 106 Records

# Unknown file type not accepted by media
# 402 Records
