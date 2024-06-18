select matrnr as matrikelnr,
       person.name,
       personenrolle.datumbeginn,
       personenrolle.datumende,
       rolle.bez,
       null as stuernummer
  from studentin
  join personenrolle
on personenrolle.prid = studentin.prid
  join person
on person.pid = personenrolle.pid
  join rolle
on rolle.rid = personenrolle.rid
union
select null,
       person.name,
       personenrolle.datumbeginn,
       personenrolle.datumende,
       rolle.bez,
       lehrperson.steuernummer
  from lehrperson
  join personenrolle
on personenrolle.prid = lehrperson.prid
  join person
on person.pid = personenrolle.pid
  join rolle
on rolle.rid = personenrolle.rid;