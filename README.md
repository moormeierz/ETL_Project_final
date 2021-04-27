# ETL-Project
Group members:  Zach, Shanna, Stephanie, Lucas
## Extraction
The data used includes 3 data sets, each with their own Jupyter notebook:
•	The Economic Freedom Index  (Kaggle) – economic_freedom_index.ipynb
•	World Happiness Report  (Kaggle) - happiness_2019. ipynb
•	REST Countries  (API) – coutry_info. ipynb

The two csv files from Kaggle contain data that was collected in 2019.  The data that was pulled from the API is current data.  However, we only selected columns that wouldn’t vary by year such as: region, subregion, area, and currency.
## Transformation
The API returned data in the JSON format.  Therefore, we converted the JSON data into a pandas dataframe.  Then, we dropped unnecessary  columns.  Unnecessary columns were dropped for the other two data sets as well.

![image](https://github.com/moormeierz/ETL_Project_final/blob/main/Resources/images/transformation.PNG?raw=true)

Columns were also cleaned to remove spaces for easier coding in SQL.

![image](https://github.com/moormeierz/ETL_Project_final/blob/main/Resources/images/columns_clean.PNG?raw=true)

The same methodology was repeated for each data source.
In the economic_freedom_index.ipynb, special characters were also removed as each data set was transformed to a csv and then loaded in Postgres.
 
![image](https://github.com/moormeierz/ETL_Project_final/blob/main/Resources/images/get_rid_of_$.PNG?raw=true)

## Load
Using Quick Database Diagram tool, we created our Schema. We used Juptyer notebook to clean and organize our data. Finally, we imported our cleaned data in to Postgress tables; Hapiness_csv, country_info_API and economic_csv. Assigning Primary and Foreign keys to  country name to connect the tables. 

![image](https://github.com/moormeierz/ETL_Project_final/blob/main/ERD.png?raw=true)

This is the table schema that was used to import the 3 csv files into postgres.

![image](https://github.com/moormeierz/ETL_Project_final/blob/main/Resources/images/table_schema_postgres.PNG?raw=true)


## Challenges
1. Our original idea was to compare a country’s happiness to its weather.  First, we tried to use the openweather API. However, openweather only allows to query 5 days of current temperature.
2. Then, we selected a different weather source, Meteostat, with the goal to use the capital city json file as a list to run a loop.  However, the API does not allow for fetching lists effectively.  Also, it would have been difficult to compare weather on the country level.  Therefore, we decided to compare country’s happiness with certain economic factors.
3.	Normalizing the data on country.  One dataset contained 186 countries, one contained 156 countries, and another contained 250 entries.  We used list comprehension to match country_name across the three datasets.  We came up with a list of 140 countries.  Then, we exported the data using the loc method.  This is the final data that was put into our postgres server.

![image](https://github.com/moormeierz/ETL_Project_final/blob/main/Resources/images/list_comp.PNG?raw=true)

## Conclusion
By merging these datasets, we could study:
- How unemployment affects happiness score
-	How social support and access to healthcare affects life expectancy
-	Does the economic freedom ranking have any correlation with happiness score?

Here’s an example of a query using Postgres SQL to run the operation:
1.	Pull happy score, unemployment by country.  This example pulls Albania.
 
![image](https://github.com/moormeierz/ETL_Project_final/blob/main/Resources/images/query.PNG?raw=true)
