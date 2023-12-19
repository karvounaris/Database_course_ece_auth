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
('Chernobyl Disaster', '1986-05-26', '1986-05-26', 93000, 1000, 0, 'low', 'low', 'Europe', 51.4, 30.1, 30, 'Human', 'Pripyat'),
('Tohoku Earthquake and Tsunami', '2011-03-11', '2011-03-11', 15899, 6000, 2500, 'medium', 'very low', 'Asia', 38.322, 142.369, 10, 'Natural', 'Honsu Island'),
('China Floods', '1931-07-20', '1931-08-25', 3000000, 1000000, 2000000, 'low', 'very low', 'Asia', 30, 112, 1.8, 'Natural', 'Central China'),
('Turkey-Syria Earthquakes', '2023-02-06', '2023-02-15', 50000, 20000, 5000, 'medium', 'medium', 'Asia', 37.0662, 37.3833, 100, 'Natural', 'Southwest Turkey and northwest Syria'),
('BP Deepwater Horizon Oil Rig Spill', '2010-05-20', '2010-09-19', 11, 17, 0, 'low', 'very low', 'North America', 27.736, -88.386, 600, 'Human', 'Gulf of Mexico'),
('Minamata Mercury Poisoning', '1956-03-20', '1968-05-26', 1784, 2265, 0, 'high', 'very low', 'Asia', 32.2169, 130.4, 300, 'Natural', 'Kumanoto Prefecture');


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
('Chernobyl: 30 Years of Living with the Fallout', 'Olga Ivanova', 'Print', '2016-4-26', 'Ukraine', 1),
('Nuclear Safety in the Post-Chernobyl World', 'Richard Green', 'Print', '2016-5-10', 'United States', 1),
('Tohoku Ten Years On: Rebuilding and Remembering', 'Naomi Kikuchi', 'Online', '2021-3-11', 'Japan', 2),
('Seismic Lessons: The 2011 Tohoku Earthquake', 'Johnathan Smith', 'Print', '2012-9-20', 'United Kingdom', 2),
('The Great Floods of 1931: An Historical Perspective', 'Zhang Wei', 'Print', '2005-7-15', 'China', 3),
('In the Wake of Tragedy: The Turkey-Syria Earthquake', 'Lina Al-Khaled', 'TV', '2023-2-15', 'Turkey', 4),
('Deepwater Horizon: A Decade Later', 'Emily Nguyen', 'Print', '2020-4-20', 'United States', 5);


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
INSERT INTO Person (person_id , age, person_name, person_surname, gender, nationality, status)
VALUES
(105, 34, 'Ivan', 'Kuznetsov', 'Male', 'Russian', 'Dead'),
(106, 29, 'Elena', 'Petrova', 'Female', 'Ukrainian', 'Evacuated'),
(108, 41, 'Hiroshi', 'Sato', 'Male', 'Japanese', 'Missing'),
(256, 36, 'Keiko', 'Ishikawa', 'Female', 'Japanese', 'Evacuated'),
(177, 39, 'Li', 'Wei', 'Male', 'Chinese', 'Missing'),
(188, 33, 'Chen', 'Yue', 'Female', 'Chinese', 'Dead'),
(352, 47, 'Mehmet', 'Ozcan', 'Male', 'Turkish', 'Injured'),
(446, 54, 'Amina', 'Hassan', 'Female', 'Syrian', 'Dead'),
(125, 45, 'James', 'Carter', 'Male', 'American', 'Injured'),
(139, 37, 'Maria', 'Rodriquez', 'Female', 'American', 'Dead'),
(101, 32, 'Akira', 'Tanaka', 'Male', 'Japanese', 'Injured'),
(207, 28, 'Yumi', 'Nakamura', 'Female', 'Japanese', 'Dead');


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
(1, 105),
(1, 106),
(2, 108),
(2, 256),
(3, 177),
(3, 188),
(4, 352),
(4, 446),
(5, 125),
(5, 139),
(6, 101),
(6, 207);

 
-- USE world_disasters;

-- Create the Country table
CREATE TABLE Country (
    population INT,
    GDP BIGINT,
    country_name VARCHAR(255) PRIMARY KEY NOT NULL
);

-- Insert 10 rows into the Country table
INSERT INTO Country (population, GDP, country_name)
VALUES
(41000000, 535000000000, 'Ukraine'),
(125000000, 6000000000000, 'Japan'),
(1400000000, 25000000000000, 'China'),
(84000000, 2400000000000, 'Turkey'),
(17000000, 40000000000, 'Syria'),
(331000000, 22000000000000, 'United States');



-- USE world_disasters;


-- Create the disaster_situation table with the foreign key
CREATE TABLE disaster_situation (
    RGDP BIGINT,
    disasterSituationID  INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    financial_aid BIGINT,
    recovery_time INT,
    Total_cost BIGINT,
    Plan_title VARCHAR(255),
    country_name VARCHAR(255),
    disaster_id INT,
    FOREIGN KEY (country_name) REFERENCES Country(country_name), 
    FOREIGN KEY (disaster_id) REFERENCES Disaster(Disaster_ID)
);


-- Insert 10 rows into the disaster_situation table with the foreign key
INSERT INTO disaster_situation (RGDP, financial_aid, recovery_time, Total_cost, Plan_title, country_name, disaster_id)
VALUES
(70000000000, 600000000, 6, 235000000000, 'Chernobyl Recovery and Development Program', 'Ukraine', 1),
(50000000000, 50000000000, 120, 360000000000, 'Great East Japan Earthquake Recovery Plan', 'Japan', 2),
(70000000000, 70000000000, 26, 270000000000, 'Huang He Flood Control and Relief effort', 'China', 3),
(10000000000, 10000000000, 60, 50000000000, 'Anatolian Earthquake Recovery and Reconstruction Program', 'Turkey', 4),
(2000000000, 2000000000, 84, 15000000000, 'Syrian Earthquake Rehabilitation Initiative', 'Syria', 4),
(20000000000, 20000000000, 60, 40000000000, 'Gulf Coast Restoration Initiative', 'United States', 5),
(3000000000, 3000000000, 3, 600000000000000, 'Minamata Disease Relief and Rehabilitation Plan', 'Japan', 6);




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
('www.cchf.ua', 'Chernobyl Children''s Health Fund', '+380-44-555-9876', 'care@cchf.ua'),
('www.nsa.org.ua', 'Nuclear Safety Alliance', '+380-44-555-1122', 'info@nsa.org.ua'),
('www.trn.jp', 'Tohoku Recovery Network', '+81-22-555-6789', 'support@trn.jp'),
('www.jerf.jp', 'Japan Earthquake Relief Foundation', '+81-3-5550-4321', 'contact@jerf.jp'),
('www.cfralliance.cn', 'China Flood Relief Alliance', '+86-10-5550-1234', 'support@cfralliance.cn'),
('www.hdrf.cn', 'Historical Disaster Research & Aid Foundation', '+86-21-5550-7890', 'contact@hdrf.cn'),
('www.aea.tr', 'Anatolian Earthquake Assistance', '+90-312-555-0199', 'help@aea.tr'),
('www.shsg.sy', 'Syrian Humanitarian Support Group', '+963-11-555-9876', 'aid@shsg.sy'),
('www.olps.org', 'Ocean Life Preservation Society', '+1-800-555-0199', 'contact@olps.org'),
('www.gmai.jp', 'Global Mercury Awareness Initiative', '+81-3-5550-7894', 'support@gmai.jp');



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
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(8, 5),
(9, 6),
(10, 7);

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
('Ukraine National Radiation Safety Committee', 'Ukraine', 'www.unrsc.ua', 'safety@unrsc.ua', '+380-44-123-4567'),
('Chernobyl Disaster Response Unit', 'Ukraine', 'www.cdru.ua', 'response@cdru.ua', '+380-44-765-4321'),
('Japan Disaster Response Agency', 'Japan', 'www.jdramin.jp', 'contact@jdramin.jp', '+81-3-9876-5432'),
('Tohoku Regional Emergency Management Office', 'Japan', 'www.tremo.jp', 'info@tremo.jp', '+81-22-1234-5678'),
('China National Flood Relief Commission', 'China', 'www.cnfrc.cn', 'support@cnfrc.cn', '+86-10-1234-5678'),
('Turkey National Disaster Response Agency', 'Turkey', 'www.tndra.tr', 'helpdesk@tndra.tr', '+90-312-123-45-67'),
('Syria Crisis Management Authority', 'Syria', 'www.scma.sy', 'contact@scma.sy', '+963-11-987-6543'),
('U.S. Environmental Protection Agency Gulf', 'United States', 'www.epagulfresponse.us', 'response@epagulf.us', '+1-800-123-4567'),
('Gulf Coast Disaster Management Authority', 'United States', 'www.gcdma.us', 'info@gcdma.us', '+1-800-987-6543'),
('Japan Environmental Health Organization', 'Japan', 'www.jeho.jp', 'contact@jeho.jp', '+81-3-1234-5678'),
('Kumamoto Prefecture Health Bureau', 'Japan', 'www.kphb.kumamoto.jp', 'healthbureau@kumamoto.jp', '+81-96-1234-5678');


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
(1, 'Ukraine National Radiation Safety Committee', 'Ukraine'),
(1, 'Chernobyl Disaster Response Unit', 'Ukraine'),
(2, 'Japan Disaster Response Agency', 'Japan'),
(2, 'Tohoku Regional Emergency Management Office', 'Japan'),
(3, 'China National Flood Relief Commission', 'China'),
(4, 'Turkey National Disaster Response Agency', 'Turkey'),
(5, 'Syria Crisis Management Authority', 'Syria'),
(6, 'U.S. Environmental Protection Agency Gulf', 'United States'),
(6, 'Gulf Coast Disaster Management Authority', 'United States'),
(7, 'Japan Environmental Health Organization', 'Japan'),
(7, 'Kumamoto Prefecture Health Bureau', 'Japan');


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
(1, 'Radiation Sickness', 4000, 'Radiation-induced illness', FALSE),
(1, 'Chernobyl Theroid Cancer', 6000, 'Cancer', FALSE),
(2, 'Earthquake Trauma', 1000, 'Mental', FALSE),
(2, 'Post-Tsunami Infectious Disease', 1500, 'Various Infections', FALSE),
(3, 'Flood-Related Gastrointestinal Infection', 20000, 'Gastrointestinal Infection', FALSE),
(3, 'Flood-induced Respiratory illness', 10000, 'Respiratory illness', FALSE),
(4, 'Earthquake-induced PTSD', 5000, 'Mental', FALSE),
(5, 'Earthquake-induced PTSD', 7000, 'Mental', FALSE),
(5, 'Post-Disaster Infectious', 2000, 'Infectious Disease', FALSE),
(6, 'Oil Spill Dermatitis', 1000, 'Physical', FALSE),
(6, 'Gulf Respiratory Syndrome', 2500, 'Respiratory Illness', FALSE),
(7, 'Minamata Disease', 2000, 'Neurological Disorder', FALSE);


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
('Pripyat Central Plaza', 3, '07270', 1, TRUE, 'DESTROYED', 1970, 0),
('Nuclear Avenue', 18, '07270', 1, FALSE, 'PARTLY DESTROYED', 1975, 0),
('Sendai Shoreline Road', 256, '980-0823', 2, FALSE , 'DESTROYED', 1980, 1000000),
('Yangtze Riverfront', 88, '443300', 3, FALSE, 'DESTROYED', 1920, 2000000),
('Gaziantep Boulevard', 101, '27000', 4, FALSE, 'DESTROYED', 1990, 2000000),
('Aleppo Historic Street', 47, 'SYR-2111', 5, TRUE, 'PARTLY DESTROYED', 1850, 3000000),
('Marina Drive', 220, '70130', 6, FALSE, 'PARTLY DESTROYED', 1985, 500000),
('Minamata Bay Road', 77, '867-0055', 7, TRUE, 'MAJOR ISSUES', 1950, 100000);

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
INSERT INTO Donation_Center (street, street_number, postal_code, country_name, opening_hour, closing_hour, donation_type)
VALUES
('Pripyat Bypass', 47, '07270', 'Ukraine', '07:00:00', '18:00:00', 'money'),
('Heroes of Chernobyl', 89, '07400', 'Ukraine', '9:00:00', '17:00:00', 'goods'),
('Fukushima Street', 15, '9608111', 'Japan', '8:00:00', '19:00:00', 'effort'),
('Hubei Road', 256, '430000', 'China', '8:00:00', '19:00:00', 'effort'),
('Gaziantep Avenue', 340, '27000', 'Turkey', '6:00:00', '22:00:00', 'goods'),
('Aleppo Relief Road', 112, '2111', 'Syria', '8:00:00', '19:00:00', 'money'),
('Gulf Shore Drive', 1020, '32541', 'United States', '8:00:00', '20:00:00', 'effort'),
('Coastal Avenue', 458, '70130', 'United States', '6:00:00', '21:00:00', 'goods'),
('Kuma River Road', 591, '8691234', 'Japan', '8:00:00', '19:00:00', 'effort');
