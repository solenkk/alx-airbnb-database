# 🏠 Airbnb Database Requirements

## 📌 Core Entities & Attributes

### 👤 **User**
- `user_id` (Primary Key) - UUID, Indexed  
- `first_name` - VARCHAR, NOT NULL  
- `last_name` - VARCHAR, NOT NULL  
- `email` - VARCHAR, UNIQUE, NOT NULL  
- `password_hash` - VARCHAR, NOT NULL  
- `phone_number` - VARCHAR, NULLABLE  
- `role` - ENUM('guest', 'host', 'admin'), NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 🏡 **Property**
- `property_id` (Primary Key) - UUID, Indexed  
- `host_id` (Foreign Key → User) - NOT NULL  
- `name` - VARCHAR, NOT NULL  
- `description` - TEXT, NOT NULL  
- `location` - VARCHAR, NOT NULL  
- `price_per_night` - DECIMAL, NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `updated_at` - TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

### 📅 **Booking**
- `booking_id` (Primary Key) - UUID, Indexed  
- `property_id` (Foreign Key → Property) - NOT NULL  
- `user_id` (Foreign Key → User) - NOT NULL  
- `start_date` - DATE, NOT NULL  
- `end_date` - DATE, NOT NULL  
- `total_price` - DECIMAL, NOT NULL  
- `status` - ENUM('pending', 'confirmed', 'canceled'), NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 💳 **Payment**
- `payment_id` (Primary Key) - UUID, Indexed  
- `booking_id` (Foreign Key → Booking) - NOT NULL  
- `amount` - DECIMAL, NOT NULL  
- `payment_date` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `payment_method` - ENUM('credit_card', 'paypal', 'stripe'), NOT NULL  

### ⭐ **Review**
- `review_id` (Primary Key) - UUID, Indexed  
- `property_id` (Foreign Key → Property) - NOT NULL  
- `user_id` (Foreign Key → User) - NOT NULL  
- `rating` - INTEGER, CHECK (1 <= rating <= 5), NOT NULL  
- `comment` - TEXT, NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### ✉️ **Message**
- `message_id` (Primary Key) - UUID, Indexed  
- `sender_id` (Foreign Key → User) - NOT NULL  
- `recipient_id` (Foreign Key → User) - NOT NULL  
- `message_body` - TEXT, NOT NULL  
- `sent_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

## 🔗 Key Relationships
- **User → Property** (1:N) - One host can own multiple properties  
- **User → Booking** (1:N) - One guest can make multiple bookings  
- **Property → Booking** (1:N) - One property can have multiple bookings  
- **Booking → Payment** (1:1) - One booking has one payment  
- **Property → Review** (1:N) - One property can have multiple reviews  
- **User → Message** (1:N) - Users can send/receive multiple messages  

## 🔒 Constraints & Indexes
### 🛡️ Data Integrity
- All **NOT NULL** fields enforced  
- **UNIQUE** constraint on `User.email`  
- **FOREIGN KEY** constraints on all relationships  
- **ENUM** validation for statuses/roles  
- **RATING** must be 1-5 (Review table)  

### ⚡ Performance Optimizations
- **Primary Keys** automatically indexed  
- Additional indexes on:  
  - `User.email` (frequent lookups)  
  - `Property.host_id` (host queries)  
  - `Booking.property_id` & `Booking.user_id` (search filters)  

## 🎯 Next Steps
1. Implement this schema in `schema.sql`  
2. Create sample data in `seed_data.sql`  
3. Generate ER diagram (`airbnb_erd.png`)

![Untitled](https://github.com/user-attachments/assets/9c412320-66a9-41b8-8e5a-12b2c77842f0)


