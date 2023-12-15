-- Create the Building table
CREATE TABLE Building (
    street VARCHAR(255),
    street_number VARCHAR(10),
    postal_code VARCHAR(20),
    disasterSituationID INT,
    PRIMARY KEY (street, street_number, postal_code, disasterSituationID),
    FOREIGN KEY (disasterSituationID) REFERENCES disaster_situation(disasterSituationID),
    monument BOOLEAN,
    damage_type ENUM('DESTROYED', 'PARTLY DESTROYED', 'MAJOR ISSUES', 'MINOR ISSUES'),
    reconstruction_cost DECIMAL(10, 2),
    constructed_year INT
);

-- Insert 10 rows into the Building table
INSERT INTO Building (street, street_number, postal_code, disasterSituationID, monument, damage_type, reconstruction_cost, constructed_year)
VALUES
('Main Street', '123', 'ABC123', 1, TRUE, 'DESTROYED', 50000.00, 1990),
('Oak Avenue', '456', 'XYZ789', 2, FALSE, 'PARTLY DESTROYED', 30000.00, 2005),
('Maple Lane', '789', 'DEF456', 3, TRUE, 'MAJOR ISSUES', 75000.00, 1985),
('Cedar Road', '101', 'GHI789', 4, FALSE, 'MINOR ISSUES', 20000.00, 2010),
('Pine Street', '202', 'JKL012', 5, TRUE, 'DESTROYED', 60000.00, 1980),
('Elm Avenue', '303', 'MNO345', 6, FALSE, 'PARTLY DESTROYED', 35000.00, 2008),
('Birch Lane', '404', 'PQR678', 7, TRUE, 'MAJOR ISSUES', 80000.00, 1975),
('Cypress Road', '505', 'STU901', 8, FALSE, 'MINOR ISSUES', 25000.00, 2015),
('Sycamore Street', '606', 'VWX234', 9, TRUE, 'DESTROYED', 70000.00, 1982),
('Willow Avenue', '707', 'YZA567', 10, FALSE, 'PARTLY DESTROYED', 40000.00, 2002);

