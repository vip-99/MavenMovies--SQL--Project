use mavenmovies;

/*
1.Find list of all staff members, including their first and last names, 
email addresses, and the store identification number where they work. 
*/ 

SELECT first_name, last_name, email,store_id
FROM staff;

/*
2.	What is the count of inventory items held at each of your two stores. 
*/ 

SELECT store_id,COUNT(inventory_id) AS inventory_items
FROM inventory
GROUP BY store_id;

/*
3.	What is the count of active customers for each of your stores. 
*/ 

SELECT store_id, COUNT(customer_id) AS active_customers
FROM customer
WHERE active = 1
GROUP BY store_id;

/*
4.	Provide a count of all customer email addresses stored in the database. 
*/

SELECT COUNT(email) AS customer_emails
FROM customer;

/*
5.	What is the count of unique film titles you have in inventory at each store and then 
Provide a count of the unique categories of films you provide. 
*/

SELECT store_id, COUNT(DISTINCT film_id) AS Total_unique_films
FROM inventory
GROUP BY store_id; 

/*
6. Provide a count of the unique categories of films you provide. 
*/
	
SELECT COUNT(DISTINCT name) AS Total_unique_categories
FROM category;

/*
7. Find the replacement cost for the film that is least expensive to replace, 
the most expensive to replace, and the average of all films you carry.	
*/

SELECT 
	   MIN(replacement_cost) AS least_expensive, 
	   MAX(replacement_cost) AS most_expensive, 
       AVG(replacement_cost) AS average_replacement_cost
FROM film;

/*
8.Provide the average payment you process, as well as the maximum payment you have processed.
*/

SELECT AVG(amount) AS average_payment, MAX(amount) AS max_payment
FROM payment;

/*
9. Find a list of all customer identification values, with a count of rentals 
they have made all-time, with your highest volume customers at the top of the list.
*/

SELECT customer_id,COUNT(rental_id) AS Total_rentals
FROM rental
GROUP BY customer_id
ORDER BY Total_rentals DESC;

/*
10. Find the film_id,title,description,release_year from movies 
that have Trailers in their special_features.
*/

SELECT film_id,title,description,release_year,special_features
FROM film 
WHERE special_features LIKE '%Trailers%'
ORDER BY film_id;



