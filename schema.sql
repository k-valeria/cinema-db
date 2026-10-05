-- actors
CREATE TABLE public.actors (
    actor_id SERIAL PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
);

-- directors
CREATE TABLE public.directors (
    director_id SERIAL PRIMARY KEY,
    director_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(100)
);

-- genres
CREATE TABLE public.genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL UNIQUE
);

-- users
CREATE TABLE public.users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_admin BOOLEAN DEFAULT FALSE
);

-- movies
CREATE TABLE public.movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    release_year INT,
    duration INT,
    country VARCHAR(100),
    director_id INT REFERENCES public.directors(director_id),
    related_movie_id INT REFERENCES public.movies(movie_id)
);

-- ratings
CREATE TABLE public.ratings (
    rating_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES public.users(user_id) ON DELETE CASCADE,
    movie_id INT NOT NULL REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    rating INT,
    rating_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, movie_id)
);

-- reviews
CREATE TABLE public.reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES public.users(user_id) ON DELETE CASCADE,
    movie_id INT NOT NULL REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    review_text TEXT NOT NULL,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, movie_id)
);

-- favorites
CREATE TABLE public.favorites (
    favorite_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES public.users(user_id) ON DELETE CASCADE,
    movie_id INT NOT NULL REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (user_id, movie_id)
);

-- movieactors
CREATE TABLE public.movieactors (
    movie_id INT NOT NULL REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    actor_id INT NOT NULL REFERENCES public.actors(actor_id) ON DELETE CASCADE,
    role_name VARCHAR(100),
    PRIMARY KEY (movie_id, actor_id)
);

-- moviedirectors
CREATE TABLE public.moviedirectors (
    movie_id INT NOT NULL REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    director_id INT NOT NULL REFERENCES public.directors(director_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, director_id)
);

-- moviegenres
CREATE TABLE public.moviegenres (
    movie_id INT NOT NULL REFERENCES public.movies(movie_id) ON DELETE CASCADE,
    genre_id INT NOT NULL REFERENCES public.genres(genre_id) ON DELETE CASCADE,
    PRIMARY KEY (movie_id, genre_id)
);
