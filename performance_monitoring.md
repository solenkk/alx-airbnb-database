
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.city,
    p.country,
    p.price_per_night,
    pt.name AS property_type,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Property_Type pt ON p.type_id = pt.type_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE
    b.start_date BETWEEN '2024-01-01' AND '2024-12-31'
    AND p.country = 'Spain'
ORDER BY 
    b.start_date DESC;
