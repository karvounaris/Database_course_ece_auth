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
