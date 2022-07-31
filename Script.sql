create database music_services;
create table musical_genres(
id serial primary key,
genrec_name varchar (100) unique not null);

create table musician_name(
musician_id serial primary key,
genrec_id int references musical_genres (id),
musician_name varchar (100) not null,
musician_nickname varchar (100) not null);

create table album_name(
album_id serial primary key,
genrec_id int references musical_genres (id),
musician_id int references musician_name (musician_id),
album_name varchar (100) not null,
year date not null);

create table track_name(
track_id serial primary key,
album_id int not null,
genrec_id int references musical_genres (id),
musician_id int references musician_name (musician_id),
foreign key (album_id) references album_name (album_id),
track_name varchar (100) not null,
leght time not null);

create table collection_name(
collection_id serial primary key,
track_id int not null references track_name (track_id),
collection_name varchar (100) not null,
year date not null);

