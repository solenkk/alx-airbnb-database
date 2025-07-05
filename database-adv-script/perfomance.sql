-- performance.sql
EXPLAIN ANALYZE
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
    b.start_date DESC;
-- Indexes for join 
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_property_type_id ON Property(type_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Index 
CREATE INDEX idx_booking_start_date ON Booking(start_date DESC);
    ANALYZE EXPLAIN 
    SELECT * FROM BOOKING;
