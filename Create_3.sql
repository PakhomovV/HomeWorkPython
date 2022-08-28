drop table album_musician cascade

drop table album_name cascade

drop table musician_name  cascade

drop table musical_genres cascade

drop table musician_genres  cascade

drop table track_collection cascade

drop table track_name cascade

drop table collection_name cascade

create table musical_genres(
id_genres serial primary key,
genrec_name varchar (100) not null UNIQUE );

create table album_name(
id_album serial primary key,
album_name varchar (100) not null,
year  int2 not null CHECK (year >= 1900));

create table track_name(
id_track serial primary key,
id_album int not null,
track_name varchar (100) not null,
leght_sec int not null CHECK (leght_sec > 2),
foreign key (id_album) references album_name (id_album));

create table musician_name(
id_musician serial primary key,
musician_name varchar (100) not null,
musician_nickname varchar (100) not null UNIQUE);

create table collection_name(
id_collection serial primary key,
collection_name varchar (100) not null,
year int2 not null CHECK (year >= 1900) );

create table track_collection(
primary key (id_collection, id_track),
id_collection int,
id_track int,
foreign key (id_collection) references collection_name (id_collection),
foreign key (id_track) references track_name (id_track));

create table musician_genres(
primary key (id_musician, id_genres),
id_musician int,
id_genres int,
foreign key (id_musician) references musician_name (id_musician),
foreign key (id_genres) references musical_genres (id_genres));

create table album_musician(
primary key (id_album, id_musician),
id_album int,
id_musician int,
foreign key (id_album) references album_name (id_album),
foreign key (id_musician) references musician_name (id_musician));


