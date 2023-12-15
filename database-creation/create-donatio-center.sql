-- Create the Donation_Center table
CREATE TABLE Donation_Center (
    street VARCHAR(255),
    street_number VARCHAR(10),
    postal_code VARCHAR(20),
    country_name VARCHAR(255),
    PRIMARY KEY (street, street_number, postal_code, country_name),
    FOREIGN KEY (country_name) REFERENCES Country(country_name),
    closing_hour TIME,
    donation_type VARCHAR(50),
    opening_hour TIME
);

-- Insert 10 rows into the Donation_Center table
INSERT INTO Donation_Center (street, street_number, postal_code, country_name, closing_hour, donation_type, opening_hour)
VALUES
('Main Street', '123', 'ABC123', 'CountryA', '18:00:00', 'Clothes', '09:00:00'),
('Oak Avenue', '456', 'XYZ789', 'CountryB', '17:30:00', 'Food', '08:30:00'),
('Maple Lane', '789', 'DEF456', 'CountryC', '18:30:00', 'Money', '09:30:00'),
('Cedar Road', '101', 'GHI789', 'CountryD', '17:00:00', 'Toys', '08:00:00'),
('Pine Street', '202', 'JKL012', 'CountryE', '19:00:00', 'Books', '10:00:00'),
('Elm Avenue', '303', 'MNO345', 'CountryF', '16:30:00', 'Electronics', '08:30:00'),
('Birch Lane', '404', 'PQR678', 'CountryG', '18:45:00', 'Furniture', '09:45:00'),
('Cypress Road', '505', 'STU901', 'CountryH', '17:15:00', 'Medical Supplies', '08:15:00'),
('Sycamore Street', '606', 'VWX234', 'CountryI', '18:15:00', 'Blankets', '09:15:00'),
('Willow Avenue', '707', 'YZA567', 'CountryJ', '17:45:00', 'Shoes', '08:45:00');
