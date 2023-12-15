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
