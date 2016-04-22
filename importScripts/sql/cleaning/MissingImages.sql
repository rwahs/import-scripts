SELECT o.* from ObjectsImagesExport o LEFT JOIN MediaDirectoryListing m ON (m.FileName = o.ImagePath) WHERE m.FileName is NULL ;
