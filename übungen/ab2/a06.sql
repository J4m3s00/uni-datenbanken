select k2.kid,
       k2.bez as kategorie,
       count(*) as anzahl_bestellungen
  from kategorie k
  join produktkategorie pk
on k.kid = pk.kid
  join produkt p
on pk.pid = p.pid
  join bestellposition bp
on p.pid = bp.pid
  join kategorie k2
on k2.kid = k.oberkategorie
 group by k2.kid,
          k2.bez
having count(*) > 20000
 order by kid;