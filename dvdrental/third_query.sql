SELECT sub.category_name, 
COUNT(sub.film_title) rental_count
FROM (
		SELECT f.title film_title, c.name category_name
		FROM film f
		JOIN  film_category fc
			ON fc.film_id = f.film_id
		JOIN category c
			ON c.category_id = fc.category_id
		JOIN inventory i
			ON i.film_id = f.film_id
		JOIN rental r
			ON r.inventory_id = i.inventory_id
			AND c.name in ('Animation', 'Children', 'Classics','Comedy', 'Family','Music'))sub
GROUP BY 1
ORDER BY 2 DESC;