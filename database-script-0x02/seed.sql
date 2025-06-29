-- 🏠 Airbnb Sample Data
-- SET FOREIGN_KEY_CHECKS = 1;

-- 👥 Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role) VALUES
-- Admins
('11111111-1111-1111-1111-111111111111', 'Admin', 'User', 'admin@airbnb.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQDq4wXm5JxH3iHCXlHBFjD9XrY8ST2', '+1234567890', 'admin'),

-- Hosts
('22222222-2222-2222-2222-222222222222', 'Sarah', 'Johnson', 'sarah@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQDq4wXm5JxH3iHCXlHBFjD9XrY8ST2', '+1555123456', 'host'),
('33333333-3333-3333-3333-333333333333', 'Michael', 'Chen', 'michael@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQDq4wXm5JxH3iHCXlHBFjD9XrY8ST2', '+1555234567', 'host'),

-- Guests
('44444444-4444-4444-4444-444444444444', 'Emma', 'Williams', 'emma@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQDq4wXm5JxH3iHCXlHBFjD9XrY8ST2', '+1555345678', 'guest'),
('55555555-5555-5555-5555-555555555555', 'James', 'Brown', 'james@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQDq4wXm5JxH3iHCXlHBFjD9XrY8ST2', '+1555456789', 'guest');

-- � Property Types
INSERT INTO Property_Type (name, description) VALUES
('Apartment', 'Self-contained residential unit within a larger building'),
('House', 'Standalone residential building'),
('Villa', 'Luxury vacation home with private amenities'),
('Cabin', 'Wooden house in a natural setting'),
('Loft', 'Open-concept urban living space');

-- 🛋️ Amenities
INSERT INTO Amenity (name, icon_class) VALUES
('WiFi', 'wifi'),
('Pool', 'pool'),
('Kitchen', 'kitchen'),
('Parking', 'local_parking'),
('Air Conditioning', 'ac_unit'),
('Washer', 'local_laundry_service'),
('TV', 'tv'),
('Gym', 'fitness_center'),
('Hot Tub', 'hot_tub'),
('Fireplace', 'fireplace');

-- 🏡 Properties
INSERT INTO Property (property_id, host_id, type_id, name, description, street_address, city, country, price_per_night) VALUES
-- Sarah's properties
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 1, 'Downtown Luxury Loft', 'Stylish loft in heart of the city', '123 Main St', 'New York', 'USA', 250.00),
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 2, 'Cozy Mountain Cabin', 'Rustic retreat with stunning views', '456 Forest Rd', 'Aspen', 'USA', 180.00),

-- Michael's properties
('cccccccc-cccc-cccc-cccc-cccccccccccc', '33333333-3333-3333-3333-333333333333', 3, 'Beachfront Villa', 'Luxury villa steps from the beach', '789 Ocean Ave', 'Miami', 'USA', 400.00),
('dddddddd-dddd-dddd-dddd-dddddddddddd', '33333333-3333-3333-3333-333333333333', 1, 'Modern City Apartment', 'Sleek apartment with skyline views', '321 Urban St', 'Chicago', 'USA', 175.00);

-- 🔗 Property Amenities
INSERT INTO Property_Amenity (property_id, amenity_id) VALUES
-- Downtown Luxury Loft
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 1), -- WiFi
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 3), -- Kitchen
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 5), -- AC
('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', 7), -- TV

-- Cozy Mountain Cabin
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 1), -- WiFi
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 9), -- Hot Tub
('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 10), -- Fireplace

-- Beachfront Villa
('cccccccc-cccc-cccc-cccc-cccccccccccc', 1), -- WiFi
('cccccccc-cccc-cccc-cccc-cccccccccccc', 2), -- Pool
('cccccccc-cccc-cccc-cccc-cccccccccccc', 3), -- Kitchen
('cccccccc-cccc-cccc-cccc-cccccccccccc', 4), -- Parking
('cccccccc-cccc-cccc-cccc-cccccccccccc', 5), -- AC

-- Modern City Apartment
('dddddddd-dddd-dddd-dddd-dddddddddddd', 1), -- WiFi
('dddddddd-dddd-dddd-dddd-dddddddddddd', 3), -- Kitchen
('dddddddd-dddd-dddd-dddd-dddddddddddd', 6); -- Washer

-- 📅 Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status) VALUES
-- Emma's bookings
('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', '2023-06-15', '2023-06-20', 1250.00, 'confirmed'),
('ffffffff-ffff-ffff-ffff-ffffffffffff', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', '2023-07-10', '2023-07-17', 2800.00, 'confirmed'),

-- James' bookings
('gggggggg-gggg-gggg-gggg-gggggggggggg', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '55555555-5555-5555-5555-555555555555', '2023-08-05', '2023-08-12', 1260.00, 'pending');

-- 💳 Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method) VALUES
('hhhhhhhh-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', 1250.00, 'credit_card'),
('iiiiiiii-iiii-iiii-iiii-iiiiiiiiiiii', 'ffffffff-ffff-ffff-ffff-ffffffffffff', 2800.00, 'paypal');

-- ⭐ Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
('jjjjjjjj-jjjj-jjjj-jjjj-jjjjjjjjjjjj', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', 5, 'Amazing location and beautiful space!'),
('kkkkkkkk-kkkk-kkkk-kkkk-kkkkkkkkkkkk', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', 4, 'Great villa, but the WiFi was spotty');

-- ✉️ Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
('llllllll-llll-llll-llll-llllllllllll', '44444444-4444-4444-4444-444444444444', '22222222-2222-2222-2222-222222222222', 'Hi Sarah, is the loft pet-friendly?'),
('mmmmmmmm-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222', '44444444-4444-4444-4444-444444444444', 'Yes Emma, we allow small dogs under 25lbs!');
