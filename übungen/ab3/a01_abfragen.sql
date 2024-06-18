select kursbt.kbtid,
       semester.bez,
       modul.bez,
       modulart.bez,
       modulbt.sws,
       modulbtart.bez,
       raum.raumnr,
       tag.bez as Wochentag,
       to_char(
          zeitblock.uhrzeitvon,
          'HH24:MI'
        ) as Uhrzeitvon,
        to_char(
          zeitblock.uhrzeitbis,
          'HH24:MI'
        ) as Uhrzeitbis,
       count(studentin.stuid) as anzahl
  from kursbt
  join modulbt
on kursbt.mbtid = modulbt.mbtid
  join modulbtart
on modulbt.mbaid = modulbtart.mbaid
  join studentinkurs
on kursbt.kbtid = studentinkurs.kbtid
  join studentin
on studentin.stuid = studentinkurs.stuid
  join kurs
on kurs.kid = kursbt.kid
  join semester
on semester.sid = kurs.sid
  join modul
on modul.mid = modulbt.mid
  join modulart
on modul.maid = modulart.maid
  join raum
on raum.rid = kursbt.rid
-- Get termin
left join EINZELTERMIN on kursbt.tid = einzeltermin.tid
left join wochentermin on wochentermin.tid = kursbt.tid
left join tag on tag.tagid = wochentermin.tagid
left join zeitblock on zeitblock.zbid = wochentermin.zbid
 group by kursbt.kbtid,
          semester.bez,
          modul.bez,
          modulart.bez,
          modulbt.sws,
          modulbtart.bez,
          raum.raumnr,
          tag.bez,
          to_char(
	          zeitblock.uhrzeitvon,
	          'HH24:MI'
          ),
          to_char(
	          zeitblock.uhrzeitbis,
	          'HH24:MI'
          );

select kursbt.kbtid,
       semester.bez as semester,
       modul.bez as modulebezeichnung,
       modulart.bez as moduleartbez,
       modulbtart.bez,
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
       count(distinct studentin.stuid) as anzahl
  from kursbt
  join kurs
on kursbt.kid = kurs.kid
  join modul
on kurs.mid = modul.mid
  join modulart
on modul.maid = modulart.maid
  join modulbt
on kursbt.mbtid = modulbt.mbtid
  join modulbtart
on modulbt.mbaid = modulbtart.mbaid
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
on kursbt.kbtid = studentinkurs.kbtid
  join studentin
on studentinkurs.stuid = studentin.stuid
 group by kursbt.kbtid,
          semester.bez,
          modul.bez,
          modulbtart.bez,
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