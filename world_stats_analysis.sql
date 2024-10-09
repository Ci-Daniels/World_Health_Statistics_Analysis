USE world_statistics;

-- Some objectives
# Total population by region
SELECT Region, 
       SUM(Total_Population) AS Total_Region_Population
FROM countries
GROUP BY Region;

# chronic disease prevalence by region
CREATE VIEW chronics_diseases_by_region AS
SELECT c.Region, AVG(cd.HIV_prevalence) AS avg_HIV, AVG(cd.TB_prevalence) AS avg_TB, 
       AVG(cd.Malaria_prevalence) AS avg_Malaria, AVG(cd.Hepatitis_prevalence) AS avg_Hepatitis
			FROM countries c
				JOIN chronic_diseases cd ON c.country_ID = cd.country_ID
					GROUP BY c.Region;

# mortality rates by region
CREATE VIEW mortality_rates_by_region AS
SELECT c.Region, AVG(m.Maternal_mortality_ratio) AS avg_Maternal_Mortality, 
       AVG(m.Under_five_mortality_rate) AS avg_Under_5_Mortality, 
       AVG(m.Neonatal_mortality_rate) AS avg_Neonatal_Mortality
		FROM Countries c
			JOIN MortalityData m ON c.country_ID = m.country_ID
				GROUP BY c.Region;

# Countries with the highest chronics diseases
CREATE VIEW chronic_disease_prevalence AS
SELECT c.country_name, cd.HIV_prevalence, cd.TB_prevalence, cd.Malaria_prevalence, cd.Hepatitis_prevalence
	FROM Countries c
		JOIN chronic_diseases cd ON c.country_ID = cd.country_ID
			ORDER BY (cd.HIV_prevalence + cd.TB_prevalence + cd.Malaria_prevalence + cd.Hepatitis_prevalence) DESC
				LIMIT 5;

# contribution of health expenditure to health expectancy
CREATE VIEW health_expenditure_on_expectancy AS
SELECT c.country_name, he.expenditure_over_25, le.Total_Life_expectancy
	FROM Countries c
		JOIN health_expenditure he ON c.country_ID = he.country_ID
			JOIN LifeExpectancy le ON c.country_ID = le.country_ID
				ORDER BY he.expenditure_over_25 DESC;

# Does immunisation affect mortality rates in kids?
CREATE VIEW immunisation_impact_on_kids AS
SELECT c.country_name, AVG((i.Measles_coverage + i.Diptheria_coverage)/2)  AS vaccine_coverage,
    m.Under_five_mortality_rate,m.Neonatal_mortality_rate
	FROM countries c
		JOIN immunisation i ON c.country_ID = i.country_ID
			JOIN MortalityData m ON c.country_ID = m.country_ID
				WHERE i.Measles_coverage > 50 AND i.Diptheria_coverage > 50
					GROUP BY c.country_name, m.Under_five_mortality_rate, m.Neonatal_mortality_rate;

                -- it is safe to conclude that although it immunisation and mortality to some extent should be
                -- directly proportional to the mortalies of under5 and neonatal kids, it is not the case from our analysis.

# investigate maternal rate in places with more health workers
CREATE VIEW health_workers_vs_maternal_mortality AS
SELECT c.country_name, hwd.doctors_density, hwd.nursing_midwifery_density, m.Maternal_mortality_ratio
	FROM countries c
		JOIN healthWorkforce_density hwd ON c.country_ID = hwd.country_ID
			JOIN MortalityData m ON c.country_ID = m.country_ID
				ORDER BY hwd.doctors_density DESC;
                SELECT  * FROM health_workers_vs_maternal_mortality;
                -- From this, we also see an indirect relationship. Could it be that more deaths are not
                -- as a result of low doctor density??


-- impact of disease burden on household spending filter by 25% spending
CREATE VIEW disease_burden_on_spending AS
SELECT c.country_name, he.expenditure_over_25, cd.HIV_prevalence, cd.TB_prevalence, 
       cd.Malaria_prevalence, cd.Hepatitis_prevalence
	FROM countries c
		JOIN health_expenditure he ON c.country_ID = he.country_ID
			JOIN chronic_diseases cd ON c.country_ID = cd.country_ID
				ORDER BY he.expenditure_over_25 DESC;


-- Impact of Health expenditure on life expectancy in high-disease-burden countries.
DROP VIEW disease_burden_on_spending_vs_expectancy;
CREATE VIEW disease_burden_on_spending_vs_expectancy AS
SELECT c.country_name, AVG(cd.HIV_prevalence + cd.TB_prevalence) AS disease_burden, he.expenditure_over_25, le.Total_Life_expectancy
	FROM Countries c
		JOIN chronic_diseases cd ON c.country_ID = cd.country_ID
			JOIN health_expenditure he ON c.country_ID = he.country_ID
				JOIN LifeExpectancy le ON c.country_ID = le.country_ID
					WHERE cd.HIV_prevalence > 10 OR cd.TB_prevalence > 10
						GROUP BY c.country_name, he.expenditure_over_25, le.Total_Life_expectancy
						ORDER BY disease_burden DESC;
                        
                        -- In areas with higher disease burden like SA, the life expectancy is average 
                        -- while expenditure is limitted . This just speaks more to independentr relationship
                        -- between life expectancy, health expenditure and disease burden in a country.

