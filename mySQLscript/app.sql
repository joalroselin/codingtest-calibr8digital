CREATE DATABASE db;
USE db;
CREATE TABLE users
(
    Userid SMALLINT PRIMARY KEY NOT NULL,
    LastName CHAR(20) NOT NULL,
    FirstName CHAR(20) NOT NULL,
    Age SMALLINT NOT NULL,
    PRIMARY KEY (Userid, FirstName)
);

CREATE TABLE job_positions
(
    Jobid SMALLINT NOT NULL PRIMARY KEY,
    jobPosition CHAR(20) NOT NULL,
    PRIMARY KEY (Jobid),
    FOREIGN KEY (Userid)
        REFERENCES users (userid)
);

INSERT INTO users(Userid, FirstName, LastName, Age)
VALUES 
    (1, 'Marco', 'Sy', 25),
    (2, 'Denise', 'Pangilinan',28),
    (3, 'Dion', 'Gomez', 23);

SELECT * FROM users ORDER BY Age, LastName;
UPDATE users
SET FirstName = 'Kath'
WHERE FirstName = 'Dion';

DELETE FROM users
WHERE Userid = 3;

SELECT users.Userid, users.FirstName
FROM users
LEFT JOIN job_positions
ON users.userid = job_positions.userid;
