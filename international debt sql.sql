use international_debt;
select* from all_countries;
select* from all_foot_metadata;

# 1. Retrieve all distinct country names from the dataset.
select distinct "Country Name" from all_countries;
# 2. Count the total number of countries available.
SELECT COUNT(DISTINCT `Country Name`) FROM all_countries;
# 3. Find the total number of indicators present.
SELECT COUNT(DISTINCT `Indicator Name`) FROM all_countries;
# 4. Display the first 10 records of the dataset.
SELECT * FROM all_countries LIMIT 10;
#5. Calculate the total global debt.
SELECT SUM(`Debt_Value`) FROM all_countries;
# 6. List all unique indicator names.
SELECT DISTINCT `Indicator Name`FROM all_countries;
# 7. Find the number of records for each country.
SELECT `Country Name`, COUNT(*) AS total_records FROM all_countries GROUP BY `Country Name`ORDER BY total_records DESC;
# 8. Display all records where debt is greater than 1 billion USD
select * from all_countries where `Debt_value` > 1000000000 order by `Debt_Value` DESC;
#9. Find the minimum, maximum, and average debt values.
SELECT 
    MIN(`Debt_Value`) AS minimum_debt,
    MAX(`Debt_Value`) AS maximum_debt,
    AVG(`Debt_Value`) AS average_debt
FROM all_countries;
# 10. Count total number of records in the dataset.
select count(*) as total_record from all_countries;
#Intermediate Level
#1. Find the total debt for each country.
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt FROM all_countries GROUP BY `Country Name`ORDER BY total_debt DESC;
#2. Top 10 countries with highest total debt
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt FROM all_countries GROUP BY `Country Name` ORDER BY total_debt  DESC LIMIT 10;
# 3. Find the average debt per country.
SELECT `Country Name`, Avg(Debt_Value) AS avg_debt  FROM all_countries GROUP BY `Country Name` ORDER BY avg_debt  DESC ;
#4. Calculate total debt for each indicator.
SELECT `Indicator Name`, sum(Debt_Value) AS sum_debt  FROM all_countries GROUP BY `Indicator Name` ORDER BY sum_debt  DESC ;
# 5. Identify the indicator contributing the highest total debt.
SELECT `Indicator Name`, sum(Debt_Value) AS sum_debt  FROM all_countries GROUP BY `Indicator Name` ORDER BY sum_debt  DESC limit 1;
# 6. Find the country with the lowest total debt.
SELECT `Country Name`, sum(Debt_Value) AS sum_debt  FROM all_countries GROUP BY `Country Name` ORDER BY sum_debt  ASC limit 1;
# 7. Total debt for each country and indicator combination.alter 
SELECT `Country Name`,`Indicator Name`,SUM(`Debt_Value`) AS total_debt FROM all_countries GROUP BY `Country Name`, `Indicator Name` ORDER BY total_debt DESC;
# 8. Count how many indicators each country has
SELECT `Country Name`, COUNT( DISTINCT `Indicator Name`) AS indicator_count FROM all_countries GROUP BY `Country Name` ORDER BY indicator_count DESC;
#9. Countries above global average debt
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt FROM all_countries GROUP BY `Country Name`HAVING SUM(`Debt_Value`) > (SELECT AVG(`Debt_Value`) FROM all_countries) ORDER BY total_debt DESC;
# 10. Rank countries based on total debt (highest to lowest)
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt, RANK() OVER (ORDER BY SUM(`Debt_Value`) DESC) AS debt_rank FROM all_countries GROUP BY `Country Name`ORDER BY debt_rank;

#🔹 Advanced Level

# 1. Top 5 indicators contributing most to global debt
SELECT `Indicator Name`, SUM(`Debt_Value`) AS total_debt FROM all_countries GROUP BY `Indicator Name` ORDER BY total_debt DESC LIMIT 5;

# 2. Percentage contribution of each country to total global debt
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt, ROUND(SUM(`Debt_Value`) / (SELECT SUM(`Debt_Value`) FROM all_countries) * 100, 2) AS percentage FROM all_countries GROUP BY `Country Name` ORDER BY percentage DESC;

# 3. Top 3 countries for each indicator based on debt
SELECT `Indicator Name`, `Country Name`, total_debt, country_rank FROM (SELECT `Indicator Name`, `Country Name`, SUM(`Debt_Value`) AS total_debt, RANK() OVER (PARTITION BY `Indicator Name` ORDER BY SUM(`Debt_Value`) DESC) AS country_rank FROM all_countries GROUP BY `Indicator Name`, `Country Name`) ranked WHERE country_rank <= 3 ORDER BY `Indicator Name`, country_rank;

# 4. Difference between maximum and minimum debt for each country
SELECT `Country Name`, MAX(`Debt_Value`) AS max_debt, MIN(`Debt_Value`) AS min_debt, MAX(`Debt_Value`) - MIN(`Debt_Value`) AS debt_difference FROM all_countries GROUP BY `Country Name` ORDER BY debt_difference DESC;

# 5. Create a view for top 10 countries with highest debt
CREATE VIEW top10_highest_debt AS SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt FROM all_countries GROUP BY `Country Name` ORDER BY total_debt DESC LIMIT 10;

# 6. Categorize countries into High, Medium, Low debt
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt, CASE WHEN SUM(`Debt_Value`) > 1000000000000 THEN 'High Debt' WHEN SUM(`Debt_Value`) > 100000000000 THEN 'Medium Debt' ELSE 'Low Debt' END AS debt_category FROM all_countries GROUP BY `Country Name` ORDER BY total_debt DESC;

# 7. Cumulative debt per country using window functions
SELECT `Country Name`, `Year`, SUM(`Debt_Value`) AS yearly_debt, SUM(SUM(`Debt_Value`)) OVER (PARTITION BY `Country Name` ORDER BY `Year`) AS cumulative_debt FROM all_countries GROUP BY `Country Name`, `Year` ORDER BY `Country Name`, `Year`;

# 8. Indicators where average debt is higher than overall average
SELECT `Indicator Name`, AVG(`Debt_Value`) AS avg_debt FROM all_countries GROUP BY `Indicator Name` HAVING AVG(`Debt_Value`) > (SELECT AVG(`Debt_Value`) FROM all_countries) ORDER BY avg_debt DESC;

# 9. Countries contributing more than 5% of global debt
SELECT `Country Name`, SUM(`Debt_Value`) AS total_debt, ROUND(SUM(`Debt_Value`) / (SELECT SUM(`Debt_Value`) FROM all_countries) * 100, 2) AS percentage FROM all_countries GROUP BY `Country Name` HAVING percentage > 5 ORDER BY percentage DESC;

# 10. Most dominant indicator for each country
SELECT `Country Name`, `Indicator Name`, total_debt FROM (SELECT `Country Name`, `Indicator Name`, SUM(`Debt_Value`) AS total_debt, RANK() OVER (PARTITION BY `Country Name` ORDER BY SUM(`Debt_Value`) DESC) AS rnk FROM all_countries GROUP BY `Country Name`, `Indicator Name`) ranked WHERE rnk = 1 ORDER BY total_debt DESC;