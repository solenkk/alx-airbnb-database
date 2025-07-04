
-- Optimized version in performance.sql
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
    -- Removed property_type as it's often not needed
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM 
    Booking b
-- Force index usage on foreign keys
FORCE INDEX (idx_user, idx_property)
JOIN 
    User u FORCE INDEX (PRIMARY) ON b.user_id = u.user_id
JOIN 
    Property p FORCE INDEX (PRIMARY) ON b.property_id = p.property_id
-- Changed to LEFT JOIN only when payment data is actually needed
LEFT JOIN 
    Payment pay FORCE INDEX (idx_booking) ON b.booking_id = pay.booking_id
-- Added reasonable date filter
WHERE 
    b.start_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
-- Limit results to manageable size
ORDER BY 
    b.start_date DESC
LIMIT 1000;
