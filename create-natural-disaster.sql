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