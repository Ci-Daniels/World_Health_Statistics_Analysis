-- create database World_stats
CREATE DATABASE world_statistics;

-- use world_stats
USE world_statistics;

-- create tables
-- country
CREATE TABLE Countries(
    country_ID INTEGER PRIMARY KEY,
	country_name VARCHAR(100) NOT NULL,
	Region VARCHAR(100) NOT NULL,
    Male_Population INTEGER,
    Female_Population INTEGER,
    Total_Population INTEGER
	);

-- INSERT TO COUNTRY
INSERT INTO Countries
	VALUES
	(191,'Kenya','African Region',26279,26276,53006),
    (265,'South Africa','African Region',28895,30498,59392),
    (284,'Uganda','African Region',22701,23153,45854),
    (266,'South Sudan','African Region',5321,5428,10748),
    (289,'United States of America','Region of the Americas',166942,170056,336998),
    (131,'Canada','Region of the Americas',18960,19195,38155),
    (180,'India','South-East Asia Region',726503,681060,1407564),
    (148,'Democratic Peoples Republic of Korea','South-East Asia Region',12844,13128,25972),
    (247,'Russian Federation','European Region',67393,77710,145103),
	(287,'United Kingdom','European Region',33239,34042,67281),
    (100,'Afghanistan','Eastern Mediterranean Region',20255,19845,40099),
    (183,'Iraq','Eastern Mediterranean Region',21797,21736,43534),
    (135,'China','Western Pacific Region',728050,697843,1425894),
    (108,'Australia','Western Pacific Region',12868,13053,25921);
-- View
SELECT * FROM Countries;

-- Diseases
CREATE TABLE chronic_diseases(
    country_ID INTEGER NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    HIV_prevalence INTEGER,
    TB_prevalence INTEGER,
	Malaria_prevalence INTEGER,
	Hepatitis_prevalence INTEGER,
    FOREIGN KEY(country_ID) REFERENCES Countries(country_ID)
);

-- insert values in the tables
INSERT INTO chronic_diseases
	VALUES 
    -- kenya
    (191,'Kenya', 18, 0.73, 251	,64.5),     
    -- South Sudan
	(266, 'South Sudan', 1.27, 227	,274.8, 13.03),
    -- South Africa
	(265, 'South Africa',4.19, 513, 0.5, 3.10),
    -- Uganda
	(284, 'Uganda', 1.30, 199, 284.0, 0.96),   
	-- USA
	(289, 'USA', NULL,2.6,NULL,0.01),
    -- Canada
	(131, 'Canada',NULL,5.3,NULL,0.34),
	-- India
	(180, 'India', 7.3, 17.3, 1.6, 8.6),
    -- Korea
    (148, 'Democratic People\'s Republic of Korea', 36.7, 44.3, 2.2, 4.0),
    -- Russia
    (247, 'Russian Federation', 38.3, 62.4, 3.5, 0.4),
    -- UK
    (287, 'United Kingdom', 31.7, 91.7, 5.2, 8.5),
    -- Afghanistan
    (100, 'Afghanistan', 2.5, 4.5, 0.7, 0.3),
    -- Iraq
    (183, 'Iraq', 9.1, 22.6, 3.3, 3.9),
    -- Australia
    (108, 'Australia', 41.0, 148.2, 6.3, 10.4),
    -- China
    (135, 'China', 23.9, 33.0, 4.5, 3.2);

-- View the NTD table
SELECT * FROM  neglected_tropical_diseases;

-- Health expenditure
CREATE TABLE health_expenditure(
	country_ID INTEGER NOT NULL UNIQUE,
    country_name VARCHAR(50) NOT NULL,
    expenditure_over_25 INTEGER,
    expenditure_over_10 INTEGER,
    FOREIGN KEY(country_ID) REFERENCES countries(country_ID)
);

-- INSERT VALUES
INSERT INTO health_expenditure
	VALUES 
    -- kenya
    (191,'Kenya',25.2, 1.4),
    -- South Sudan
	(266, 'South Sudan',11.7,2.7),
    -- South Africa
	(265, 'South Africa',1.0,0.1),
    -- Uganda
	(284, 'Uganda', 3.8,163.0),  
	-- USA
	(289, 'USA', 0.9,14.2),
    -- Canada
	(131, 'Canada', 3.5,0.8),
	-- India
	(180, 'India', 17.5,6.7),
    -- Korea
    (148, 'Democratic People\'s Republic of Korea', 12.0,2.9),
    -- Russia
	(247, 'Russian', 7.7,0.9),
    -- UK
    (287, 'United Kingdom', 2.4,0.6),
    -- Afghanistan
    (100, 'Afghanistan', 26.1,8.0),
    -- Iraq
    (183, 'Iraq',19.6,4.2),
    -- Australia
    (108, 'Australia',2.5,0.4),
    -- China
    (135, 'China',24.3,6.9);
    
-- VIEW
SELECT * FROM health_expenditure;

-- IMMUNIZATION TABLE
CREATE TABLE immunisation(
	country_ID INTEGER NOT NULL UNIQUE,
    country_name VARCHAR(50) NOT NULL,
    Diptheria_coverage INTEGER,
    Measles_coverage INTEGER,
    Pneumococal_coverage INTEGER,
    HPV_coverage INTEGER,
    FOREIGN KEY(country_ID) REFERENCES countries(country_ID)
);
-- insert values in the tables
-- IMMUNISATION
INSERT INTO immunisation
	VALUES 
    -- kenya
    (191,'Kenya',91	,57,92,44),    
    -- South Sudan
	(266, 'South Sudan', 49,NULL, NULL,NULL),
    -- South Africa
	(265, 'South Africa', 86,82,87,34),
    -- Uganda
	(284, 'Uganda', 91,NULL,91,44),   
	-- USA
	(289, 'USA', 93,95,82,48),
    -- Canada
	(131, 'Canada', 92,83,84,87),
	-- India
	(180, 'India', 85,82,25, NULL),
    -- Korea
    (148, 'Democratic People\'s Republic of Korea', 98,96,98,NULL),
    -- Russia
    (247, 'Russian Federation', 97,96,89,NULL),
    -- UK
    (287, 'United Kingdom', 93,87,91,59),
    -- Afghanistan
    (100, 'Afghanistan', 266,44,65,NULL),
    -- Iraq
    (183, 'Iraq', 78,84,0,NULL),
    -- Australia
    (108, 'Australia', 95,94,96,66),
    -- China
    (135, 'China', 99,99,NULL,NULL);
    
-- view
SELECT * FROM immunisation;

-- health workforce
CREATE TABLE healthWorkforce_density(
	country_ID INTEGER NOT NULL UNIQUE,
    country_name VARCHAR(50) NOT NULL,
	doctors_density INTEGER,
    nursing_midwifery_density INTEGER,
    dentists_density INTEGER,
    pharmacists_deinsity INTEGER,
	FOREIGN KEY(country_ID) REFERENCES countries(country_ID)
);
-- HEALTH WORKFORCE
INSERT INTO healthworkforce_density
	VALUES 
    -- kenya
    (191,'Kenya',2.3,12.0,0.3,0.2),    
    -- South Sudan
	(266, 'South Sudan', 0.4, 3.6, 0.1, 0.3),
    -- South Africa
	(265, 'South Africa', 8.1, 50.1, 1.1, 2.7),
    -- Uganda
	(284, 'Uganda', 1.6, 16.9, 0.1, 0.4),  
	-- USA
	(289, 'USA', 35.6, 124.7, 6.0, 10.6),
    -- Canada
	(131, 'Canada', 24.6, 102.7, 6.6, 10.5),
	-- India
	(180, 'India', 7.3, 17.3, 1.6, 8.6),
    -- Korea
    (148, 'Democratic People\'s Republic of Korea', 36.7, 44.3, 2.2, 4.0),
    -- Russia
	(247, 'Russia', 38.3, 62.4, 3.5, 0.4),
    -- UK
    (287, 'United Kingdom', 31.7, 91.7, 5.2, 8.5),
    -- Afghanistan
    (100, 'Afghanistan', 2.5, 4.5, 0.7, 0.3),
    -- Iraq
    (183, 'Iraq', 9.1, 22.6, 3.3, 3.9),
    -- Australia
    (108, 'Australia', 41.0, 148.2, 6.3, 10.4),
    -- China
    (135, 'China', 23.9, 33.0, 4.5, 3.2);
-- view
SELECT * FROM healthworkforce_density;
 
-- Life expectancy
CREATE TABLE LifeExpectancy(
	 country_ID INTEGER UNIQUE NOT NULL,
     Male_Life_expectancy FLOAT,
     Female_Life_expectancy FLOAT,
     Total_Life_expectancy FLOAT,
     Male_Healthy_life_expectancy FLOAT,
     Female_Healthy_life_expectancy FLOAT,
     Total_Healthy_life_expectancy FLOAT,
	 FOREIGN KEY(country_ID) REFERENCES countries(country_ID)
     );

-- insert into life expectancy
INSERT INTO LifeExpectancy
    VALUES 
	(191,63.7,68.4,66.1,56.4,58.9,57.7),
    (265,62.2,68.3,65.3,54.6,57.7,56.2),
    (284,63.2,70.1,66.7,56.0,60.4,58.2),
    (266,60.8,64.8,62.8,52.9,54.5,53.7),
    (289,76.3,80.7,78.5,65.2,67.0,66.1),
    (131,80.4,84.1,82.2,70.5,72.0,71.3),
    (180,69.5,72.2,70.8,60.3,60.4,60.3),
    (148,69.3,75.7,72.6,63.3,66.6,65.0),
    (247,68.2,78.0,73.2,60.7,67.5,64.2),
    (287,79.8,83.0,81.4,69.6,70.6,70.1),
    (100,63.3,63.2,63.2,54.7,53.2,53.9),
    (183,69.9,75.0,72.4,61.6,63.7,62.7),
    (135,74.7,80.5,77.4,67.2,70.0,68.5),
    (108,81.3,84.8,83.0,70.2,71.7,70.9);

-- mortality
CREATE TABLE MortalityData (
	country_ID INTEGER UNIQUE NOT NULL,
    Maternal_mortality_ratio INTEGER , 
    Proportion_of_births_attended INTEGER, 
    Under_five_mortality_rate INTEGER,
    Neonatal_mortality_rate INTEGER,
    Poison_mortality_rate FLOAT,
    unsafe_WASH_mortality_rate FLOAT,
    suicide_mortality FLOAT,
    FOREIGN KEY(country_ID) REFERENCES countries(country_ID)
);

-- insert mortality data
INSERT INTO MortalityData
	VALUES
		(191,530,70,37,18,2.4, 29.0,6.1),
		(265,127,97,33,11,1.7,27.6,23.5),
		(284,284,74,42,19,1.7,27.6,23.5),
		(266,1223,40,99,40,2.3,68.1,3.9),
		(289,21,99,6,3,0.5,2.3,16.1),
		(131,11,98,5,3,0.5,2.3,16.1),
		(180,103,89,31,19,0.3,2.3,11.8),
		(148,107,100,15,8,0.3,36.4,12.7),
		(247,14,100,5,2,0.2,5.2,25.1),
		(287,10,0,4,3,3.8,3.2,25.1),
		(100,620,62,56,34,0.3,6.1,7.9),
		(183,76,96,25,14,0.2,4.4,3.6),
		(135,23,100,7,3,0.1,1.9,12.5),
		(108,3,96,4,2,1.8,2.2,8.1);

-- WOMEN REPRODUCTIVE HEALTH
CREATE TABLE Women_Reproductive_health (
    country_code INT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL,
    family_planning FLOAT,
    adolescent_birth_rate_15_19 FLOAT,
    adolescent_birth_rate_10_14 FLOAT
);

-- INSERT VALUES
INSERT INTO  Women_Reproductive_health
	VALUES
		(191,'Kenya',77.1,73.0,2.0),
		(266, 'South Sudan',NULL,NULL,NULL),
		(284, 'Uganda',65.5,127.9,1.1),
		(264, 'South Africa', 79.7,40.7,1.0),
		(289, 'USA',78.4,15.1,0.3),
		(131, 'Canada', NULL,5.6,0.1),
		(180, 'India',72.8,10.6,0.2),
		(148, 'Democratic People\'s Republic of Korea',89.6,NULL,NULL),
		(247, 'Russian',NULL,16.2,0.1),
		(286, 'United Kingdom',NULL,10.0,0.1),
		(100, 'Afghanistan', 42.1,62.1,0.2),
		(183, 'Iraq',53.8,70,1.6),
		(108, 'Australia',NULL,7.8,0.1),
		(135, 'China',NULL,6.1,NULL);
        
