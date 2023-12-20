use world_disasters;

-- admin user --

CREATE USER 'sadmin'@'localhost' IDENTIFIED BY 'test123';
GRANT ALL PRIVILEGES ON world_disasters.* TO 'sadmin'@'localhost';
show grants for sadmin@localhost;

-- check the users --
select* from mysql.user;
SELECT user, host FROM mysql.user;
SHOW GRANTS FOR 'sadmin'@'localhost'  ;

-- research center -- 

drop user if exists 'research_center'@'%';
flush privileges;
CREATE USER 'research_center'@'%' IDENTIFIED BY 'passcenter';
GRANT SELECT ON world_disasters.* TO 'research_center'@'%';
GRANT INSERT, UPDATE ON world_disasters.building TO 'research_center'@'%';
GRANT INSERT, UPDATE ON world_disasters.disease TO 'research_center'@'%';
GRANT INSERT, UPDATE ON world_disasters.media_article TO 'research_center'@'%';
GRANT INSERT, UPDATE ON world_disasters.ngo TO 'research_center'@'%';
GRANT INSERT, UPDATE ON world_disasters.ngo_responds_to_country TO 'research_center'@'%';
flush privileges;



-- goverment organization -- 

drop user if exists 'goverment_organization'@'%';
flush privileges;
CREATE USER 'goverment_organization'@'%' IDENTIFIED BY 'passagency';
GRANT SELECT ON world_disasters.* TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.country TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.donation_center TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.disaster TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.disaster_affected_person TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.person TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.nea_helped_country TO 'goverment_organization'@'%';
GRANT INSERT, UPDATE ON world_disasters.national_emergency_agency TO 'goverment_organization'@'%';
flush privileges;

-- simple user --

drop user if exists 'userMaria'@'%';
flush privileges;
CREATE USER 'userMaria'@'%' IDENTIFIED BY 'maria123';
GRANT SELECT ON world_disasters.* TO 'userMaria'@'%';
flush privileges;

-- Educational institutions -- 

drop user if exists 'School47'@'%';
flush privileges;
CREATE USER 'School47'@'%' IDENTIFIED BY 'pass47';
GRANT SELECT ON world_disasters.* TO 'School47'@'%';
flush privileges;