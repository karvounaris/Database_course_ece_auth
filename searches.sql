USE world_disasters ; 
SELECT * FROM disaster
WHERE start_date > '2023-07-01' ; 

SELECT d.Disaster_name , ds.Total_cost , ds.country_name  
FROM disaster d 
JOIN disaster_situation ds
ON d.disaster_id = ds.disaster_id ; 

-- poies katastrofes eginan e asia kai evropi 

SELECT * 
FROM disaster d  
WHERE d.continent = 'Asia' OR d.continent = 'Europe' ; 

-- poies katastrofes eginan se asia kai posous nekros agnooumenous travtaismenous eixan 

SELECT d.disaster_name , d.deaths  , d.injured , d.missing 
FROM disaster d 
WHERE d.continent = 'Asia' ;

-- posoi anthropoi ano ton 20 pethanan apo katastrofi chernobyl 

-- INSERT INTO disaster_affected_person (disaster_id, person_id)
-- VALUES
-- (1, 2), 
-- (1, 3), 
-- (1, 4), 
-- (1, 5), 
-- (1, 6), 
-- (1, 7), 
-- (1, 8) ;  

-- UPDATE disaster d  
-- SET d.disaster_name  =  'Chernobyl'  
-- WHERE d.disaster_name = 'Earthquake1' ; 

SELECT d.disaster_name ,COUNT(p.person_id)  
FROM disaster d
JOIN disaster_affected_person dap 
ON d.disaster_id = dap.disaster_id
JOIN person p ON dap.person_id = p.person_id
WHERE d.disaster_name = 'Chernobyl' AND p.age > 30
 