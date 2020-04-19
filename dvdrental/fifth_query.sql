WITH table_1 AS (SELECT *, DATE_PART('day', return_date - rental_date) AS date_difference
				 FROM rental),
table_2 AS (SELECT rental_duration, date_difference,
			CASE
			WHEN rental_duration > date_difference THEN 'Returned Early'
			WHEN rental_duration = date_difference THEN 'Returned on Time'
			ELSE 'Returned late'
			END AS return_status
FROM film f
JOIN inventory i
			ON i.film_id = f.film_id
JOIN table_1
			ON table_1.inventory_id = i.inventory_id)

SELECT return_status, COUNT(*) number_of_films
FROM table_2
GROUP BY 1
ORDER BY 2 DESC;