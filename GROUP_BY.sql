--Q1
SELECT genre, count(movie_name) AS movie_in_each_genre FROM movies m 
GROUP BY genre;

--Q2
SELECT YEAR , sum(revenue) AS revenue_in_each_year FROM movies m 
GROUP BY year;

--Q3
SELECT genre , avg(revenue) AS avg_revenue FROM movies m 
GROUP BY genre;

--Q4
SELECT language , genre, AVG(revenue) AS avg_revenue
FROM movies
GROUP BY language, genre;

--Q5
SELECT language ,count(movie_name) AS movie_count
FROM movies
GROUP BY language
ORDER BY language DESC LIMIT 1;

--Q6
SELECT country ,count(movie_name) AS movie_count
FROM movies
GROUP BY country
ORDER BY country DESC LIMIT 1; 

--Q7
SELECT genre ,count(movie_name) AS movie_count
FROM movies
GROUP BY genre
HAVING count(movie_name) > 2;

--Q8
SELECT year ,sum(revenue) AS revenue_total
FROM movies
GROUP BY year
HAVING sum(revenue) > 1000
ORDER BY YEAR DESC;

--Q9
SELECT language, COUNT(movie_name) AS movie_count
FROM movies
GROUP BY language
HAVING COUNT(movie_name) > 3;
