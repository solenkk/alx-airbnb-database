implement partitioning on the Booking table based on the start_date column. Save the query in a
file partitioning.sql

-- Create the partitioned parent table
CREATE TABLE Booking (
    booking_id SERIAL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    -- other columns as needed
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);
-- Create partitions for different time periods
-- Historical data (before 2023)
CREATE TABLE booking_historical PARTITION OF Booking
    FOR VALUES FROM (MINVALUE) TO ('2023-01-01');

-- 2023 data
CREATE TABLE booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- 2024 data
CREATE TABLE booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Future data (2025 and beyond)
CREATE TABLE booking_future PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO (MAXVALUE);
