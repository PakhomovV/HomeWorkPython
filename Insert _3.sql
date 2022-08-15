insert into musical_genres (id_genres, genrec_name)
values (10, 'Country'), (11, 'Jazz'), (12, 'Blues'), (13, 'Elektronische Musik'), (14, 'Rok');

insert into musician_name (id_musician, musician_name, musician_nickname)
values (100, 'Francis Albert Sinatra', 'Frankie'), (101, 'Sarah Lois Vaughan', 'Sassy'), (102, 'Riley B. King', 'B.B. King'), (103, 'Richard William Wright','Profit Hunters'), (104, 'Keith Charles Flint','Sheepdog'), (105, 'James Alan Hetfield', 'The King of Metal'), (106, 'George Harvey Strait', 'George'), (107, 'John Ray Cash', 'Cash'), (108, 'Sade', 'Sade');

insert into musician_genres 
values (100, 11), (101, 11), (102, 12), (103, 14), (104, 13), (105, 14), (106, 10), (107, 10), (107, 14), (107, 12), (108, 11)


insert into album_name (id_track, album_name, yaer)
values (1001,'Best Of The Best', 2011), (1008, 'Live - Hollywood Palladium', 1990), (1003, 'Strait Out Of The Box: Part 2', 2017), (1004, 'Fever', 2018), (1005, 'The Life of Riley', 2020),(1006, 'Hidden In Plain Sight', 2019), (1004, 'Alpha Omega', 2019), (1002, 'Pop Goes Classical', 2020), (1009,'American IV: The Man Comes Around', 2002);


insert into track_name (id_track, track_name, leght_sec)
values (1001, 'My Funny Valentine', 150), (1002, 'War Pigs', 490), (1003, 'Texas Cookin', 262 ), (1004, 'Fever', 422 ), (1005, 'Miss Martha King', 163), (1006, 'Too Much', 145), (1007, 'War', 208), (1008, 'Fade to Black', 355), (1009, 'Personal Jesus', 199), (1010, 'My Funny Valentine', 150), (1011, 'Beautiful Tango (Unplugged)', 265), (1012, 'Bim Bam', 281), (1013, 'Numb', 187), (1014, 'From the Inside', 173), (1015, 'Omen', 216), (1016, 'Voodoo People', 387);



insert into collection_name (collection_name, "year") 
values ('Top hit Jazz', 2018), ('Top hit Rock', 2019), ('Top hit Blues', 2020), ('Top hit Elektronische Musik', 2021), ('Only Hit Rock', 2018), ('Miloman 2018', 2018), ('Miloman 2010', 2010), ('Hit Country', 2019);

insert into track_collection 
values (1, 1004), (1, 1001), (2, 1008), (2, 1009), (3, 1005), (3, 1009), (4, 1006), (5, 1008), (5, 1009), (5, 1002), (6, 1005), (6, 1001), (6, 1006), (6, 1002), (7, 1004), (7, 1001), (7, 1009), (8, 1003), (8, 1002), (8, 1006), (8, 1005)


insert into album_musician 
values (1, 100), (2, 105), (3, 106), (4, 101), (5, 102), (6, 104 ), (7, 108), (8, 103), (9, 107)


