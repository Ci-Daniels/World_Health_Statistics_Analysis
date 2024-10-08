import os
import pandas as pd

# Paths to your Excel files
file1_path = 'D:/Zindua-Visualisation-30-day-Challenge/01-day-1-challenge-Ci-Daniels/Capstone  Project Team Two/whs2023_annex1.xlsx'

# Load Excel sheets into DataFrames
annex1_mortality = pd.read_excel(file1_path , sheet_name='Annex 1-1', engine='openpyxl', header=1)

# Handle column name issues by stripping spaces
annex1_mortality.columns = annex1_mortality.columns.str.strip()

# Debug:
annex1_mortality = annex1_mortality.loc[:, ~annex1_mortality.columns.str.contains('^Unnamed')]
print("Mortality DataFrame Columns:", annex1_mortality.columns)
print(annex1_mortality.head()) 

# save the merged document
annex1_mortality.to_excel('who_anex1.xlsx', index=False)
print("File has been saved in the working directory.")

