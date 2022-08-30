select  mn2.musician_name "все исполнители, которые не выпустили альбомы в 2020 году"
from 
	(select mn.musician_name , an.id_album  
			from album_name an 
			join album_musician am on am.id_album = an.id_album
			join musician_name mn on mn.id_musician = am.id_musician 
			where an."year" = 2020) b, musician_name mn2
where mn2.musician_name != b.musician_name



select an.album_name "название альбомов, в которых присутствуют исполнители более 1 жанра"
from album_name an 
join album_musician am on am.id_album = an.id_album 
join musician_name mn on mn.id_musician = am.id_musician 
join musician_genres mg on mg.id_musician = mn.id_musician 
join musical_genres mg2 on mg2.id_genres = mg.id_genres
group by an.album_name , mg2.genrec_name 
having count(mg2.genrec_name ) > 1


 
select mn.musician_name  "исполнителя(-ей), написавшего самый короткий по продолжительности трек "
from
	(select id_album, leght_sec 
		from (select
		min(leght_sec) over (partition by leght_sec) b
		from track_name tn
		limit 1) c, track_name tn2 
		where leght_sec = c.b) c2   
join album_name an on an.id_album = c2.id_album
join album_musician am on am.id_album = an.id_album 
join musician_name mn on mn.id_musician = am.id_musician 




select an2.album_name "название альбомов, содержащих наименьшее количество треков"
from
	(select an.album_name , count(track_name)b
	from track_name tn 
	join album_name an on an.id_album = tn.id_album 
	group by an.album_name 
	order by b
	limit 1) b1, album_name an2
join track_name tn2 on tn2.id_album = an2.id_album
group by an2.album_name, b1.b
having count(tn2.track_name) = b1.b 


			
			
			
			