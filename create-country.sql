
USE world_disasters;

-- Create the Country table
CREATE TABLE Country (
    population INT,
    GDB DECIMAL(10, 2),
    country_name VARCHAR(255) PRIMARY KEY NOT NULL
);

-- Insert 10 rows into the Country table
INSERT INTO Country (population, GDB, country_name)
VALUES
(10000000, 500000.00, 'CountryA'),
(5000000, 200000.00, 'CountryB'),
(8000000, 400000.00, 'CountryC'),
(12000000, 600000.00, 'CountryD'),
(3000000, 150000.00, 'CountryE'),
(7000000, 300000.00, 'CountryF'),
(9000000, 450000.00, 'CountryG'),
(6000000, 250000.00, 'CountryH'),
(11000000, 550000.00, 'CountryI'),
(15000000, 750000.00, 'CountryJ');
