SELECT c.first_name||' '||c.last_name AS name, 
	SUM(p.amount),
	DATE_TRUNC('month',p.payment_date) AS month
FROM customer c
JOIN payment p
	ON c.customer_id = p.customer_id
WHERE p.payment_date BETWEEN '2007-01-01' AND '2007-06-30'
GROUP BY 1,3
ORDER BY 2 DESC
LIMIT 10;