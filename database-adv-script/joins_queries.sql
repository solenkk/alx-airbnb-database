--writing query using inner join 
inner_join so when we use inner_join query what it basically does is joining the pairs so for our we have created about 
about 9 tables in our air bnb project. 
so when we match the tables it only matches the one that are in pair means IF we join table user and booking it will only
join the users that made a booking with the booking table or if we join table of payment and user it will retirave datas of 
the user and the payment they made that is what inner join is so 

  -- the query looks like 
  SELECT users.user_id, bookings.booking_id
  FROM users
  INNER JOIN users ON booking_id=users.booking_id;

--The query for Left join 
SELECT 
    p.property_id,
    p.title AS property_title,
    p.property_type,
    p.city,
    p.price_per_night,
    COUNT(r.review_id) AS review_count,
    AVG(r.rating) AS average_rating
FROM 
    properties p
LEFT JOIN 
    reviews r ON p.property_id = r.property_id
GROUP BY 
    p.property_id, p.title, p.property_type, p.city, p.price_per_night
ORDER BY 
    p.property_id;

--THE query for full outer join 
SELECT users.user_id, bookings.booking_id
FROM users
FULL OUTER JOIN  users ON booking_id=users.booking_id;
