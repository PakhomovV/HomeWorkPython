

select count(mn.musician_name) "Количество исполнителей в каждом жанре" , mg2.genrec_name 
from musician_name mn 
join musician_genres mg on mg.id_musician = mn.id_musician 
join musical_genres mg2 on mg2.id_genres = mg.id_genres 
group by mg2.genrec_name 



select an.album_name , count(tn.track_name) "количество треков, вошедших в альбомы 2019-2020 годов"
from album_name an 
join track_name tn on tn.id_track = an.id_track 
where  an.yaer >= 2019 and an.yaer <= 2020
group by an.album_name 

select an.album_name , int2(avg(tn.leght_sec)) "средняя продолжительность треков по каждому альбому"
from album_name an 
join track_name tn on tn.id_track = an.id_track 
group by an.album_name 


select mn.musician_name "все исполнители, которые не выпустили альбомы в 2020 году"
from album_name an 
join album_musician am on am.id_album = an.id_album 
join musician_name mn  on mn.id_musician = am.id_musician
where an.yaer  != 2020

select cn.collection_name "названия сборников, в которых присутствует конкретный исполнитель Sinatra"
from collection_name cn 
join track_collection tc on tc.id_collection = cn.id_collection 
join track_name tn on tn.id_track = tc.id_track 
join album_name an on an.id_track = tn.id_track 
join album_musician am on am.id_album = an.id_album 
join musician_name mn on mn.id_musician = am.id_musician 
where mn.musician_name like '%Sinatra%'



select c.album_name "название альбомов, в которых присутствуют исполнители более 1 жанра"
from 
(select an.album_name , count(mg.id_genres) b
from musician_genres mg 
join album_musician am on am.id_musician = mg.id_musician 
join album_name an on an.id_album = am.id_album  
group by an.album_name) c 
where c.b > 1

select b.collection_name "название альбомов, содержащих наименьшее количество треков"
from 
	(select cn.collection_name , count(tn.track_name) 
	from collection_name cn 
	join track_collection tc on tc.id_collection = cn.id_collection 
	join track_name tn on tn.id_track = tc.id_track
	group by cn.collection_name 
	order by count(tn.track_name)) b
-- limit 4 если до трех треков и тд


 
select musician_name "исполнителя(-ей), написавшего самый короткий по продолжительности трек "
from
	(select tn.id_track ,
	min(leght_sec) over (partition by leght_sec)
	from track_name tn
	limit 3) b  
join album_name an on an.id_track = b.id_track
join album_musician am on am.id_album  = an.id_album 
join musician_name mn on mn.id_musician = am.id_musician 


select tn.track_name "название альбомов, содержащих наименьшее количество треков"
from collection_name cn 
join track_collection tc on tc.id_collection = cn.id_collection 
full join track_name tn on tn.id_track = tc.id_track 
where cn.collection_name is null  