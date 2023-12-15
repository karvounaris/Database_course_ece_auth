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
