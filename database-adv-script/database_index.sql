-- Using WHERE
SELECT user.email, property.property_id
FROM users
INNER JOIN property ON user.email = property.email
WHERE property.property_id = '555BD';

-- Using ORDER BY
SELECT booking.total_price, payment.amount 
FROM booking 
LEFT JOIN payment ON booking.booking_id = payment.booking_id
ORDER BY booking.total_price ASC;

-- Creating an INDEX
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX p_rp ON property(property_id);
CREATE INDEX nk ON booking(total_price);
CREATE INDEX pyt ON payment(amount);

EXPLAIN ANALYZE 
SELECT * FROM property 
where property_id < 999;
