use mywork;

SELECT * FROM music_data;

select count(User_ID) 
from music_data;

-- Hitung jumlah kolom User_ID yang null
select count(*) as missing_User_ID
from music_data
Where User_ID is null;

-- Menampilkan baris User_ID yang lebih dari 1
select User_ID, count(*) as DuplicateCount
from music_data
group by User_ID
having count(*)>1;

-- Distribusi Pengguna
select Country,
	count(User_ID) as Total_Users
from music_data
group by Country
order by Total_Users desc;

-- Platform Streaming Populer
select Streaming_Platform,
	count(User_ID) as Total_Users
from music_data
group by Streaming_Platform;

-- Preferensi Genre Berdasarkan Usia
select Age, Top_Genre,
	count(User_ID) as Users
from music_data
group by Age, Top_Genre
order by Age;

-- Pengaruh Pengguna Berlangganan
select Subscription_Type,
	round(avg(Number_of_Songs_Liked), 2) as Avg_Songs_Liked,
    round(avg(Minutes_Streamed_Per_Day), 2) as Avg_Minutes
from music_data
group by Subscription_Type;