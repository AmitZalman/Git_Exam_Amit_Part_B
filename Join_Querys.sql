--Q1
SELECT CONCAT(t.first_name  , ' ' ,  t.last_name) AS tourist_name ,
			  c.country_name AS original_country  
FROM tourists t 
INNER JOIN countries c ON t.country_id  = c.id;

--Q2
SELECT CONCAT(t.first_name  , ' ' ,  t.last_name) AS tourist_name , 
			  t2.tour_name , t2.description , CONCAT(t2.start_date  ,' - ', t2.end_date  ) AS trip_dates,
			  t2.price  , t2.max_participants  ,t2.guide_name  , t2.difficulty_level ,t2.pickup_location 
FROM tourists t 
INNER JOIN tours t2 ON t.tour_id = t2.id

--Q3
SELECT CONCAT(t.first_name  , ' ' ,  t.last_name) AS tourist_name , 
			  t2.tour_name , t2.description , CONCAT(t2.start_date  ,' - ', t2.end_date  ) AS trip_dates,
			  t2.price  , t2.max_participants  ,t2.guide_name  , t2.difficulty_level ,t2.pickup_location 
FROM tourists t 
left JOIN tours t2 ON t.tour_id = t2.id

--Q4
SELECT t.first_name  ,   t.last_name  , 
			  t2.tour_name , t2.description , t2.start_date  , t2.end_date ,
			  t2.price  , t2.max_participants  ,t2.guide_name  , t2.difficulty_level ,t2.pickup_location 
FROM tourists t 
FULL OUTER JOIN tours t2 ON t.tour_id = t2.id

--Q5
SELECT (t.first_name || ' ' || t.last_name) AS tourist_name
FROM tourists t
LEFT JOIN tours t2 ON t.tour_id = t2.id
WHERE t2.id IS  NULL ;
			  
--Q6
SELECT t2.tour_name , t2.description
FROM tourists t
RIGHT JOIN tours t2 ON t.tour_id = t2.id
WHERE t.id IS  NULL ;

--Q7
SELECT t2.tour_name  ,count(*)
FROM tourists t
RIGHT JOIN tours t2 ON t.tour_id = t2.id
WHERE t.id IS  NULL 
GROUP BY tour_name;

--Q8
SELECT CONCAT(t.first_name  , ' ' ,  t.last_name) AS tourist_name , 
			  t2.tour_name , t2.description , CONCAT(t2.start_date  ,' - ', t2.end_date  ) AS trip_dates,
			  t2.price  , t2.max_participants  ,t2.guide_name  , t2.difficulty_level ,t2.pickup_location 
FROM tourists t 
CROSS JOIN tours t2 
