# 🏠 Airbnb Database Requirements (3NF Normalized)

## 📌 Core Entities & Attributes

### 👤 **User**
- `user_id` (Primary Key) - UUID, Indexed  
- `first_name` - VARCHAR(50), NOT NULL  
- `last_name` - VARCHAR(50), NOT NULL  
- `email` - VARCHAR(100), UNIQUE, NOT NULL  
- `password_hash` - VARCHAR(255), NOT NULL  
- `phone_number` - VARCHAR(20), NULLABLE  
- `role` - ENUM('guest', 'host', 'admin'), NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 🏡 **Property**
- `property_id` (Primary Key) - UUID, Indexed  
- `host_id` (Foreign Key → User) - NOT NULL  
- `type_id` (Foreign Key → Property_Type) - NOT NULL  
- `name` - VARCHAR(100), NOT NULL  
- `description` - TEXT, NOT NULL  
- `street_address` - VARCHAR(100), NOT NULL  
- `city` - VARCHAR(50), NOT NULL  
- `country` - VARCHAR(50), NOT NULL  
- `price_per_night` - DECIMAL(10,2), NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- `updated_at` - TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

### 🏷️ **Property_Type** (New)
- `type_id` (Primary Key) - INT, AUTO_INCREMENT  
- `name` - VARCHAR(50), UNIQUE, NOT NULL  
- `description` - TEXT  

### 🛋️ **Amenity** (New)
- `amenity_id` (Primary Key) - INT, AUTO_INCREMENT  
- `name` - VARCHAR(50), UNIQUE, NOT NULL  
- `icon_class` - VARCHAR(50)  

### 🔗 **Property_Amenity** (New Junction Table)
- `property_id` (Foreign Key → Property)  
- `amenity_id` (Foreign Key → Amenity)  
- Composite Primary Key (property_id, amenity_id)  

### 📅 **Booking**
- `booking_id` (Primary Key) - UUID, Indexed  
- `property_id` (Foreign Key → Property) - NOT NULL  
- `user_id` (Foreign Key → User) - NOT NULL  
- `start_date` - DATE, NOT NULL  
- `end_date` - DATE, NOT NULL  
- `total_price` - DECIMAL(10,2), NOT NULL  
- `status` - ENUM('pending', 'confirmed', 'canceled'), NOT NULL  
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 💳 **Payment**
- `payment_id` (Primary Key) - UUID, Indexed  
- `booking_id` (Foreign Key → Booking) - NOT NULL  
- `amount` - DECIMAL(10,2), NOT NULL  
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
- **User → Property** (1:N) - One host owns multiple properties  
- **Property → Property_Type** (N:1) - Many properties of same type  
- **Property ↔ Amenity** (M:N) - Properties have multiple amenities  
- **User → Booking** (1:N) - One user makes multiple bookings  
- **Property → Booking** (1:N) - One property has multiple bookings  
- **Booking → Payment** (1:1) - One booking has one payment  
- **Property → Review** (1:N) - One property gets multiple reviews  
- **User ↔ Message** (M:N) - Users exchange multiple messages  

## 🔒 Constraints & Indexes
### 🛡️ Data Integrity
- All **NOT NULL** fields enforced  
- **UNIQUE** constraints on:  
  - `User.email`  
  - `Property_Type.name`  
  - `Amenity.name`  
- **FOREIGN KEY** constraints on all relationships  
- **CHECK** constraints for rating (1-5) and valid dates  

### ⚡ Performance Optimizations
- **Primary Keys** automatically indexed  
- Additional indexes on:  
  - `User.email`  
  - `Property.host_id`, `Property.type_id`  
  - `Booking.property_id`, `Booking.user_id`  
  - `Review.property_id`, `Review.user_id`  
  - `Message.sender_id`, `Message.recipient_id`  

## 🎯 Next Steps
1. Implement in `schema.sql`  
2. Create sample data in `seed_data.sql`  
3. Generate ER diagram (`airbnb_erd.png`)  
4. Add migration script for existing deployments  

```sql
-- Sample migration for existing databases
ALTER TABLE properties 
ADD COLUMN type_id INT NOT NULL AFTER host_id,
ADD COLUMN street_address VARCHAR(100) NOT NULL,
ADD COLUMN city VARCHAR(50) NOT NULL,
ADD COLUMN country VARCHAR(50) NOT NULL;

CREATE TABLE property_types (...);
CREATE TABLE amenities (...);
CREATE TABLE property_amenities (...);
