-- Belegungen
CREATE TABLE Belegungen (
    BelegungID INT PRIMARY KEY,
    Priorität INT,
    Status VARCHAR(50),
    StudierendenID INT,
    KursID INT,
    FOREIGN KEY (StudierendenID) REFERENCES StudentIn(STUID),
    FOREIGN KEY (KursID) REFERENCES Kurs(KID)
);

-- Klausuren
CREATE TABLE Klausuren (
    KlausurID INT PRIMARY KEY,
    ModulID INT,
    Zeitpunkt DATE,
    Anmeldung BOOLEAN,
    FOREIGN KEY (ModulID) REFERENCES Modul(MID)
);

-- Noten
CREATE TABLE Noten (
    KlausurID INT,
    StudierendenID INT,
    Note DECIMAL(3, 1),
    Versuch INT,
    LehrpersonID INT,
    FOREIGN KEY (KlausurID) REFERENCES Klausuren(KlausurID),
    FOREIGN KEY (StudierendenID) REFERENCES StudentIn(STUID),
    FOREIGN KEY (LehrpersonID) REFERENCES Lehrperson(LID)
);

-- Insert data into Belegungen
INSERT INTO Belegungen (BelegungID, Priorität, Status, StudierendenID, KursID)
VALUES (1, 1, 'Angenommen', 3, 1),
       (2, 2, 'Abgelehnt', 4, 1);

-- Insert data into Klausuren
INSERT INTO Klausuren (KlausurID, ModulID, Zeitpunkt, Anmeldung)
VALUES (1, 1, '2024-06-30 09:00:00', TRUE),
       (2, 2, '2024-09-26 09:45:00', FALSE);

-- Insert data into Noten
INSERT INTO Noten (KlausurID, StudierendenID, Note, Versuch, LehrpersonID)
VALUES (1, 3, 5.0, 1, 1),
       (2, 3, 3.5, 2, 1),
       (1, 4, 2.0, 1, 2);
