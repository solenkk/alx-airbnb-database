-- performance.sql

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
    b.status = 'confirmed'
    AND p.country = 'Spain'
    AND b.start_date >= '2024-01-01'
ORDER BY 
    b.start_date DESC;

CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_status_date ON Booking(status, start_date);
CREATE INDEX idx_property_country ON Property(country);
CREATE INDEX idx_property_type ON Property(type_id);
CREATE INDEX idx_payment_booking ON Payment(booking_id);
SELECT 
    b.booking_id,
    b.start_date,

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
ORDER BY 
    b.start_date DESC ;


    ANALYZE EXPLAIN 
    SELECT * FROM BOOKING;
