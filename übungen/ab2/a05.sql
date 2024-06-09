select p.pid,
       p.bez
  from produkt p
  left join bestellposition bp
on p.pid = bp.pid
 where bp.pid is null
 order by p.pid;