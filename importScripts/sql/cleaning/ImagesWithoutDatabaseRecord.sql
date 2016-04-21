SELECT m.* from ObjectsImagesExport o RIGHT JOIN MediaDirectoryListing m ON (MD5(m.FileName) = MD5(o.ImagePath)) WHERE o.ObjectsImagesID is NULL ;
SELECT m.* from MediaDirectoryListing m LEFT JOIN ObjectsImagesExport o ON (m.FileName = o.ImagePath) WHERE o.ObjectsImagesID is NULL ;
