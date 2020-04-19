SELECT c.name AS genre, 
	ROUND(AVG(f.rental_rate),3) average_rental_rate
FROM category c
JOIN film_category fc
	ON fc.category_id = c.category_id
JOIN film f
	ON f.film_id = fc.film_id
GROUP BY 1
ORDER BY 2 DESC;