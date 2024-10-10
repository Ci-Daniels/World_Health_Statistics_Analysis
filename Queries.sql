USE world_statistics;

-- Analysis of top 5 countries with adolescent 10-14 pregnancies
SELECT country_name,adolescent_birth_rate_10_14
FROM Women_Reproductive_health
ORDER BY adolescent_birth_rate_10_14 DESC
LIMIT 5;

-- Maternal mortality rates by country
SELECT M.country_ID,C.country_name,M.Maternal_mortality_ratio
FROM MortalityData as M
JOIN
	Countries as C
    ON M.country_ID = C.country_ID
;

-- Comparison of life expectancy between male and female- group by country
SELECT C.country_name, L. Male_Life_expectancy, L.Female_Life_expectancy
FROM LifeExpectancy as L
JOIN
	Countries as C
    ON L.country_ID = C.country_ID
;