update author
   set
	vorname = 'Hello World'
 where aid = 1;

update buch
   set
	titel = 'Geänderter Titel'
 where bid = 2;

update buch
   set
	authorid = 1
 where bid = 2;