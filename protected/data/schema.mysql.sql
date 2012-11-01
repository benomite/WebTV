CREATE TABLE lookup
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(128) NOT NULL,
	code INTEGER NOT NULL,
	type VARCHAR(128) NOT NULL,
	position INTEGER NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE tag
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(128) NOT NULL,
	frequency INTEGER DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE program
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(128) NOT NULL,
	description TEXT NOT NULL,
	tags TEXT,
	status INTEGER NOT NULL,
	create_time INTEGER,
	update_time INTEGER,
	author_id INTEGER(10) UNSIGNED NOT NULL,
	CONSTRAINT FK_program_author FOREIGN KEY (author_id)
		REFERENCES user (id) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE episode
(
	id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(128) NOT NULL,
	description TEXT,
	video TEXT NOT NULL,
	status INTEGER NOT NULL,
	create_time INTEGER,
	update_time INTEGER,
	program_id INTEGER NOT NULL,
	CONSTRAINT FK_episode_program FOREIGN KEY (program_id)
		REFERENCES program (id) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE schedule
(
  id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
  episode_id INTEGER NOT NULL,
  broadcast_time INTEGER,
  status INTEGER NOT NULL,
  CONSTRAINT FK_schedule_episode FOREIGN KEY (episode_id)
      REFERENCES episode (id) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO lookup (name, type, code, position) VALUES ('Project', 'ProgramStatus', 1, 1);
INSERT INTO lookup (name, type, code, position) VALUES ('Online', 'ProgramStatus', 2, 2);
INSERT INTO lookup (name, type, code, position) VALUES ('Archived', 'ProgramStatus', 3, 3);
INSERT INTO lookup (name, type, code, position) VALUES ('Project', 'EpisodeStatus', 1, 1);
INSERT INTO lookup (name, type, code, position) VALUES ('Online', 'EpisodeStatus', 2, 2);
INSERT INTO lookup (name, type, code, position) VALUES ('New', 'ScheduleStatus', 1, 1);
INSERT INTO lookup (name, type, code, position) VALUES ('Rebroadcast', 'ScheduleStatus', 2, 2);