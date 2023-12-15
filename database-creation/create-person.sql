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

 