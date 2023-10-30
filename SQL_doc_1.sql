--Given the skills and queries we covered today, answer the following 10 questions.
--
--Once completed create/save the queries (SQL Code) in a .sql file using DBeaver and commit the file to github. Afterwhich you will need to submit the github link to the assignment.
--
--ANSWERS:
--Use SQL to find these answers. Some of the questions are slightly ambiguous so the intended outputs are included below. Also as you do the problems please number the problems to make grading easier.
--Please use DBeaver for your queries.
--1. 2
--2. 5567
--3. Film 200 with 9 
--4. 0
--5. 1 - 8040
--6. 378
--7. film_id 508 - 15 actors
--8. 13
--9. 3
--10. 5 ratings, PG-13 has the most

--Week 5 - Monday Questions

--1. How many actors are there with the last name ‘Wahlberg’?
select last_name, first_name
from actor
where last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount BETWEEN 3.99 and 5.99;

--3. What film does the store have the most of? (search in inventory)
select count(inventory_id), film_id
from inventory
group by film_id
order by count(inventory_id) desc;

--4. How many customers have the last name ‘William’?
select first_name, last_name
from actor
where first_name = 'William';

--5. What store employee (get the id) sold the most rentals?
select staff_id, count(staff_id)
from rental
group by staff_id
order by count(staff_id);

--6. How many different district names are there?
select count(distinct(district))
from address;

--7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc;

--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select store_id, count(last_name)
from customer
where last_name like '%es' and store_id = 1
group by store_id;


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT r.customer_id, COUNT(r.inventory_id) AS inventory_count, p.amount
FROM rental r
INNER JOIN payment p ON r.customer_id = p.customer_id
WHERE r.customer_id BETWEEN 380 AND 430
GROUP BY p.amount, r.customer_id
HAVING COUNT(r.inventory_id) > 250
ORDER BY p.amount DESC;


--10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select rating, count(rating)
from film
group by rating
order by count(rating) desc;







