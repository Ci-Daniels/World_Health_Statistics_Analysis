import os
import pandas as pd

# Paths to your Excel files
file2_path = 'D:/Zindua-Visualisation-30-day-Challenge/01-day-1-challenge-Ci-Daniels/Capstone  Project Team Two/whs2023_annex1.xlsx'

# Load Excel sheets into DataFrames
annex2_mortality = pd.read_excel(file2_path , sheet_name='Annex 1-2', engine='openpyxl', header=1)

# Handle column name issues by stripping spaces
annex2_mortality.columns = annex2_mortality.columns.str.strip()

# drop all other apart from 3.7 and 3.8
annex2_mortality.drop(columns=[
    'Probability of dying from any of CVD, cancer, diabetes, CRD between age 30 and exact age 70k (%)',
    'Suicide mortality ratek (per 100 000 population)',
    'Total alcohol per capita (≥ 15 years of age) consumptionl (litres of pure alcohol)',
    'Road traffic mortality ratek,ay (per 100 000 population)','Age-standardized mortality rate attributed to household and ambient air pollutionq  (per 100 000 population)',
    'Mortality rate attributed to exposure to unsafe WASH servicesr (per 100 000 population)',
    'Mortality rate from unintentional poisoningk (per 100 000 population)'
], inplace=True)

# Debug:
annex2_mortality = annex2_mortality.loc[:, ~annex2_mortality.columns.str.contains('^Unnamed')]
print("Mortality DataFrame Columns:", annex2_mortality.columns)
print(annex2_mortality.head()) 

# save the merged document
annex2_mortality.to_excel('who_anex2.xlsx', index=False)
print("File has been saved in the working directory.")

