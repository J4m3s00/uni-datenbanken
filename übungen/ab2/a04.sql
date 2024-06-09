select e1.bez as ebene1,
       e2.bez as ebene2,
       e3.bez as ebene3,
       e4.bez as ebene4
  from verkaufsgebiet e1
  left join verkaufsgebiet e2
on e1.vgid = e2.obergebiet
  left join verkaufsgebiet e3
on e2.vgid = e3.obergebiet
  left join verkaufsgebiet e4
on e3.vgid = e4.obergebiet
 where e1.ebene = 1
 order by e1.vgid,
          e2.vgid,
          e3.vgid,
          e4.vgid;