drop table buch;
drop table author;


create table author (
    aid     number not null,
    vorname varchar2(50) not null,
    verlag  varchar2(50) not null,
    primary key ( aid )
);
create table buch (
    bid      number not null,
    titel    varchar2(100),
    authorid number not null,
    primary key ( bid ),
    foreign key ( authorid )
        references author ( aid )
            on delete cascade
);