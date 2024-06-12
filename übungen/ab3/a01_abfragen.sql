select semester.bez as semester,
       modul.bez as modulebezeichnung,
       modulart.bez as moduleartbez,
       modulbt.sws as sws,
       raum.raumnr as raum,
       terminart.bez as terminart,
       tag.bez as wochentag,
       to_char(
	       zeitblock.uhrzeitvon,
	       'HH24:MI'
       ) as beginn,
       to_char(
	       zeitblock.uhrzeitbis,
	       'HH24:MI'
       ) as end,
       count(DISTINCT studentin.stuid) as anzahl
  from kursbt
  join kurs
on kursbt.kid = kurs.kid
  join modul
on kurs.mid = modul.mid
  join modulart
on modul.maid = modulart.maid
  join modulbt
on kursbt.mbtid = modulbt.mbtid
  join semester
on kurs.sid = semester.sid
  join raum
on kursbt.rid = raum.rid
  join termin
on termin.tid = kursbt.tid
  join terminart
on termin.taid = terminart.taid
  join wochentermin
on wochentermin.tid = termin.tid
  join tag
on tag.tagid = wochentermin.tagid
  join zeitblock
on zeitblock.zbid = wochentermin.zbid
  join studentinkurs
on kursbt.kid = studentinkurs.kid
  join studentin
on studentinkurs.stuid = studentin.stuid
 group by semester.bez,
          modul.bez,
          modulart.bez,
          modulbt.sws,
          raum.raumnr,
          terminart.bez,
          tag.bez,
          to_char(
	          zeitblock.uhrzeitvon,
	          'HH24:MI'
          ),
          to_char(
	          zeitblock.uhrzeitbis,
	          'HH24:MI'
          );