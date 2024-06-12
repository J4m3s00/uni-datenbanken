CREATE TABLE Semester (
    SID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL,
    Beginn DATE NOT NULL,
    Ende DATE NOT NULL,
    VLBeginn DATE NOT NULL,
    VLEnde DATE NOT NULL
);

CREATE TABLE Modulart (
    MAID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL,
    Aktiv BOOLEAN NOT NULL,
    LfdNr INT NOT NULL
);

CREATE TABLE Modul (
    MID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL,
    CP INT NOT NULL,
    Regelsemester INT NOT NULL,
    MAID INT,
    FOREIGN KEY (MAID) REFERENCES Modulart(MAID)
);

CREATE TABLE ModulBTArt (
    MBAID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL,
    Aktiv BOOLEAN NOT NULL,
    LfdNr INT NOT NULL
);

CREATE TABLE ModulBT (
    MBTID INT PRIMARY KEY,
    SWS INT NOT NULL,
    MID INT,
    MBAID INT,
    FOREIGN KEY (MID) REFERENCES Modul(MID),
    FOREIGN KEY (MBAID) REFERENCES ModulBTArt(MBAID)
);


CREATE TABLE Kurs (
    KID INT PRIMARY KEY,
    SID INT,
    MID INT,
    FOREIGN KEY (SID) REFERENCES Semester(SID),
    FOREIGN KEY (MID) REFERENCES Modul(MID)
);

CREATE TABLE Raum (
    RID INT PRIMARY KEY,
    RaumNr VARCHAR(255) NOT NULL
);

CREATE TABLE Terminart (
    TAID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL
);

CREATE TABLE Termin (
    TID INT PRIMARY KEY,
    TAID INT,
    FOREIGN KEY (TAID) REFERENCES Terminart(TAID)
);

CREATE TABLE Einzeltermin (
    ETID INT PRIMARY KEY,
    TID INT,
    DatumUhrzeitVon DATE NOT NULL,
    DatumUhrzeitBis DATE NOT NULL,
    FOREIGN KEY (TID) REFERENCES Termin(TID)
);

CREATE TABLE Zeitblock (
    ZBID INT PRIMARY KEY,
    UhrzeitVon DATE NOT NULL,
    UhrzeitBis DATE NOT NULL
);

CREATE TABLE Tag (
    TAGID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL
);

CREATE TABLE Wochentermin (
    TID INT PRIMARY KEY,
    ZBID INT,
    TAGID INT,
    FOREIGN KEY (TID) REFERENCES Termin(TID),
    FOREIGN KEY (ZBID) REFERENCES Zeitblock(ZBID),
    FOREIGN KEY (TAGID) REFERENCES Tag(TAGID)
);



CREATE TABLE KursBT (
    KBTID INT PRIMARY KEY,
    KID INT,
    MBTID INT,
    RID INT,
    TID INT,
    FOREIGN KEY (KID) REFERENCES Kurs(KID),
    FOREIGN KEY (MBTID) REFERENCES ModulBT(MBTID),
    FOREIGN KEY (RID) REFERENCES Raum(RID),
    FOREIGN KEY (TID) REFERENCES Termin(TID)
);

CREATE TABLE Person (
    PID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Rolle (
    RID INT PRIMARY KEY,
    Bez VARCHAR(255) NOT NULL
);

CREATE TABLE Personenrolle (
    PRID INT PRIMARY KEY,
    PID INT,
    RID INT,
    DatumBeginn DATE NOT NULL,
    DatumEnde DATE,
    FOREIGN KEY (PID) REFERENCES Person(PID),
    FOREIGN KEY (RID) REFERENCES Rolle(RID)
);

CREATE TABLE StudentIn (
    PRID INT PRIMARY KEY,
    MatrNr VARCHAR(50) NOT NULL,
    FOREIGN KEY (PRID) REFERENCES Personenrolle(PRID)
);


CREATE TABLE Lehrperson (
    PRID INT PRIMARY KEY,
    Steuernummer VARCHAR(50) NOT NULL,
    FOREIGN KEY (PRID) REFERENCES Personenrolle(PRID)
);

CREATE TABLE Sonstige (
    PRID INT PRIMARY KEY,
    -- Additional attributes here
    FOREIGN KEY (PRID) REFERENCES Personenrolle(PRID)
);


