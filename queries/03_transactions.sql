
-- Добавьте нового пользователя в таблицу Users и сразу же внесите его первый рейтинг для фильма «Начало». 
-- Если любая из операций завершится неудачей, обе должны быть отменены.
begin;

insert into users (username, email, password_hash) values ('valeria.kisel', 'lerkakisel@mail.ru', 'hashed_password');
insert into ratings(user_id, movie_id, rating) 
values((select user_id from users where username = 'valeria.kisel'),
	   (select movie_id from movies where title = 'Титаник'), 10);

commit;

-- Обновите страну производства фильма с названием «Аватар» на USA. Затем попробуйте удалить все связанные с ним жанры. 
-- Если операция удаления завершится неудачей, изменения в стране производства не должны сохраниться.
begin;

update movies m 
set country = 'USA'
where title = 'Аватар';

delete from moviegenres 
where movie_id = (select movie_id from movies where title = 'Аватар');

commit;

-- Добавьте фильм «Матрица» в избранное для пользователя с именем john_doe. 
-- Если этого пользователя или фильма не существует, транзакция должна быть отменена.
begin;
insert into favorites (user_id, movie_id) 
values ((select user_id from users where username = 'jogn_doe'), 
		(select movie_id from movies where title = 'Матрица'));
commit;

-- Добавьте двух новых пользователей в таблицу Users и сразу же внесите для каждого из них по одной рецензии на фильм «Начало». 
-- Если любая из операций завершится неудачей, транзакция должна быть отменена.
begin;
insert into users (username, email, password_hash)
values ('irina.konon', 'irina.konon@mail.ru', 'hashed_password'),
	   ('anton.slesar', 'anton.slesar@mail.ru', 'hashed_password');

insert into reviews (user_id, movie_id, review_text)
values ((select user_id from users where username = 'irina.konon'),
		(select movie_id from movies where title = 'Начало'), 'Wow!'),
		((select user_id from users where username = 'anton.slesar'),
		(select movie_id from movies where title = 'Начало'), 'Perfect!');
commit;

-- Удалите фильм «Титаник» из базы данных, а также все связанные с ним жанры, оценки, избранное и рецензии. 
-- Если удаление любой из этих записей завершится ошибкой, транзакция должна быть отменена.
begin;

delete from favorites 
where movie_id = (select movie_id from movies where title = 'Титаник');

delete from movieactors  
where movie_id = (select movie_id from movies where title = 'Титаник');

delete from moviegenres  
where movie_id = (select movie_id from movies where title = 'Титаник');

delete from moviedirectors  
where movie_id = (select movie_id from movies where title = 'Титаник');

delete from ratings  
where movie_id = (select movie_id from movies where title = 'Титаник');

delete from reviews  
where movie_id = (select movie_id from movies where title = 'Титаник');

delete from movies 
where title = 'Титаник';

commit;

rollback;
