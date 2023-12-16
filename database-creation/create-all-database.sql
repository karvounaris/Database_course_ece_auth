CREATE DATABASE world_disasters ;

USE world_disasters  ; 
-- Create the disaster table
CREATE TABLE disaster (
    Disaster_ID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Disaster_name VARCHAR(255) NOT NULL,
    start_date DATE,
    stop_date DATE,
    deaths INT,
    injured INT,
    missing INT,
    air_quality ENUM('very low', 'low', 'medium', 'high', 'very high'),
    water_quality ENUM('very low', 'low', 'medium', 'high', 'very high'),
    Continent ENUM('Africa', 'Antarctica', 'Asia', 'Europe', 'North America', 'Oceania', 'South America'),
    center_latitude DECIMAL(9, 6),
    center_longitude DECIMAL(9, 6),
    radius INT,
    type ENUM('Human', 'Natural'),
    Base_location VARCHAR(255)
);

-- Insert 10 rows into the disaster table
INSERT INTO disaster (
    Disaster_name, start_date, stop_date, deaths, injured, missing,
    air_quality, water_quality, Continent, center_latitude, center_longitude,
    radius, type, Base_location
)
VALUES
('Earthquake1', '2023-01-01', '2023-01-02', 100, 500, 20, 'medium', 'low', 'Asia', 35.6895, 139.6917, 50, 'Natural', 'CityA'),
('Flood2', '2023-02-15', '2023-02-18', 50, 200, 10, 'high', 'medium', 'North America', 40.7128, -74.0060, 30, 'Natural', 'CityB'),
('Wildfire3', '2023-03-20', '2023-03-25', 30, 100, 5, 'very high', 'low', 'Oceania', -33.8688, 151.2093, 40, 'Natural', 'CityC'),
('Hurricane4', '2023-04-10', '2023-04-15', 200, 1000, 50, 'high', 'high', 'North America', 29.7604, -95.3698, 60, 'Natural', 'CityD'),
('Tornado5', '2023-05-05', '2023-05-06', 10, 50, 2, 'low', 'very low', 'Europe', 51.5074, -0.1278, 20, 'Natural', 'CityE'),
('Drought6', '2023-06-10', '2023-09-10', 0, 0, 0, 'very low', 'very high', 'Africa', -1.2921, 36.8219, 100, 'Natural', 'CityF'),
('Volcano7', '2023-07-20', '2023-07-25', 50, 300, 15, 'medium', 'medium', 'South America', -12.0464, -77.0428, 50, 'Natural', 'CityG'),
('Blizzard8', '2023-08-15', '2023-08-20', 20, 150, 8, 'low', 'high', 'Europe', 55.7558, 37.6176, 30, 'Natural', 'CityH'),
('IndustrialAccident9', '2023-09-05', '2023-09-06', 5, 20, 1, 'medium', 'medium', 'Asia', 31.2304, 121.4737, 10, 'Human', 'CityI'),
('Tsunami10', '2023-10-12', '2023-10-15', 150, 800, 30, 'high', 'medium', 'Oceania', -36.8485, 174.7633, 70, 'Natural', 'CityJ');


-- Create the human_disaster table
CREATE TABLE human_disaster (
    Disaster_ID INT PRIMARY KEY,
    intentionality BOOLEAN,
    predictability FLOAT CHECK (predictability >= 0 AND predictability <= 1),
    FOREIGN KEY (Disaster_ID) REFERENCES disaster(Disaster_ID)
);


INSERT INTO human_disaster 
SELECT Disaster_ID , TRUE AS intentionality , 0.22 AS predictability 
FROM disaster
WHERE type = 'human' ; 

-- Create the Natural_Disaster table
CREATE TABLE Natural_Disaster (
    disaster_id INT PRIMARY KEY,
    intensity FLOAT,
    unit_measurement VARCHAR(255),
    FOREIGN KEY (disaster_id) REFERENCES disaster(disaster_id)
);


INSERT INTO Natural_Disaster 
SELECT Disaster_ID , 2.5 AS intensity , 'Richter ' AS unit_measurement 
FROM disaster
WHERE type = 'natural' ; 


-- Create the Media_article table
CREATE TABLE Media_article (
    title VARCHAR(255),
    author VARCHAR(255),
    PRIMARY KEY (title, author),
    media_type ENUM('Print', 'Online', 'TV', 'Radio'),
    publication_date DATE,
    origin_country VARCHAR(255),
    disaster_id INT,
    FOREIGN KEY (disaster_id) REFERENCES disaster(disaster_id)
);

-- Insert 10 rows into the Media_article table
INSERT INTO Media_article (title, author, media_type, publication_date, origin_country, disaster_id)
VALUES
('Article1', 'AuthorA', 'Print', '2023-01-05', 'CountryA', 1),
('Article2', 'AuthorB', 'Online', '2023-02-10', 'CountryB', 2),
('Article3', 'AuthorC', 'TV', '2023-03-15', 'CountryC', 3),
('Article4', 'AuthorD', 'Radio', '2023-04-20', 'CountryD', 4),
('Article5', 'AuthorE', 'Print', '2023-05-25', 'CountryE', 5),
('Article6', 'AuthorF', 'Online', '2023-06-30', 'CountryF', 6),
('Article7', 'AuthorG', 'TV', '2023-07-05', 'CountryG', 7),
('Article8', 'AuthorH', 'Radio', '2023-08-10', 'CountryH', 8),
('Article9', 'AuthorI', 'Print', '2023-09-15', 'CountryI', 9),
('Article10', 'AuthorJ', 'Online', '2023-10-20', 'CountryJ', 10);


-- Create the Person table
CREATE TABLE Person (
    person_id INT PRIMARY KEY AUTO_INCREMENT,
    age INT,
    person_name VARCHAR(255),
    person_surname VARCHAR(255),
    gender ENUM('Male', 'Female'),
    nationality VARCHAR(255),
    status ENUM('Missing', 'Dead', 'Injured', 'Evacuated')
);

-- Insert 10 rows into the Person table
INSERT INTO Person (age, person_name, person_surname, gender, nationality, status)
VALUES
(25, 'John', 'Doe', 'Male', 'USA', 'Evacuated'),
(32, 'Jane', 'Smith', 'Female', 'Canada', 'Injured'),
(45, 'Michael', 'Johnson', 'Male', 'UK', 'Missing'),
(28, 'Emily', 'Williams', 'Female', 'Australia', 'Dead'),
(38, 'Robert', 'Brown', 'Male', 'Germany', 'Evacuated'),
(22, 'Sophia', 'Taylor', 'Female', 'France', 'Injured'),
(50, 'David', 'Miller', 'Male', 'Italy', 'Missing'),
(33, 'Olivia', 'Anderson', 'Female', 'Spain', 'Dead'),
(29, 'Daniel', 'Martin', 'Male', 'Brazil', 'Evacuated'),
(40, 'Ava', 'Garcia', 'Female', 'Mexico', 'Injured');


-- Create the disaster_affected_person table
CREATE TABLE disaster_affected_person (
    disaster_id INT,
    person_id INT,
    PRIMARY KEY (disaster_id, person_id),
    FOREIGN KEY (disaster_id) REFERENCES disaster(disaster_id),
    FOREIGN KEY (person_id) REFERENCES Person(person_id)
);

-- Insert 10 rows into the disaster_affected_person table
INSERT INTO disaster_affected_person (disaster_id, person_id)
VALUES
(1, 1), -- Disaster ID 1, Person ID 1
(2, 2), -- Disaster ID 2, Person ID 2
(3, 3), -- Disaster ID 3, Person ID 3
(4, 4), -- Disaster ID 4, Person ID 4
(5, 5), -- Disaster ID 5, Person ID 5
(6, 6), -- Disaster ID 6, Person ID 6
(7, 7), -- Disaster ID 7, Person ID 7
(8, 8), -- Disaster ID 8, Person ID 8
(9, 9), -- Disaster ID 9, Person ID 9
(10, 10); -- Disaster ID 10, Person ID 10

 
-- USE world_disasters;

-- Create the Country table
CREATE TABLE Country (
    population INT,
    GDP DECIMAL(10, 2),
    country_name VARCHAR(255) PRIMARY KEY NOT NULL
);

-- Insert 10 rows into the Country table
INSERT INTO Country (population, GDP, country_name)
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



-- USE world_disasters;


-- Create the disaster_situation table with the foreign key
CREATE TABLE disaster_situation (
    RGDP INT,
    disasterSituationID  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    financial_aid DECIMAL(10, 2),
    recovery_time INT,
    Total_cost DECIMAL(10, 2),
    Plan_title VARCHAR(255),
    country_name VARCHAR(255),
    disaster_id INT,
    FOREIGN KEY (country_name) REFERENCES Country(country_name), 
    FOREIGN KEY (disaster_id) REFERENCES Disaster(Disaster_ID)
);


-- Insert 10 rows into the disaster_situation table with the foreign key
INSERT INTO disaster_situation (RGDP, financial_aid, recovery_time, Total_cost, Plan_title, country_name, disaster_id)
VALUES
(1, 5000.00, 30, 100000.00, 'Recovery Plan A', 'CountryA', 1),
(2, 10000.00, 45, 150000.00, 'Recovery Plan B', 'CountryB', 2),
(3, 7500.00, 25, 120000.00, 'Recovery Plan C', 'CountryC', 3),
(4, 12000.00, 40, 180000.00, 'Recovery Plan D', 'CountryD', 4),
(5, 8000.00, 35, 130000.00, 'Recovery Plan E', 'CountryE', 5),
(6, 15000.00, 50, 200000.00, 'Recovery Plan F', 'CountryF', 6),
(7, 9000.00, 28, 140000.00, 'Recovery Plan G', 'CountryG', 7),
(8, 11000.00, 42, 160000.00, 'Recovery Plan H', 'CountryH', 8),
(9, 9500.00, 32, 170000.00, 'Recovery Plan I', 'CountryI', 9),
(10, 13000.00, 48, 220000.00, 'Recovery Plan J', 'CountryJ', 10);




-- USE world_disasters;

-- Create the NGO table
CREATE TABLE NGO (
    website VARCHAR(255),
    organisation_name VARCHAR(255),
    organisation_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    contact_num VARCHAR(20),
    email VARCHAR(255)
);

-- Insert 10 rows into the NGO table
INSERT INTO NGO (website, organisation_name, contact_num, email)
VALUES
('https://www.ngo1.org', 'NGO1', '+1234567890', 'info@ngo1.org'),
('https://www.ngo2.org', 'NGO2', '+9876543210', 'info@ngo2.org'),
('https://www.ngo3.org', 'NGO3', '+1112233445', 'info@ngo3.org'),
('https://www.ngo4.org', 'NGO4', '+5544333221', 'info@ngo4.org'),
('https://www.ngo5.org', 'NGO5', '+8899776655', 'info@ngo5.org'),
('https://www.ngo6.org', 'NGO6', '+6677889900', 'info@ngo6.org'),
('https://www.ngo7.org', 'NGO7', '+1122334455', 'info@ngo7.org'),
('https://www.ngo8.org', 'NGO8', '+7788990011', 'info@ngo8.org'),
('https://www.ngo9.org', 'NGO9', '+4455667788', 'info@ngo9.org'),
('https://www.ngo10.org', 'NGO10', '+9900112233', 'info@ngo10.org');


-- Create the ngo_responds_to_country table
CREATE TABLE ngo_responds_to_country (
    organization_id INT,
    disaster_situation_id INT,
    PRIMARY KEY (organization_id, disaster_situation_id),
    FOREIGN KEY (organization_id) REFERENCES NGO(organisation_id),
    FOREIGN KEY (disaster_situation_id) REFERENCES disaster_situation(disasterSituationID)
);

-- Insert 10 rows into the ngo_responds_to_country table
INSERT INTO ngo_responds_to_country (organization_id, disaster_situation_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Create the National_Emergency_Agency table
CREATE TABLE National_Emergency_Agency (
    agency_name VARCHAR(255),
    country_name VARCHAR(255),
    PRIMARY KEY (agency_name, country_name),
    FOREIGN KEY (country_name) REFERENCES Country(country_name),
    website VARCHAR(255),
    email VARCHAR(255),
    contact_number VARCHAR(20)
);

-- Insert 10 rows into the National_Emergency_Agency table
INSERT INTO National_Emergency_Agency (agency_name, country_name, website, email, contact_number)
VALUES
('AgencyA', 'CountryA', 'www.agencya.com', 'agencya@example.com', '+1234567890'),
('AgencyB', 'CountryB', 'www.agencyb.com', 'agencyb@example.com', '+9876543210'),
('AgencyC', 'CountryC', 'www.agencyc.com', 'agencyc@example.com', '+1112223333'),
('AgencyD', 'CountryD', 'www.agencyd.com', 'agencyd@example.com', '+4445556666'),
('AgencyE', 'CountryE', 'www.agencye.com', 'agencye@example.com', '+7778889999'),
('AgencyF', 'CountryF', 'www.agencyf.com', 'agencyf@example.com', '+3332221111'),
('AgencyG', 'CountryG', 'www.agencyg.com', 'agencyg@example.com', '+6669998888'),
('AgencyH', 'CountryH', 'www.agencyh.com', 'agencyh@example.com', '+0001112222'),
('AgencyI', 'CountryI', 'www.agencyi.com', 'agencyi@example.com', '+4443332222'),
('AgencyJ', 'CountryJ', 'www.agencyj.com', 'agencyj@example.com', '+5556667777');


-- Create the NEA_helped_country table
CREATE TABLE NEA_helped_country (
    disaster_situation_id INT,
    agency_name VARCHAR(255),
    country_name VARCHAR(255),
    PRIMARY KEY (disaster_situation_id, agency_name, country_name),
    FOREIGN KEY (disaster_situation_id) REFERENCES disaster_situation(disasterSituationID),
    FOREIGN KEY (agency_name) REFERENCES National_Emergency_Agency(agency_name),
    FOREIGN KEY (country_name) REFERENCES Country(country_name)
);


-- Insert 10 rows into the NEA_helped_country table
INSERT INTO NEA_helped_country (disaster_situation_id, agency_name, country_name)
VALUES
(1, 'AgencyA', 'CountryA'),
(2, 'AgencyB', 'CountryB'),
(3, 'AgencyC', 'CountryC'),
(4, 'AgencyD', 'CountryD'),
(5, 'AgencyE', 'CountryE'),
(6, 'AgencyF', 'CountryF'),
(7, 'AgencyG', 'CountryG'),
(8, 'AgencyH', 'CountryH'),
(9, 'AgencyI', 'CountryI'),
(10, 'AgencyJ', 'CountryJ');


-- Create the Disease table
CREATE TABLE Disease (
    disease_id INT AUTO_INCREMENT NOT NULL,
    disaster_situation_id INT,
    PRIMARY KEY (disease_id, disaster_situation_id),
    FOREIGN KEY (disaster_situation_id) REFERENCES disaster_situation(disasterSituationID),
    disease_name VARCHAR(255),
    affected INT,
    disease_type VARCHAR(255),
    pandemic BOOLEAN
);

-- Insert 10 rows into the Disease table
INSERT INTO Disease (disaster_situation_id, disease_name, affected, disease_type, pandemic)
VALUES
(1, 'Influenza', 5000, 'Viral', TRUE),
(2, 'Cholera', 200, 'Bacterial', FALSE),
(3, 'Malaria', 1500, 'Parasitic', TRUE),
(4, 'Dengue Fever', 800, 'Viral', FALSE),
(5, 'Ebola', 1200, 'Viral', TRUE),
(6, 'Typhoid', 300, 'Bacterial', FALSE),
(7, 'Zika Virus', 100, 'Viral', FALSE),
(8, 'HIV/AIDS', 10000, 'Viral', TRUE),
(9, 'Tuberculosis', 1500, 'Bacterial', FALSE),
(10, 'COVID-19', 50000, 'Viral', TRUE);


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
