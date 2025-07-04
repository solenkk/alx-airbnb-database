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

--the query for Left join 
SELECT users.user_id, bookings.booking_id
FROM users
LEFT JOIN users ON booking_id=users.booking_id;

--THE query for full outer join 
SELECT users.user_id, bookings.booking_id
FROM users
FULL OUTER JOIN  users ON booking_id=users.booking_id;
