-- 1. We will need a list all staff members, including their first and last names, email addressses, and the store identification number where they work.
SELECT * FROM mavenmovies.staff;
select
first_name,
last_name,
email,
store_id
FROM mavenmovies.staff;

-- 2. We will need separate counts of inventory items held at each of your stores.
SELECT * FROM mavenmovies.inventory;
SELECT 
 store_id,
 COUNT(inventory_id) AS count_of_inventory
FROM mavenmovies.inventory
GROUP BY store_id;

-- We will need a count of active customers for each of your stores. Separately please
SELECT * FROM mavenmovies.customer;
select
store_id,
count(customer_id) as active_customers
FROM mavenmovies.customer
where active = 1
group by store_id;

-- 4 In order to assess the liability of a data breach, we will need you to provide a count of all customer email addresses stored in the database.
SELECT * FROM mavenmovies.customer;
select
count(email) as emails
from mavenmovies.customer;

-- 5. We are interested in how diverse your film offering is as a means of understanding how likely you are to keep customers engaged in the future. Please provide a count of unique film titles you have in inventory at each store and then provide a count of the unique categories of films you provide

select * FROM mavenmovies.inventory;
select store_id,
count(distinct film_id) AS count_unique_title
FROM mavenmovies.inventory	
group by store_id;

select
count(distinct name) as count_unique_categories
FROM mavenmovies.category;

-- 6.  We would like to understand the replacement cost of your films, Please provide the replacement cost for the film that is least expensive to replace, the most expensive to replace, the most expensive to place, and the average of all films you carry.

select *from mavenmovies.film;
select 
min(replacement_cost) as least_expensive_to_replace,
max(replacement_cost) as most_expensive_to_replace,
avg(replacement_cost) as average_of_all_films
from mavenmovies.film;

-- 7. We are interested in having you put payment monitoring systems and maximum payment processing restrictions in place in order to minimize the future risk of fraud by your staff. Please provide the average payment you process, as well as the maximum payment you have processed.

select* from mavenmovies.payment;
select
avg(amount) as avg_payment,
max(amount) as max_payment
from mavenmovies.payment;

-- 8. We would like to better understand what your customer base looks like. Please provide a list of all customer identification values, with a list of all customer identification values, with a count of rentals they have made-all=time, with your highest volume customers at the top of the list.
select* from mavenmovies.rental;
select customer_id, count(rental_id) as num_of_times_rented
from mavenmovies.rental
group by customer_id	
order by num_of_times_rented desc;
