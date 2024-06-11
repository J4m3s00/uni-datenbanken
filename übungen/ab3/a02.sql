CREATE TABLE Fachbereich (
    FBID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL
);

CREATE TABLE Studiengang (
    SGID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL,
    FBID INT,
    FOREIGN KEY (FBID) REFERENCES Fachbereich(FBID)
);

CREATE TABLE Studienordnung (
    SOID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL,
    SGID INT,
    FOREIGN KEY (SGID) REFERENCES Studiengang(SGID)
);

CREATE TABLE ModulStudienordnung (
    MSOID INT PRIMARY KEY,
    SOID INT,
    MID INT,
    FOREIGN KEY (SOID) REFERENCES Studienordnung(SOID),
    FOREIGN KEY (MID) REFERENCES Modul(MID)
);


-- Insert data into Fachbereich
INSERT INTO Fachbereich (FBID, Bez)
VALUES (1, 'Informatik');

-- Insert data into Studiengang
INSERT INTO Studiengang (SGID, Bez, FBID)
VALUES (1, 'Wirtschaftsinformatik', 1);

-- Insert data into Studienordnung
INSERT INTO Studienordnung (SOID, Bez, SGID)
VALUES (1, 'Wirtschaftsinformatik PO 2022', 1);

-- Insert data into ModulStudienordnung
INSERT INTO ModulStudienordnung (MSOID, SOID, MID)
VALUES 
(1, 1, 1); 

