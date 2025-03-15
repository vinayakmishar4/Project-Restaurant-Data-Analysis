 -- Restaurant Data Analysis with SQL --
 
 -- select the database --
 
 use swiggy;
 
 -- show the data of the restaurant for Data Analysis --
 
 select *from restaurants;
 
 -- so there are different parameter on basis of which we analysis.parameter like name city,rating,etc
 
-- which restaurant in Abohar is visited by the least number of people --

select *from restaurants where city="Abohar" and rating_count=(select min(rating_count) from restaurants where city="Abohar");

-- which restaurant has generated maximum revenue all over India--

select *from restaurants where rating_count*cost=(select max(cost * rating_count) from restaurants);

-- How many restaurants have a rating higher than the average rating --

select *from restaurants where rating > (select avg(rating) from restaurants);

-- Which restaurant in Delhi has generated the most revenue --

select *from restaurants where city= "Delhi" and rating_count*cost=(select max(rating_count*cost) from restaurants where city="Delhi"); 

-- Which restaurant chain has the maximum number of restaurants --

select name,count(name) as restaurants_chain from restaurants group by name order by restaurants_chain desc limit 10;

-- Which restaurant chain has generated the maximum revenue --

select name,sum(cost*rating_count) as revenue from restaurants group by name order by revenue desc limit 10;

-- Which city has the maximum number of restaurants --

select city,count(city) as no_of_restaurants from restaurants group by city order by no_of_restaurants desc limit 10;

-- Which city has generated the maximum revenue all over India --

select city,sum(cost*rating_count) as revenue from restaurants group by city order by revenue desc limit 10;

-- List the 10 least expensive cuisines --

select cuisine,min(cost) as expensive_cuisines from restaurants group by cuisine order by expensive_cuisines limit 10;

-- List the 10 most expensive cuisines --

select cuisine,max(cost) as expensive_cuisines from restaurants group by cuisine order by expensive_cuisines desc limit 10;

-- What city has Biryani as the most popular cuisine --

select city,count(city) as popular_cuisisne from restaurants where cuisine="Biryani" group by city order by popular_cuisisne desc limit 10;

-- 12. List the top 10 unique restaurants with unique names throughout the dataset as per maximum revenue generated (single restaurant with that name) --

SELECT name, SUM(cost * rating_count) AS revenue
FROM restaurants
GROUP BY name
HAVING COUNT(name) = 1
ORDER BY revenue DESC
LIMIT 10;
