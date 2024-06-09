select extract(year from b.bestelldatum) as jahr,
       k.bez as kategorie,
       to_char(
	       sum(gesamtpreis),
	       '9G999G999D99'
       ) as umsatz
  from bestellung b
  join bestellposition bp
on bp.bid = b.bid
  join produkt p
on p.pid = bp.pid
  join produktkategorie pk
on pk.pid = p.pid
  join kategorie k
on k.kid = pk.kid
 where extract(year from b.bestelldatum) in ( '2018',
                                              '2019' )
   and pk.hk = 'J'
 group by extract(year from b.bestelldatum),
          k.bez
 order by extract(year from b.bestelldatum),
          k.bez;