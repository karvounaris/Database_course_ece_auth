USE world_disasters ; 

#--------------1----------------------
CREATE VIEW disaster_date_deaths_cost AS
SELECT d.disaster_name, d.start_date, d.deaths, ds.total_cost
FROM disaster_situation as ds 
JOIN disaster as d ON ds.disaster_id = d.disaster_id ; 

SELECT  * FROM disaster_date_deaths_cost ; 

#------------2-------------------
CREATE VIEW people_affected_by_disasters AS
SELECT p.person_name, p.person_surname, p.age, d.disaster_name, d.Base_location, year(d.start_date) AS year
FROM disaster_affected_person as dap 
JOIN person as p ON dap.person_id = p.person_id
JOIN disaster as d ON dap.disaster_id = d.disaster_id ;

SELECT  * FROM people_affected_by_disasters ;

#-----------3----------------------
CREATE VIEW articles_about_disasters AS
SELECT d.disaster_name, ma.author, ma.title, ma.publication_date
FROM media_article as ma 
JOIN disaster as d ON ma.disaster_id = d.disaster_id ; 

SELECT  * FROM articles_about_disasters ;