SELECT m.* from MediaDirectoryListing m LEFT JOIN ObjectsImagesExport o ON (m.FileName = o.ImagePath) WHERE o.ObjectsImagesID is NULL ;
