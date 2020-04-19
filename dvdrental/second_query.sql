SELECT title, 
	COUNT(title) inventory_cnt
FROM film
JOIN inventory
	ON film.film_id = inventory.film_id
JOIN rental 
	ON inventory.inventory_id = rental.inventory_id
GROUP BY title
ORDER BY inventory_cnt desc
LIMIT 10;