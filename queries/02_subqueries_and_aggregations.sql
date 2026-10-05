-- все данные о фильмах, у которых максимальная продолжительность среди всех кинолент
select *
from movies m 
where duration = (
	select max(duration) 
	from movies m);

-- имена пользователей, которые поставили хотя бы одну оценку фильмам
select u.username
from users u 
where u.user_id in (
	select user_id 
	from ratings r);

-- фильмы, у которых нет ни одной рецензии
select m.title 
from movies m 
where movie_id not in (
	select r.movie_id 
	from reviews r);

-- имена режиссёров, которые сняли хотя бы один фильм после 2010 года.
select director_name
from directors d 
where d.director_id in (
	select m.director_id 
	from movies m 
	where m.release_year > 2010);

-- названия стран, в которых средняя продолжительность фильмов выше средней продолжительности всех фильмов в базе данных.
select country
from movies 
group by country
having avg(duration) > (
	select avg(duration)
	from movies);

-- фильмы, которые были добавлены в избранное больше раз, чем другие
select title
from movies m
where movie_id in (
	select movie_id
	from favorites f 
	group by f.movie_id 
	having count(*) = (
		select max(fav_count)
		from (select movie_id, count(*) as fav_count
	  		  from favorites f 
	 	      group by movie_id)));

-- пользователи, которые поставили хотя бы одну оценку выше средней оценки всех фильмов.
select u.username
from users u
where u.user_id in (
	select r.user_id 
	from ratings r
	where r.rating > (select avg(rating)
					  from ratings));

-- Выведите названия фильмов, которые относятся к нескольким жанрам.
select title 
from movies m 
where movie_id in (
	select mg.movie_id
	from moviegenres mg
	group by mg.movie_id 
	having count(*) > 1);

-- имена пользователей, которые добавили в избранное более чем три фильма
select u.username
from users u 
where u.user_id in (
	select user_id 
	from favorites f 
	group by f.user_id 
	having count(*) > 3);

-- имена актёров, которые снимались в фильмах режиссёра Кристофера Нолана.
select a.actor_name 
from actors a 
where a.actor_id in (
	select m.actor_id
	from movieactors m 
	where movie_id in (select movie_id
						from movies
						where director_id = (
							select director_id
							from directors d 
							where d.director_name = 'Кристофер Нолан')));





