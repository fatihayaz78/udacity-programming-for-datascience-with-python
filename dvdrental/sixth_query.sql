SELECT 
	name, std_qrt, 
	COUNT(*) total
FROM (SELECT f.title AS title, c.name AS name, 
	  f.rental_duration AS rental_duration, 
	  NTILE(1) OVER (ORDER BY rental_duration) AS std_qrt
FROM category c
	  JOIN film_category fc
	  ON c.category_id = fc.category_id
	  JOIN film f
	  ON fc.film_id = f.film_id
WHERE c.name = 'Animation' OR c.name = 'Children' OR c.name = 'Classics' OR c.name = 'Comedy' OR c.name = 'Family' OR c.name = 'Music') sub
GROUP BY 1, 2
ORDER BY 3 DESC
