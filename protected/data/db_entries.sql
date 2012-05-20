INSERT INTO tbl_user (username, password, email) VALUES ('admin', 'admin', 'admin@example.com');

INSERT INTO Artist( name, description, creationDate, lastUpdate ) 
VALUES ('KarlCox', 'J\'ai toujours dominé la scène électro internationale', NULL , NULL
), ('Créativ01', 'artiste fou, peintures pas chères', NULL , NULL);

INSERT INTO Image( path, name, description, creationDate, lastUpdate, artist_id ) 
VALUES ('path', 'in the air', 'cover album in the air', NULL , NULL , 1
), ('path', 'Un homme à la mer', 'peinture 12$', NULL , NULL , 2
), ('path', 'Un homme libre', 'peinture 11$', NULL , NULL , 2
);

INSERT INTO Audio( url, name, description, creationDate, lastUpdate, artist_id ) 
VALUES ('path', 'contest1', 'song no1', NULL , NULL , 1
), ('path', 'hardTech', 'song no2', NULL , NULL , 1
);

INSERT INTO Playlist( name, description, mediaType, creationDate, lastUpdate, image_id, artist_id ) 
VALUES ('In the Air Album', 'album playlist', 'AUDIO', NULL , NULL , 1, 1
), ('peintures diverses', NULL , 'IMAGE', NULL , NULL , 2, 1
)
