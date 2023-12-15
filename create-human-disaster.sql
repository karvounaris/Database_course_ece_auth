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