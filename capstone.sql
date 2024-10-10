USE world_statistics;
-- impact of workforce and expenditure on life expectancy
-- tables to use health_expenditure,healthworkforce_density,LifeExpectancy
SELECT * FROM health_expenditure;
SELECT * FROM healthworkforce_density;
SELECT * FROM LifeExpectancy;
-- joining the three tables based on the country_ID to get a combined view of workforce density, health expenditure, and life expectancy.
SELECT 
    w.country_name,
    w.doctors_density,
    w.nursing_midwifery_density,
    w.dentists_density,
    w.pharmacists_deinsity,
    e.expenditure_over_25,
    e.expenditure_over_10,
    l.Male_Life_expectancy,
    l.Female_Life_expectancy,
    l.Total_Life_expectancy,
    l.Male_Healthy_life_expectancy,
    l.Female_Healthy_life_expectancy,
    l.Total_Healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    health_expenditure e ON w.country_ID = e.country_ID
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID;
    -- To assess how the workforce density impacts life expectancy
    SELECT 
    w.doctors_density,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.doctors_density
ORDER BY 
    w.doctors_density;
-- checking how health expenditure affects life expectancy
SELECT 
    w.doctors_density,
    e.expenditure_over_25,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    health_expenditure e ON w.country_ID = e.country_ID
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.doctors_density, e.expenditure_over_25
ORDER BY 
    w.doctors_density, e.expenditure_over_25;

-- To assess how the workforce density impacts life expectancy
SELECT 
    w.nursing_midwifery_density,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.nursing_midwifery_density
ORDER BY 
    w.nursing_midwifery_density;

-- checking how health expenditure affects life expectancy
SELECT 
    w.nursing_midwifery_density,
    e.expenditure_over_25,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    health_expenditure e ON w.country_ID = e.country_ID
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.nursing_midwifery_density, e.expenditure_over_25
ORDER BY 
    w.nursing_midwifery_density, e.expenditure_over_25;

-- To assess how the workforce density impacts life expectancy
SELECT 
    w.dentists_density,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.dentists_density
ORDER BY 
    w.dentists_density;

-- checking how health expenditure affects life expectancy
SELECT 
    w.dentists_density,
    e.expenditure_over_25,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    health_expenditure e ON w.country_ID = e.country_ID
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.dentists_density, e.expenditure_over_25
ORDER BY 
    w.dentists_density, e.expenditure_over_25;

-- To assess how the workforce density impacts life expectancy
SELECT 
    w.pharmacists_deinsity,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_deinsity w
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.pharmacists_deinsity
ORDER BY 
    w.pharmacists_deinsity;

-- checking how health expenditure affects life expectancy
SELECT 
    w.pharmacists_deinsity,
    e.expenditure_over_25,
    AVG(l.Total_Life_expectancy) AS avg_life_expectancy,
    AVG(l.Total_Healthy_life_expectancy) AS avg_healthy_life_expectancy
FROM 
    healthWorkforce_density w
JOIN 
    health_expenditure e ON w.country_ID = e.country_ID
JOIN 
    LifeExpectancy l ON w.country_ID = l.country_ID
GROUP BY 
    w.pharmacists_deinsity, e.expenditure_over_25
ORDER BY 
    w.pharmacists_deinsity, e.expenditure_over_25;

--  Number of health workforce by region/country
SELECT 
    w.country_name,
    SUM(w.doctors_density) AS total_doctors,
    SUM(w.nursing_midwifery_density) AS total_nurses_midwives,
    SUM(w.dentists_density) AS total_dentists,
    SUM(w.pharmacists_deinsity) AS total_pharmacists,
    (SUM(w.doctors_density) + 
     SUM(w.nursing_midwifery_density) + 
     SUM(w.dentists_density) + 
     SUM(w.pharmacists_deinsity)) AS total_health_workforce
FROM 
    healthWorkforce_density w
GROUP BY 
    w.country_name
ORDER BY 
    total_health_workforce DESC;


-- Chronic diseases prevalence by region
SELECT 
    country_name,
    (HIV_prevalence + TB_prevalence + Malaria_prevalence + Hepatitis_prevalence) AS total_chronic_disease_prevalence
FROM 
    chronic_diseases
ORDER BY 
    total_chronic_disease_prevalence DESC
LIMIT 5;

SELECT 
    country_name,
    HIV_prevalence,
    TB_prevalence,
    Malaria_prevalence,
    Hepatitis_prevalence
FROM 
    chronic_diseases
ORDER BY 
    country_name;

SELECT 
    country_name,
    HIV_prevalence
FROM 
    chronic_diseases
ORDER BY 
    HIV_prevalence DESC
LIMIT 5;

SELECT 
    country_name,
    TB_prevalence
FROM 
    chronic_diseases
ORDER BY 
    TB_prevalence DESC
LIMIT 5;

SELECT 
    country_name,
    TB_prevalence
FROM 
    chronic_diseases
ORDER BY 
    TB_prevalence DESC
LIMIT 5;

SELECT 
    country_name,
    Hepatitis_prevalence
FROM 
    chronic_diseases
ORDER BY 
    Hepatitis_prevalence DESC
LIMIT 5;

