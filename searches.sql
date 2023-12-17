USE world_disasters ; 
SELECT * FROM disaster
WHERE start_date > '2023-07-01' ; 

SELECT d.Disaster_name , ds.Total_cost , ds.country_name  
FROM disaster d 
JOIN disaster_situation ds
ON d.disaster_id = ds.disaster_id ; 

-- 1. poies katastrofes eginan e asia kai evropi 

SELECT * 
FROM disaster d  
WHERE d.continent = 'Asia' OR d.continent = 'Europe' ; 

-- 2. poies katastrofes eginan se asia kai posous nekros agnooumenous travtaismenous eixan 

SELECT d.disaster_name , d.deaths  , d.injured , d.missing 
FROM disaster d 
WHERE d.continent = 'Asia' ;

-- 3. posoi anthropoi ano ton 30 (change it) pethanan apo katastrofi chernobyl 

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
WHERE d.disaster_name = 'Chernobyl' AND p.age > 30 ; 
 
 
 -- 4. Poses gynaikes pethanan sto Chernobyl 
 
SELECT d.disaster_name ,COUNT(p.person_id)  
FROM disaster d
JOIN disaster_affected_person dap 
ON d.disaster_id = dap.disaster_id
JOIN person p ON dap.person_id = p.person_id
WHERE d.disaster_name = 'Chernobyl' AND p.gender = 'Female' ; 

-- 6. poia katastrofi eixe tous perissoterous nekrous 

SELECT *   
FROM disaster d 
WHERE deaths  = (
		SELECT MAX(deaths) 
        
        FROM disaster ) ; 

-- 8. poso kostise se ka9e xora synolika oles oi megales katastrofes 

INSERT INTO disaster_situation (RGDP, financial_aid, recovery_time, Total_cost, Plan_title, country_name, disaster_id)
VALUES
(1, 5000.00, 30, 200000.00, 'Recovery Plan A', 'CountryA', 1) ; 

SELECT c.country_name , SUM(ds.total_cost)  
FROM country c
JOIN disaster_situation  ds 
	USING( country_name)
 GROUP BY c.country_name ; 
 
 -- 7 zevgaria xoron pou exoun ypostei tin idia katastrofi 
 
INSERT INTO disaster_situation (RGDP, financial_aid, recovery_time, Total_cost, Plan_title, country_name, disaster_id)
VALUES
(1, 5000.00, 30, 200000.00, 'Recovery Plan A', 'CountryD', 3) ; 
 

-- Using c.country_name < b.country_name instead of c.country_name != b.country_name ensures that you avoid duplicates in the output. 
-- This is because it establishes a consistent order when comparing pairs of countries.
-- When you use c.country_name != b.country_name, it checks for inequality, and both combinations of (c.country_name, b.country_name) and (b.country_name, c.country_name) would be considered separately. 
-- This could result in duplicate pairs in the output.
-- By using c.country_name < b.country_name, you are essentially ordering the pairs lexicographically based on country names. 
-- This way, you ensure that each pair is represented in a consistent manner, and you won't get both (A, B) and (B, A) in the result set.
-- In summary, the use of < establishes an order and helps in avoiding duplicates when you are comparing pairs or tuples of values.
 
SELECT  ds_1.country_name AS affected_country_1, ds_2.country_name AS affected_country_2 , d.disaster_name    
FROM disaster_situation ds_1 
JOIN disaster_situation ds_2 
	ON  ds_1.disaster_id  = ds_2.disaster_id  AND ds_1.country_name < ds_2.country_name 
JOIN disaster d 
	ON d.disaster_id  = ds_1.disaster_id ; 


-- 5 This might be wrong cause i dont have the updated version of the word 
INSERT INTO Building (street, street_number, postal_code, disasterSituationID, monument, damage_type, reconstruction_cost, constructed_year)
VALUES
('Egnatia Lane', '789', '71456', 1, TRUE, 'MAJOR ISSUES', 75000.00, 1985) ; 

SELECT d.disaster_name , SUM(b.reconstruction_cost) , ds.total_cost   -- , c.country_name  
FROM disaster_situation ds 
JOIN disaster d 
	ON ds.disaster_id = d.disaster_id 
JOIN building b
	ON b.DisasterSituationID = ds.DisasterSituationID 
GROUP BY ds.disaster_id
ORDER BY ds.disaster_id ; 