USE sakila;

select * from film;
select * from inventory;

-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT count(inventory_id) as inventory  FROM sakila.inventory
  WHERE film_id IN (
     SELECT film_id
	 FROM sakila.film
     WHERE title = 'Hunchback Impossible'
  );
  
  
-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title,length FROM sakila.film
  where length > (Select avg (length) from sakila.film)
  Order by length ASC;
  
  
-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".

 
 Select first_name, last_name from sakila.actor
 WHERE actor_id in
	(Select Actor_id  FROM sakila.film_actor
	WHERE film_id IN (
		SELECT film_id
		FROM sakila.film
		WHERE title = 'Alone Trip'))
Order by last_name ASC;


