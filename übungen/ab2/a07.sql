select extract(year from b.bestelldatum) as jahr,
       extract(month from b.bestelldatum) as monat,
       to_char(
	       sum(b.gesamtpreis),
	       '999G999D99'
       ) as umsatz
  from verkaufsgebiet vg
  join kunde k
on vg.vgid = k.vgid
  join verkaufsgebiet vg2
on vg.obergebiet = vg2.vgid
  join bestellung b
on b.kid = k.kid
 where vg2.bez = 'Nordwest'
   and extract(year from b.bestelldatum) = '2019'
 group by extract(year from b.bestelldatum),
          extract(month from b.bestelldatum)
 order by umsatz desc;