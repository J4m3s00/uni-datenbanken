select lpad(
	' ',
	ebene * 4
)
       || bez as produktkategorie
  from kategorie
 order by kid;