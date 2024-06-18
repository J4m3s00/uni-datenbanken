-- Insert data into Semester
INSERT INTO Semester (SID, Bez, Beginn, Ende, VLBeginn, VLEnde) 
VALUES (1, 'SoSe 2024', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'));

-- Insert data into Modulart
INSERT INTO Modulart (MAID, Bez, Aktiv, LfdNr)
VALUES (1, 'Pflichtmodul', TRUE, 1);

-- Insert data into Modul
INSERT INTO Modul (MID, Bez, CP, Regelsemester, MAID)
VALUES (1, 'Datenmodellierung und Datenbanksysteme', 5, 2, 1);

-- Insert data into ModulBTArt
INSERT INTO ModulBTArt (MBAID, Bez, Aktiv, LfdNr)
VALUES (1, 'SL', TRUE, 1), (2, 'PCÜ', TRUE, 2);

-- Insert data into ModulBT
INSERT INTO ModulBT (MBTID, SWS, MID, MBAID)
VALUES (1, 2, 1, 1), (2, 2, 1, 2);

-- Insert data into Kurs
INSERT INTO Kurs (KID, SID, MID)
VALUES (1, 1, 1);

-- Insert data into Raum
INSERT INTO Raum (RID, RaumNr)
VALUES (1, '029'), (2, '214');

-- Insert data into Terminart
INSERT INTO Terminart (TAID, Bez)
VALUES (1, 'Vorlesung'), (2, 'Übung');

-- Insert data into Termin
INSERT INTO Termin (TID, TAID)
VALUES (1, 1), 
       (2, 2), 
       (3, 2),
       (4, 2),
       (5, 2),
       (6, 2);


-- Insert data into Einzeltermin
INSERT INTO Einzeltermin (ETID, TID, DatumUhrzeitVon, DatumUhrzeitBis)
VALUES (1, 3, TO_DATE('2024-04-01 09:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-01 11:45', 'YYYY-MM-DD HH24:MI')), 
       (2, 4, TO_DATE('2024-04-01 12:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-01 13:30', 'YYYY-MM-DD HH24:MI')),
       (3, 5, TO_DATE('2024-04-01 14:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-01 15:30', 'YYYY-MM-DD HH24:MI'));

-- Insert data into Zeitblock
INSERT INTO Zeitblock (ZBID, UhrzeitVon, UhrzeitBis)
VALUES (1, TO_DATE('09:45', 'HH24:MI'), TO_DATE('11:15', 'HH24:MI')), 
       (2, TO_DATE('12:00', 'HH24:MI'), TO_DATE('13:30', 'HH24:MI'));

-- Insert data into Tag
INSERT INTO Tag (TAGID, Bez)
VALUES (1, 'Mittwoch'), (2, 'Mittwoch');

-- Insert data into Wochentermin
INSERT INTO Wochentermin (TID, ZBID, TAGID)
VALUES (1, 1, 1), 
       (2, 2, 2);


-- Insert data into Person
INSERT INTO Person (PID, Name)
VALUES (1, 'Müller'), (2, 'Schmidt'), (3, 'Heinrich'), (4, 'Henry');

-- Insert data into Rolle
INSERT INTO Rolle (RID, Bez)
VALUES (1, 'Lehrperson'), (2, 'Student');

INSERT INTO Personenrolle (PRID, PID, RID, DatumBeginn, DatumEnde)
VALUES 
(1, 1, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')), 
(2, 2, 1, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')), 
(3, 3, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')), 
(4, 4, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'));

-- Insert data into StudentIn
INSERT INTO StudentIn (STUID, PRID, MatrNr)
VALUES 
(1, 3, 's0586296'), 
(2, 4, 's0653829'),
(3, 3, 's0753529'),
(4, 4, 's0854829'),
(5, 3, 's0833829'),
(6, 4, 's0253829');

-- Insert data into Lehrperson
INSERT INTO Lehrperson (LID, PRID, Steuernummer)
VALUES (1, 1, 'ST123456'), (2, 2, 'ST789012');


INSERT INTO Personenrolle (PRID, PID, RID, DatumBeginn, DatumEnde)
VALUES 
(5, 3, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')), -- Student Heinrich (s0586296) to SL
(6, 4, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')); -- Student Henry (s0653829) to SL

-- Assigning students to PCÜ components
INSERT INTO Personenrolle (PRID, PID, RID, DatumBeginn, DatumEnde)
VALUES 
(7, 3, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')), -- Student Heinrich (s0586296) to PCÜ
(8, 4, 2, TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD')); -- Student Henry (s0653829) to PCÜ


-- Insert data into Sonstige
INSERT INTO Sonstige (PRID)
VALUES (5);



-- Insert Kurs
INSERT INTO KursBT (KBTID, KID, MBTID, RID, TID, LID)
VALUES 
(1, 1, 1, 1, 1, 1), 
(2, 1, 1, 1, 2, 2), 
(3, 1, 2, 2, 1, 1), 
(4, 1, 2, 2, 2, 1), 
(5, 1, 2, 2, 3, 2), 
(6, 1, 2, 2, 3, 1);


-- Insert Studentin in kurs
INSERT INTO StudentInKurs (STUID, KBTID) 
VALUES (1, 1), (1, 3), 
       (2, 1), (2, 4), 
       (3, 2), (3, 3),
       (4, 2), (4, 4),
       (5, 5), (5, 6),
       (6, 5), (6, 6);

