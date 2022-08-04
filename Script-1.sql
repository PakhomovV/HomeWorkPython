create table album_musician(
id_album int,
id_musician int,
foreign key (id_album) references album_name (id_album),
foreign key (id_musician) references musician_name (id_musician));

create table musician_genres(
id_musician int,
id_genres int,
foreign key (id_musician) references musician_name (id_musician),
foreign key (id_genres) references musical_genres (id_genres));

create table track_collection(
id_collection int,
id_track int,
foreign key (id_collection) references collection_name (id_collection),
foreign key (id_track) references track_name (id_track));

create table track_musician(
id_musician int,
id_track int,
foreign key (id_musician) references musician_name (id_musician),
foreign key (id_track) references track_name (id_track));

create table album_name(
id_album serial primary key,
album_name varchar (100) not null,
yaer date not null);

create table album_musician(
id_album int,
id_musician int,
foreign key (id_album) references album_name (id_album),
foreign key (id_musician) references musician_name (id));

drop table collection_name  cascade

create table musical_genres(
id_genres serial primary key,
genrec_name varchar (100) unique not null);

create table musician_name(
id_musician serial primary key,
musician_name varchar (100) not null,
musician_nickname varchar (100) not null);

create table track_name(
id_track serial primary key,
track_name varchar (100) not null,
leght_sec int not null);

create table collection_name(
id_collection serial primary key,
collection_name varchar (100) not null,
year date not null);
 