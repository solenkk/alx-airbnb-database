#Using WHERE
    SELECT user.email, property.property_id
    FROM users
    INNEER JOIN property ON user.email, property.property_id
    WHERE property_id = 555BD;

    #USING ORDER BY 
  SELECT booking.total_price, payment.amount 
  FROM booking 
  LEFT JOIN payment ON booking.total_price= payment.amount
  ORDER BY booking.total_price ASC;
 #creating an INDEX 
 CREATE INDEX all_users_email ON users(email);
