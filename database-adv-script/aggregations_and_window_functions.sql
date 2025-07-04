Total number of bookings made by each user (using COUNT and GROUP BY)
 SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(b.booking_id) AS total_bookings
FROM 
    User u
LEFT JOIN 
    Booking b ON u.user_id = b.user_id
GROUP BY 
    u.user_id, u.first_name, u.last_name, u.email
ORDER BY 
    total_bookings DESC;
--Ranking properties based on total bookings received (using window functions)
SELECT 
    p.property_id,
    p.name AS property_name,
    p.city,
    p.country,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.city, p.country
ORDER BY 
    total_bookings DESC;
--
SELECT 
    p.property_id,
    p.name AS property_name,
    p.city,
    p.country,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.city, p.country
ORDER BY 
    total_bookings DESC;
--
SELECT 
    p.property_id,
    p.name AS property_name,
    p.city,
    p.country,
    COUNT(b.booking_id) AS total_bookings,
    DENSE_RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM 
    Property p
LEFT JOIN 
    Booking b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name, p.city, p.country
ORDER BY 
    total_bookings DESC;
