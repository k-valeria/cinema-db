select title, release_year from movies;

select title, release_year 
from movies 
where release_year > 2000;

select title, release_year
from movies
where title < 'Б';

select title, release_year
from movies m 
order by release_year desc
limit 10;

select title, release_year, country
from movies m 
order by country desc, release_year asc;

select title, release_year
from movies m 
order by release_year desc
limit 5 offset 5;

select title, release_year, country
from movies	
where release_year > 2000
order by country desc
limit 10;


select * from users u;

select title, country, duration
from movies m ;

select username, email, registration_date
from users u 
where registration_date > '2023-01-01';

select username, email, registration_date
from users u 
order by registration_date asc;

select title, release_year, description
from movies m 
order by release_year desc, title asc;

select movie_id, rating, rating_date
from ratings r 
order by rating desc
limit 5;

select title, release_year
from movies m 
order by title asc
limit 5 offset 10;

select username, email, registration_date
from users u 
where u.registration_date >= '2022-01-01'
order by registration_date asc 
limit 10;

select actor_name, birthdate
from actors a 
where a.nationality = 'США'
order by birthdate asc;

select title, release_year, country
from movies m 
where release_year > 2010 or country = 'США';

select username, email, registration_date, is_admin
from users	
where registration_date > '2023-01-01' or is_admin = true;

select username, email, is_admin
from users u 
where not is_admin = true;

select title, release_year, country
from movies m 
where not country = 'США';

select title, release_year, country
from movies m 
where country in ('США','Великобритания','Канада');

select username, email, registration_date, is_admin
from users u
where username in ('alexey.ivanov', 'anna.kuznetsova', 'vadim.prokhorov');

select title, release_year, country, duration
from movies m 
where release_year > 2000
and (country = 'США' or duration > 120)
and not title = 'The';

select username, email, registration_date, is_admin
from users u
where (is_admin = true or registration_date > '2022-01-01')
and not username = 'test';

select title, release_year, country, duration
from movies m 
where release_year between 2000 and 2010;

select username, email, registration_date, is_admin
from users u
where registration_date between '2022-01-01' and '2023-12-31';

select username, email, registration_date, is_admin
from users u
where username like '%vladimir%';

select title, release_year, country, duration
from movies m 
where title like '%Гарри%';

select title, release_year, country, duration
from movies m 
where title like '_____';

select title, release_year, country
from movies m 
where cast(release_year as text) = '2000';

select title, release_year, country
from movies m 
where release_year::text = '2000';

select *
from directors d 
where d.birthdate >= '1950-01-01'
and nationality = 'США';

select *
from movies m 
where release_year < 2000 or duration > 150;

select * from users u 
where not is_admin = true;

select * 
from movies m 
where release_year between 2000 and 2010;

select *
from reviews r 
where cast(r.review_date as text) like '%-10-%';

select * from movies
where title like 'Аватар%';

select * from movies
where title like '%День%';

select * 
from movies
where release_year > 2010
and (duration < 140 
or (country = 'Россия' and duration < 180));

select *
from movies 
where title like '%человек%'
and release_year >= 2010;

select *
from movies 
where release_year between 2010 and 2025
and title like '%Уик%';

select * 
from movies 
where release_year < 2000
and not duration between 120 and 130;


create database products;
