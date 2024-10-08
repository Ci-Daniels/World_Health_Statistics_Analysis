import os
import pandas as pd

# Paths to your Excel files
file4_path = 'D:/Zindua-Visualisation-30-day-Challenge/01-day-1-challenge-Ci-Daniels/Capstone  Project Team Two/who_anex1.xlsx'
file5_path = 'D:/Zindua-Visualisation-30-day-Challenge/01-day-1-challenge-Ci-Daniels/Capstone  Project Team Two/who_anex2.xlsx'
file6_path = 'D:/Zindua-Visualisation-30-day-Challenge/01-day-1-challenge-Ci-Daniels/Capstone  Project Team Two/who_anex3.xlsx'

# Load Excel sheets into DataFrames
annex4_mortality = pd.read_excel(file4_path , sheet_name='life expectancy-mortality', engine='openpyxl')
annex5_mortality = pd.read_excel(file5_path , sheet_name='reproductive-health expenditure', engine='openpyxl')
annex6_mortality = pd.read_excel(file6_path , sheet_name='immunisation-personnel', engine='openpyxl')

# Handle column names strip spaces
annex4_mortality.columns = annex4_mortality.columns.str.strip()
annex5_mortality.columns = annex5_mortality.columns.str.strip()
annex6_mortality.columns = annex6_mortality.columns.str.strip()

# Perform a merge on the DataFrames
try:
    world_stats1 = pd.merge(annex4_mortality, annex5_mortality, 
                            on=['country code', 'Countries and areas'], 
                            how='left', 
                            suffixes=('_annex4', '_annex5'))
    
    # Merge the result with annex6_mortality
    world_stats2 = pd.merge(world_stats1, annex6_mortality, 
                            on=['country code', 'Countries and areas'], 
                            how='left', 
                            suffixes=('', '_annex6'))  

    # Drop columns with 'Unnamed' if they exist
    world_stats = world_stats2.loc[:, ~world_stats2.columns.str.contains('^Unnamed', na=False)]
    
    print("The list of columns in the combined dataframe:", world_stats.columns)
    print(world_stats.head())
    
except Exception as Error:
    print(f"Merge Not successful: {Error}")


# save the merged document
world_stats.to_excel('world_stats.xlsx', index=False)
print("File has been saved in the working directory.")
