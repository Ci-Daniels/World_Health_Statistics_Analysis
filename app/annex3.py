import os
import pandas as pd

# Paths to your Excel files
file3_path = 'D:/Zindua-Visualisation-30-day-Challenge/01-day-1-challenge-Ci-Daniels/Capstone  Project Team Two/whs2023_annex1.xlsx'

# Load Excel sheets into DataFrames
annex3_mortality = pd.read_excel(file3_path , sheet_name='Annex 1-3', engine='openpyxl', header=1)

# Handle column name issues by stripping spaces
annex3_mortality.columns = annex3_mortality.columns.str.strip()

# drop all other apart from 3.a, 3.d and 1.a
annex3_mortality.drop(columns=[
    'Age-standardized prevalence of tobacco use among persons 15 years and olders  (%)',
    'Average of 15 International Health Regulations core capacity scoresx',
    'Percentage of bloodstream infections due to methicillin-resistant Staphylococcus aureusy (%)',
    'Percentage of bloodstream infections due to Escherichia coli resistant to 3rd-generation cephalosporiny (%)',
    'Domestic general government health expenditure (GGHE-D) as percentage of general government expenditure (GGE)z (%)'
], inplace=True)

# Debug:
annex3_mortality = annex3_mortality.loc[:, ~annex3_mortality.columns.str.contains('^Unnamed')]
print("Mortality DataFrame Columns:", annex3_mortality.columns)
print(annex3_mortality.head()) 

# save the merged document
annex3_mortality.to_excel('who_anex3.xlsx', index=False)
print("File has been saved in the working directory.")

