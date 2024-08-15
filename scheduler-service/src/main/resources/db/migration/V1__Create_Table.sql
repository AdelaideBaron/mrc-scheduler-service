CREATE TABLE rowers
(
    rower_id   INT AUTO_INCREMENT PRIMARY KEY,
    rower_name VARCHAR(55) NOT NULL
);

CREATE TABLE sessions
(
    session_id   INT AUTO_INCREMENT PRIMARY KEY,
    day          VARCHAR(10) NOT NULL,
    start_time   TIME        NOT NULL,
    end_time     TIME        NOT NULL,
    squad        ENUM('WOMENS', 'DEVELOPMENT', 'MENS') NOT NULL,
    level        ENUM('DEVELOPMENT', 'NOVICE', 'INTERMEDIATE', 'SENIOR') NOT NULL,
    session_type ENUM('WATER', 'ERG', 'OTHER') NOT NULL
);

CREATE TABLE upcoming_sessions
(
    upcoming_session_id INT AUTO_INCREMENT PRIMARY KEY,
    session_id          INT  NOT NULL,
    date                DATE NOT NULL,
    CONSTRAINT FK_sessions FOREIGN KEY (session_id) REFERENCES sessions (session_id)
);

CREATE TABLE upcoming_session_availability
(
    id                  INT AUTO_INCREMENT PRIMARY KEY,
    upcoming_session_id INT NOT NULL,
    rower_id            INT NOT NULL,
    CONSTRAINT FK_upcoming_sessions FOREIGN KEY (upcoming_session_id) REFERENCES upcoming_sessions (upcoming_session_id),
    CONSTRAINT FK_rowers_session_availability FOREIGN KEY (rower_id) REFERENCES rowers (rower_id)

);
