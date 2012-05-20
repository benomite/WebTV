
-- CREATE DATABASE oparco;


CREATE TABLE `oparco`.User (
    id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(128) NOT NULL,
    password VARCHAR(128) NOT NULL,
    email VARCHAR(128) NOT NULL
);

CREATE TABLE `oparco`.`Artist` (`id` MEDIUMINT UNSIGNED AUTO_INCREMENT ,
`name` VARCHAR( 80 ) NOT NULL ,
`description` VARCHAR( 300 ) NULL ,
`creationDate` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
`lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`isActive` TINYINT( 1 ) DEFAULT 1,
PRIMARY KEY ( `id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `oparco`.`Image` (`id` MEDIUMINT UNSIGNED AUTO_INCREMENT ,
`path` VARCHAR( 150 ) NOT NULL ,
`name` VARCHAR( 80 ) NOT NULL ,
`description` VARCHAR( 300 ) NULL ,
`creationDate` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
`lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`isActive` TINYINT( 1 ) DEFAULT 1,
PRIMARY KEY ( `id` ) ,
`artist_id` MEDIUMINT UNSIGNED NOT NULL ,
KEY `artist_id` ( `artist_id` ) ,
CONSTRAINT `image_artist_id_fk` FOREIGN KEY ( `artist_id` ) REFERENCES `Artist` ( `id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `oparco`.Video(`id` MEDIUMINT UNSIGNED AUTO_INCREMENT ,
`url` VARCHAR( 150 ) NOT NULL ,
`name` VARCHAR( 80 ) NOT NULL ,
`description` VARCHAR( 300 ) NULL ,
`creationDate` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
`lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`isActive` TINYINT( 1 ) DEFAULT 1,
PRIMARY KEY ( `id` ) ,
`artist_id` MEDIUMINT UNSIGNED NOT NULL ,
KEY `artist_id` ( `artist_id` ) ,
CONSTRAINT `video_artist_id_fk` FOREIGN KEY ( `artist_id` ) REFERENCES `Artist` ( `id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `oparco`.`Audio` (`id` MEDIUMINT UNSIGNED AUTO_INCREMENT ,
`url` VARCHAR( 150 ) NOT NULL ,
`name` VARCHAR( 80 ) NOT NULL ,
`description` VARCHAR( 300 ) NULL ,
`creationDate` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
`lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`isActive` TINYINT( 1 ) DEFAULT 1,
PRIMARY KEY ( `id` ) ,
`artist_id` MEDIUMINT UNSIGNED NOT NULL ,
KEY `artist_id` ( `artist_id` ) ,
CONSTRAINT `audio_artist_id_fk` FOREIGN KEY ( `artist_id` ) REFERENCES `Artist` ( `id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `oparco`.`Playlist` (`id` MEDIUMINT UNSIGNED AUTO_INCREMENT ,
PRIMARY KEY ( `id` ) ,
`name` VARCHAR( 80 ) NOT NULL ,
`description` VARCHAR( 300 ) NULL ,
`mediaType` ENUM( 'ALL', 'VIDEO', 'IMAGE', 'AUDIO' ) NOT NULL DEFAULT 'ALL',
`creationDate` TIMESTAMP NOT NULL DEFAULT '0000-00-00 00:00:00',
`lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
`isActive` TINYINT( 1 ) DEFAULT 1,
`image_id` MEDIUMINT UNSIGNED NULL ,
KEY `image_id` ( `image_id` ) ,
CONSTRAINT `playlist_image_id_fk` FOREIGN KEY ( `image_id` ) REFERENCES `Image` ( `id` ) ,
`artist_id` MEDIUMINT UNSIGNED NOT NULL ,
KEY `artist_id` ( `artist_id` ) ,
CONSTRAINT `playlist_artist_id_fk` FOREIGN KEY ( `artist_id` ) REFERENCES `Artist` ( `id` )
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `oparco`.`Playlist_Media` (`id` MEDIUMINT UNSIGNED AUTO_INCREMENT ,
 PRIMARY KEY ( `id` ) ,
`playlist_id` MEDIUMINT UNSIGNED NOT NULL ,
 `image_id` MEDIUMINT UNSIGNED NULL ,
 `audio_id` MEDIUMINT UNSIGNED NULL ,
 `video_id` MEDIUMINT UNSIGNED NULL ,
 KEY `playlist_id` ( `playlist_id` ) ,
 CONSTRAINT `liaison_playlist_id_fk` FOREIGN KEY ( `playlist_id` ) REFERENCES `Playlist` ( `id` ) ,
 KEY `image_id` ( `image_id` ) ,
 CONSTRAINT `liaison_image_id_fk` FOREIGN KEY ( `image_id` ) REFERENCES `Image` ( `id` ) ,
 KEY `audio_id` ( `audio_id` ) ,
 CONSTRAINT `liaison_audio_id_fk` FOREIGN KEY ( `audio_id` ) REFERENCES `Audio` ( `id` ) ,
 KEY `video_id` ( `video_id` ) ,
 CONSTRAINT `liaison_video_id_fk` FOREIGN KEY ( `video_id` ) REFERENCES `Video` ( `id` ) 
) ENGINE = INNODB DEFAULT CHARSET = utf8;



