CREATE DATABASE world_disasters;

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
