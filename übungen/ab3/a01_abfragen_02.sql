SELECT MATRNR as MatrikelNr, PERSON.NAME, PERSONENROLLE.DATUMBEGINN, PERSONENROLLE.DATUMENDE, ROLLE.BEZ, NULL as STUERNUMMER FROM STUDENTIN 
JOIN PERSONENROLLE on PERSONENROLLE.PRID = STUDENTIN.PRID
JOIN PERSON on PERSON.PID = PERSONENROLLE.PID
JOIN ROLLE on ROLLE.RID = PERSONENROLLE.RID
UNION
SELECT NULL, PERSON.NAME, PERSONENROLLE.DATUMBEGINN, PERSONENROLLE.DATUMENDE, ROLLE.BEZ, LEHRPERSON.STEUERNUMMER FROM LEHRPERSON 
JOIN PERSONENROLLE on PERSONENROLLE.PRID = LEHRPERSON.PRID
JOIN PERSON on PERSON.PID = PERSONENROLLE.PID
JOIN ROLLE on ROLLE.RID = PERSONENROLLE.RID;