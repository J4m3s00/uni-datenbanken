select pid,
       betrag
  from preis
 where plid = 1
   and betrag > 70
 order by betrag;