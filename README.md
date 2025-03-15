# Restaurant Data Analysis with SQL

## Overview

This project leverages SQL to perform insightful data analysis on restaurant performance across various cities in India. The dataset includes information on restaurant names, cities, ratings, and revenue generation.

## Objectives

- Identify the least visited restaurant in a specific city.
- Determine the restaurant with the highest revenue nationwide.
- Find restaurants with ratings higher than the average.
- Pinpoint the highest revenue-generating restaurant in Delhi.

## Database Information

- **Database Name:** `swiggy`
- **Primary Table:** `restaurants`

## Key SQL Queries

1. **Least Visited Restaurant in Abohar**

   ```sql
   SELECT *
   FROM restaurants
   WHERE city = "Abohar" AND rating_count = (
     SELECT MIN(rating_count)
     FROM restaurants
     WHERE city = "Abohar"
   );
   ```

2. **Restaurant with Maximum Revenue (All India)**

   ```sql
   SELECT *
   FROM restaurants
   WHERE rating_count * cost = (
     SELECT MAX(cost * rating_count)
     FROM restaurants
   );
   ```

3. **Restaurants with Above Average Rating**

   ```sql
   SELECT *
   FROM restaurants
   WHERE rating > (
     SELECT AVG(rating)
     FROM restaurants
   );
   ```

4. **Highest Revenue Restaurant in Delhi**

   ```sql
   SELECT *
   FROM restaurants
   WHERE city = "Delhi" AND rating_count * cost = (
     SELECT MAX(rating_count * cost)
     FROM restaurants
     WHERE city = "Delhi"
   );
   ```

## Prerequisites

- MySQL or compatible SQL environment
- Access to the `swiggy` database

## How to Run

1. Import the `swiggy` database.
2. Execute the provided SQL queries in your SQL environment.
3. Analyze the results for data-driven decision-making.

## Conclusion

This SQL analysis provides valuable insights into restaurant performance metrics, helping stakeholders make informed business decisions based on customer behavior and revenue patterns.

