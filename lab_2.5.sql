-- LAB 2.5 SQL

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

-- How many films (movies) are available for rent and how many films have been rented?

SELECT COUNT(film_id) as'films_available' FROM sakila.film;

SELECT COUNT(rental_id) as'films_rented' FROM sakila.rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT film_id,title,length, MAX(length) as max_duration FROM sakila.film;
SELECT film_id,title,length, MIN(length) as min_duration FROM sakila.film;

-- What's the average movie duration expressed in format (hours, minutes)?

SELECT  AVG (length)/60 AS avg_time 
FROM sakila.film;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) AS 'distinct_last_name'
FROM sakila.actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

SELECT DATEDIFF(MAX(CONVERT(rental_date, DATE)) ,  MIN(CONVERT(rental_date, DATE))) as operating_days FROM rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, month(rental_date), weekday(rental_date) as weekday FROM rental;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
    CASE
        WHEN weekday(rental_date) < 6 then 'workday'
        ELSE 'weekend'
        END AS 'day_type'
    FROM sakila.rental;
    
-- Get release years.
SELECT film_id, title, release_year FROM sakila.film

-- Get all films with ARMAGEDDON in the title.
SELECT title FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
SELECT title FROM sakila.film
WHERE title LIKE '%APOLLO';

-- -- Get 10 the longest films.
SELECT title,length  
FROM sakila.film
ORDER BY length DESC 
limit 10;

-- How many films include Behind the Scenes content?
SELECT COUNT(film_id) AS "n_movies_behindthescenes" FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%'; 

SELECT COUNT(DISTINCT last_name) AS 'distinct_last_name'
FROM sakila.actor;