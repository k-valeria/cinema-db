explain select title, release_year
from movies
where release_year = 2022;

explain select username
from users
where user_id in (select user_id from ratings where rating > 8);

explain select title
from movies
where movie_id in (select movie_id from ratings where rating > 9)
and director_id = (select director_id from directors where director_name = 'Кристофер Нолан');

explain analyze select m.title, d.director_name, r.rating
from movies m
inner join directors d on m.director_id = d.director_id
inner join ratings r on m.movie_id = r.movie_id
where r.rating > 9 and d.director_name = 'Кристофер Нолан';
