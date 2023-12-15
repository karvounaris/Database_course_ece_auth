
USE world_disasters;


-- Create the disaster_situation table with the foreign key
CREATE TABLE disaster_situation (
    RGDB INT,
    disasterSituationID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    financial_aid DECIMAL(10, 2),
    recovery_time INT,
    Total_cost DECIMAL(10, 2),
    Plan_title VARCHAR(255),
    country_name VARCHAR(255),
    CONSTRAINT fk_disaster_country
    FOREIGN KEY (country_name) REFERENCES Country(country_name),
	FOREIGN KEY (disasterSituationID) REFERENCES Disaster(Disaster_ID)
);

-- Insert 10 rows into the disaster_situation table with the foreign key
INSERT INTO disaster_situation (RGDB, financial_aid, recovery_time, Total_cost, Plan_title, country_name)
VALUES
(1, 5000.00, 30, 100000.00, 'Recovery Plan A', 'CountryA'),
(2, 10000.00, 45, 150000.00, 'Recovery Plan B', 'CountryB'),
(3, 7500.00, 25, 120000.00, 'Recovery Plan C', 'CountryC'),
(4, 12000.00, 40, 180000.00, 'Recovery Plan D', 'CountryD'),
(5, 8000.00, 35, 130000.00, 'Recovery Plan E', 'CountryE'),
(6, 15000.00, 50, 200000.00, 'Recovery Plan F', 'CountryF'),
(7, 9000.00, 28, 140000.00, 'Recovery Plan G', 'CountryG'),
(8, 11000.00, 42, 160000.00, 'Recovery Plan H', 'CountryH'),
(9, 9500.00, 32, 170000.00, 'Recovery Plan I', 'CountryI'),
(10, 13000.00, 48, 220000.00, 'Recovery Plan J', 'CountryJ');




