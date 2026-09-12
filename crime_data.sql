<<<<<<< HEAD
-- 1. CREATE DATABASE
CREATE DATABASE IF NOT EXISTS crime_analysis;
USE crime_analysis;

-- 2. CREATE ORIGINAL SOURCE TABLE
=======
CREATE DATABASE crime_analysis;
USE crime_analysis;
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
CREATE TABLE IF NOT EXISTS crime_data (
    DR_NO BIGINT,
    Date_Rptd VARCHAR(30),
    DATE_OCC VARCHAR(30),
    TIME_OCC INT,
    AREA INT,
    AREA_NAME VARCHAR(50),
    Rpt_Dist_No INT,
    Part_1_2 INT,
    Crm_Cd INT,
    Crm_Cd_Desc VARCHAR(150),
    Mocodes VARCHAR(255),
    Vict_Age INT,
    Vict_Sex VARCHAR(10),
    Vict_Descent VARCHAR(10),
    Premis_Cd INT,
    Premis_Desc VARCHAR(150),
    Weapon_Used_Cd INT,
    Weapon_Desc VARCHAR(150),
    Status VARCHAR(10),
    Status_Desc VARCHAR(50),
    Crm_Cd_1 INT,
    Crm_Cd_2 INT,
    Crm_Cd_3 INT,
    Crm_Cd_4 INT,
    LOCATION VARCHAR(255),
    Cross_Street VARCHAR(255),
    LAT DECIMAL(10,7),
    LON DECIMAL(10,7)
);
<<<<<<< HEAD

SELECT COUNT(*) AS Total_Rows
FROM crime_data;
DESCRIBE crime_data;

-- 3. CREATE RAW COPY
DROP TABLE IF EXISTS crime_raw;
CREATE TABLE crime_raw AS
SELECT *
FROM crime_data;
SELECT COUNT(*) AS Total_Rows
FROM crime_raw;

-- 4. REMOVE UNNECESSARY COLUMNS
=======
Select count(*) from crime_data;
DESCRIBE crime_data;
CREATE TABLE crime_raw AS SELECT * FROM crime_analysis.crime_data;
Select count(*) from crime_raw;
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
ALTER TABLE crime_raw
DROP COLUMN AREA,
DROP COLUMN Crm_Cd,
DROP COLUMN Mocodes,
DROP COLUMN Status,
DROP COLUMN Cross_Street,
DROP COLUMN Premis_Cd,
DROP COLUMN Weapon_Used_Cd;

<<<<<<< HEAD
-- 5. DATA CLEANING
-- 5.1 CHECK DUPLICATES
SELECT
    DR_NO,
    COUNT(*) AS Duplicate_Count
FROM crime_raw
GROUP BY DR_NO
HAVING COUNT(*) > 1;

-- Check NULL Crime Numbers
SELECT DR_NO
FROM crime_raw
WHERE DR_NO IS NULL;

-- 5.2 CHECK INVALID VICTIM AGE
SELECT *
FROM crime_raw
WHERE Vict_Age < 0
   OR Vict_Age > 110
   OR Vict_Age = 0;

SELECT COUNT(*) AS Invalid_Age_Count
FROM crime_raw
WHERE Vict_Age = 0;

SET SQL_SAFE_UPDATES = 0;
UPDATE crime_raw
SET Vict_Age = NULL
WHERE Vict_Age <= 0
   OR Vict_Age > 110;

-- 5.3 VICTIM SEX
SELECT DISTINCT Vict_Sex
FROM crime_raw;
SELECT
    Vict_Sex,
    COUNT(*) AS Total
FROM crime_raw
GROUP BY Vict_Sex
ORDER BY Total DESC;

-- Standardize missing/invalid values
UPDATE crime_raw
SET Vict_Sex = 'Unknown'
WHERE Vict_Sex = ''
   OR Vict_Sex = '-'
   OR Vict_Sex = 'H';

-- 5.4 VICTIM DESCENT
SELECT DISTINCT Vict_Descent
FROM crime_raw;
UPDATE crime_raw
SET Vict_Descent = 'Unknown'
WHERE Vict_Descent = ''
   OR Vict_Descent = '-';

-- 5.5 CRIME DESCRIPTION
UPDATE crime_raw
SET Crm_Cd_Desc = TRIM(Crm_Cd_Desc);

-- 5.6 PREMISES DESCRIPTION
SELECT *
FROM crime_raw
WHERE Premis_Desc IS NULL;

-- 5.7 WEAPON DESCRIPTION
SELECT *
FROM crime_raw
WHERE Weapon_Desc = '';
UPDATE crime_raw
SET Weapon_Desc = 'No Weapon Reported'
WHERE Weapon_Desc = '';

-- 5.8 STATUS DESCRIPTION
SELECT *
FROM crime_raw
WHERE Status_Desc IS NULL;

-- 5.9 LOCATION
SELECT *
FROM crime_raw
WHERE LOCATION IS NULL;
UPDATE crime_raw
SET LOCATION = TRIM(LOCATION);

-- 5.10 LATITUDE AND LONGITUDE
SELECT *
FROM crime_raw
WHERE LAT = 0
   OR LON = 0;
UPDATE crime_raw
SET LAT = NULL,
    LON = NULL
WHERE LAT = 0
   OR LON = 0;

-- 6. DATE CLEANING AND NEW DATE COLUMNS
-- 6.1 REPORT DATE
ALTER TABLE crime_raw
ADD COLUMN Report_Date DATE;
UPDATE crime_raw
SET Report_Date = STR_TO_DATE(Date_Rptd, '%m/%d/%Y');

-- 6.2 OCCURRENCE DATE
ALTER TABLE crime_raw
ADD COLUMN Occurrence_Date DATE;
UPDATE crime_raw
SET Occurrence_Date =
    STR_TO_DATE(DATE_OCC, '%m/%d/%Y %r');

-- Check dates
SELECT
    MIN(Occurrence_Date) AS First_Occurrence_Date,
    MAX(Occurrence_Date) AS Last_Occurrence_Date
FROM crime_raw;

-- 7. CREATE NEW ANALYTICAL COLUMNS
-- 7.1 CRIME YEAR
ALTER TABLE crime_raw
ADD COLUMN Crime_Year INT;
UPDATE crime_raw
SET Crime_Year = YEAR(Occurrence_Date);

-- 7.2 CRIME MONTH
ALTER TABLE crime_raw
ADD COLUMN Crime_Month INT;
UPDATE crime_raw
SET Crime_Month = MONTH(Occurrence_Date);

-- 7.3 MONTH NAME
ALTER TABLE crime_raw
ADD COLUMN Month_Name VARCHAR(20);
UPDATE crime_raw
SET Month_Name = MONTHNAME(Occurrence_Date);

-- 7.4 DAY NAME
ALTER TABLE crime_raw
ADD COLUMN Day_Name VARCHAR(20);
UPDATE crime_raw
SET Day_Name = DAYNAME(Occurrence_Date);

-- 7.5 QUARTER
ALTER TABLE crime_raw
ADD COLUMN Quarter_No INT;
UPDATE crime_raw
SET Quarter_No = QUARTER(Occurrence_Date);

-- 7.6 AGE GROUP
ALTER TABLE crime_raw
ADD COLUMN Age_Group VARCHAR(20);
=======
-- Cleaning Part

-- Check Duplicates And Null
SELECT DR_NO,COUNT(*) AS count FROM crime_raw
GROUP BY DR_NO HAVING count(*)>1;
SELECT DR_NO FROM crime_raw WHERE DR_NO is NULL;

-- Check Invalid Ages
SELECT * FROM crime_raw
WHERE Vict_Age < 0 OR Vict_Age > 110 OR Vict_Age = 0;
SELECT COUNT(*) FROM crime_raw WHERE Vict_Age=0;
SET SQL_SAFE_UPDATES = 0;
UPDATE crime_raw SET Vict_Age = NULL WHERE Vict_Age = 0;

-- Check Victim Sex
SELECT DISTINCT Vict_Sex FROM crime_raw;
SELECT Vict_Sex, COUNT(*) AS Total FROM crime_raw
GROUP BY Vict_Sex ORDER BY Total DESC;
UPDATE crime_raw SET Vict_Sex = 'Unknown'
WHERE Vict_Sex = '' OR Vict_Sex = '-' OR Vict_Sex ='H';

-- Check Victim Descent
SELECT DISTINCT Vict_Descent
FROM crime_raw;
UPDATE crime_raw SET Vict_Descent = 'Unknown'
WHERE Vict_Descent = '' OR Vict_Descent = '-';

-- Crime Description
UPDATE crime_raw SET Crm_Cd_Desc = TRIM(Crm_Cd_Desc);

-- Premises Description
SELECT * FROM crime_raw WHERE Premis_Desc IS NULL;
SELECT * FROM crime_raw WHERE Weapon_Desc = '';

-- Weapon Description
SET SQL_SAFE_UPDATES =0;
UPDATE crime_raw SET Weapon_Desc = 'No Weapon Reported'
WHERE Weapon_Desc ='';

-- Status Description
SELECT * FROM crime_raw
WHERE Status_Desc IS NULL;

-- Location 
SELECT * FROM crime_raw
WHERE Location IS NULL;
UPDATE crime_raw SET LOCATION = TRIM(LOCATION);

-- Latitude And Longitude
SELECT * FROM crime_raw
WHERE LAT = 0 OR LON = 0;
UPDATE crime_data SET LAT = NULL,LON = NULL
WHERE LAT = 0 OR LON = 0;

-- Check Dates
ALTER TABLE crime_raw ADD Report_Date DATE;
ALTER TABLE crime_raw Drop Column Report_Date;
SET SQL_SAFE_UPDATES = 0;
UPDATE crime_raw SET Report_Date = DATE(Date_Rptd);
ALTER TABLE crime_raw ADD Occurrence_Date DATE;
UPDATE crime_raw SET Occurrence_Date = STR_TO_DATE(DATE_OCC,'%m/%d/%Y %r');

-- ADD NEW COLUMNS
ALTER TABLE crime_raw ADD Crime_Year INT;
UPDATE crime_raw SET Crime_Year = YEAR(Occurrence_Date);
ALTER TABLE crime_raw ADD Crime_Month INT;
UPDATE crime_raw SET Crime_Month = MONTH(Occurrence_Date);
ALTER TABLE crime_raw ADD Month_Name VARCHAR(20);
UPDATE crime_raw SET Month_Name = MONTHNAME(Occurrence_Date);
ALTER TABLE crime_raw ADD Day_Name VARCHAR(20);
UPDATE crime_raw SET Day_Name = DAYNAME(Occurrence_Date);
ALTER TABLE crime_raw ADD Quarter_No INT;
UPDATE crime_raw SET Quarter_No = QUARTER(Occurrence_Date);
ALTER TABLE crime_raw ADD Age_Group VARCHAR(20);
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
UPDATE crime_raw
SET Age_Group =
CASE
    WHEN Vict_Age IS NULL THEN 'Unknown'
    WHEN Vict_Age < 18 THEN 'Child'
    WHEN Vict_Age BETWEEN 18 AND 30 THEN 'Young Adult'
    WHEN Vict_Age BETWEEN 31 AND 50 THEN 'Adult'
    WHEN Vict_Age BETWEEN 51 AND 70 THEN 'Senior Adult'
    ELSE 'Senior'
END;
<<<<<<< HEAD

-- 7.7 CRIME HOUR
ALTER TABLE crime_raw
ADD COLUMN Crime_Hour INT;

UPDATE crime_raw
SET Crime_Hour = FLOOR(TIME_OCC / 100);

DESCRIBE crime_raw;

-- 8. REMOVE ORIGINAL DATE COLUMNS
ALTER TABLE crime_raw
DROP COLUMN Date_Rptd,
DROP COLUMN DATE_OCC;

-- 9. CREATE CLEANED DATASET
DROP TABLE IF EXISTS crime_cleaned;
CREATE TABLE crime_cleaned AS
SELECT *
FROM crime_raw;
ALTER TABLE crime_cleaned
DROP COLUMN TIME_OCC;

SELECT COUNT(*) AS Total_Rows
FROM crime_cleaned;
DESCRIBE crime_cleaned;

-- 10. CREATE 2020-2022 ANALYTICAL DATASET
DROP TABLE IF EXISTS crime_powerbi;
CREATE TABLE crime_powerbi AS
SELECT *
FROM crime_cleaned
WHERE Crime_Year IN (2020, 2021, 2022);

-- Check year-wise records
SELECT
    Crime_Year,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY Crime_Year
ORDER BY Crime_Year;

SELECT COUNT(*) AS Total_Crimes
FROM crime_powerbi;

-- Q1. TOTAL CRIME OVERVIEW
SELECT
    COUNT(*) AS Total_Crimes
FROM crime_powerbi;

-- Q2. YEAR-WISE CRIME TREND
SELECT
    Crime_Year,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY Crime_Year
ORDER BY Crime_Year;

-- Q3. MONTH-WISE CRIME TREND
SELECT
    Crime_Month,
    Month_Name,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY Crime_Month, Month_Name
ORDER BY Crime_Month;

-- Q4. TOP 10 CRIME TYPES
SELECT
    Crm_Cd_Desc,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY Crm_Cd_Desc
ORDER BY Total_Crimes DESC
LIMIT 10;

-- Q5. CRIME DESCRIPTION BY AREA
SELECT
    AREA_NAME,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY AREA_NAME
ORDER BY Total_Crimes DESC;

-- Q6. CRIME BY HOUR
SELECT
    Crime_Hour,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY Crime_Hour
ORDER BY Crime_Hour;

-- Q7. VICTIM GENDER ANALYSIS
SELECT
    Vict_Sex,
    COUNT(*) AS Total_Victims
FROM crime_powerbi
GROUP BY Vict_Sex
ORDER BY Total_Victims DESC;

-- Q8. VICTIM AGE GROUP ANALYSIS
SELECT
    Age_Group,
    COUNT(*) AS Total_Victims
FROM crime_powerbi
GROUP BY Age_Group
ORDER BY Total_Victims DESC;

-- Q9. CRIME BY VICTIM DESCENT
SELECT
    Vict_Descent,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Vict_Descent
ORDER BY Total DESC;

-- Q10. MOST COMMON WEAPONS
SELECT
    Weapon_Desc,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Weapon_Desc
ORDER BY Total DESC
LIMIT 10;

-- Q11. CRIME BY PREMISES
SELECT
    Premis_Desc,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Premis_Desc
ORDER BY Total DESC
LIMIT 10;

-- Q12. CASE RESOLUTION ANALYSIS
SELECT
    Status_Desc,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Status_Desc
ORDER BY Total DESC;

-- Q13. CRIME GROWTH BY YEAR (%)
WITH yearly AS
(
    SELECT
        Crime_Year,
        COUNT(*) AS Total_Crimes
    FROM crime_powerbi
    GROUP BY Crime_Year
)

SELECT
    Crime_Year,
    Total_Crimes,
    LAG(Total_Crimes) OVER (
        ORDER BY Crime_Year
    ) AS Previous_Year,
    ROUND(
        (
            (Total_Crimes -
            LAG(Total_Crimes) OVER (
                ORDER BY Crime_Year
            ))
            /
            LAG(Total_Crimes) OVER (
                ORDER BY Crime_Year
            )
        ) * 100,
        2
    ) AS Growth_Percentage
FROM yearly
ORDER BY Crime_Year;

-- Q14. TOP 5 CRIME AREAS
SELECT
    AREA_NAME,
    COUNT(*) AS Total_Crimes,
    RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS Rank_No
FROM crime_powerbi
GROUP BY AREA_NAME
ORDER BY Total_Crimes DESC
LIMIT 5;

-- Q15. TOP CRIME IN EACH AREA
SELECT *
FROM
(
    SELECT
        AREA_NAME,
        Crm_Cd_Desc,
        COUNT(*) AS Total_Crimes,
        RANK() OVER (
            PARTITION BY AREA_NAME
            ORDER BY COUNT(*) DESC
        ) AS Rank_No
    FROM crime_powerbi
    GROUP BY
        AREA_NAME,
        Crm_Cd_Desc
) x
WHERE Rank_No = 1;

-- Q16. WEAPON USED BY CRIME TYPE
SELECT
    Crm_Cd_Desc,
    Weapon_Desc,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY
    Crm_Cd_Desc,
    Weapon_Desc
ORDER BY Total DESC;

-- Q17. MONTHLY CRIME TREND BY YEAR
SELECT Crime_Year,Crime_Month,Month_Name,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Crime_Year,Crime_Month,Month_Name
ORDER BY Crime_Year,Crime_Month;

-- Q18. TOP 10 CRIME HOTSPOTS
SELECT
    LOCATION,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY LOCATION
ORDER BY Total DESC
LIMIT 10;

-- Q19. CRIME PERCENTAGE BY AREA
SELECT
    AREA_NAME,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM crime_powerbi),
        2
    ) AS Crime_Percentage
FROM crime_powerbi
GROUP BY AREA_NAME
ORDER BY Crime_Percentage DESC;

-- Q20. TOP 3 CRIMES IN EVERY AREA
SELECT *
FROM
(
    SELECT
        AREA_NAME,
        Crm_Cd_Desc,
        COUNT(*) AS Total_Crimes,
        RANK() OVER (
            PARTITION BY AREA_NAME
            ORDER BY COUNT(*) DESC
        ) AS Rank_No
    FROM crime_powerbi
    GROUP BY
        AREA_NAME,
        Crm_Cd_Desc
) X
WHERE Rank_No <= 3;

-- Q21. AVERAGE VICTIM AGE BY CRIME TYPE
SELECT
    Crm_Cd_Desc,
    ROUND(AVG(Vict_Age), 1) AS Avg_Age
FROM crime_powerbi
GROUP BY Crm_Cd_Desc
ORDER BY Avg_Age DESC;

-- Q22. AREA RISK SCORE
SELECT
    AREA_NAME,
    COUNT(*) AS Total_Crimes,
    SUM(
        CASE
            WHEN Weapon_Desc != 'No Weapon Reported'
            THEN 1
            ELSE 0
        END
    ) AS Weapon_Crimes
FROM crime_powerbi
GROUP BY AREA_NAME
ORDER BY Total_Crimes DESC;

-- Q23. RUNNING TOTAL OF CRIMES
SELECT
    Crime_Year,
    COUNT(*) AS Total_Crimes,
    SUM(
        COUNT(*)
    ) OVER (
        ORDER BY Crime_Year
    ) AS Running_Total
FROM crime_powerbi
GROUP BY Crime_Year
ORDER BY Crime_Year;

-- DATA QUALITY CHECKS
-- Total rows
SELECT
    COUNT(*) AS Total_Rows
FROM crime_powerbi;


-- Available and NULL Age
SELECT
    COUNT(*) AS Total_Rows,

    SUM(
        CASE
            WHEN Vict_Age IS NULL THEN 1
            ELSE 0
        END
    ) AS Null_Age,

    SUM(
        CASE
            WHEN Vict_Age IS NOT NULL THEN 1
            ELSE 0
        END
    ) AS Available_Age

FROM crime_powerbi;


-- Age Groups
SELECT
    Age_Group,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Age_Group
ORDER BY Total DESC;


-- Victim Sex
SELECT
    Vict_Sex,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Vict_Sex
ORDER BY Total DESC;


-- Victim Descent
SELECT
    Vict_Descent,
    COUNT(*) AS Total
FROM crime_powerbi
GROUP BY Vict_Descent
ORDER BY Total DESC;

SELECT
    Crime_Year,
    COUNT(*) AS Total_Crimes
FROM crime_powerbi
GROUP BY Crime_Year
ORDER BY Crime_Year;

=======
ALTER TABLE crime_raw ADD Crime_Hour INT;
UPDATE crime_raw SET Crime_Hour = FLOOR(TIME_OCC / 100);
DESCRIBE crime_raw;
ALTER TABLE crime_raw DROP COLUMN Date_Rptd, DROP COLUMN DATE_OCC;
CREATE TABLE crime_cleaned AS SELECT * FROM crime_raw;
SELECT * FROM crime_cleaned;
ALTER TABLE crime_cleaned DROP TIME_OCC;
DESCRIBE crime_cleaned;


-- QUERIES

-- Q.1) Total Crime Overview
SELECT COUNT(*) AS Total_Crimes FROM crime_cleaned;

-- Q.2) Year-Wise Crime Trend
SELECT Crime_Year,COUNT(*) AS Total_Crimes FROM crime_cleaned 
GROUP BY Crime_Year Order by Crime_Year;

-- Q.3) Month-Wise Crime Trend
SELECT Month_Name,COUNT(*) AS Total_Crimes FROM crime_cleaned 
GROUP BY Crime_Month,Month_Name Order by Crime_Month;

-- Q.4) TOP 10 Crime Types
SELECT Crm_Cd_Desc,COUNT(*) AS Total_Crimes FROM crime_cleaned 
GROUP BY Crm_Cd_Desc Order by Total_Crimes DESC LIMIT 10;

-- Q.5) Crime Description By Area
SELECT AREA_NAME,COUNT(*) AS Total_Crimes FROM crime_cleaned 
GROUP BY AREA_NAME Order by Total_Crimes DESC;

-- Q.6) Crime By Hour
SELECT Crime_Hour,COUNT(*) AS Total_Crimes FROM crime_cleaned 
GROUP BY Crime_Hour Order by Crime_Hour;

-- Q.7) Victim Gender Analysis
SELECT Vict_Sex,COUNT(*) AS Total_Victims FROM crime_cleaned 
GROUP BY Vict_Sex;

-- Q.8) Victim Age Group Analysis
SELECT Age_Group,COUNT(*) AS Total_Victims FROM crime_cleaned 
GROUP BY Age_Group ORDER BY Total_Victims DESC;

-- Q.9) Crime By Victim Descent
SELECT Vict_Descent,COUNT(*) AS Total FROM crime_cleaned 
GROUP BY Vict_Descent ORDER BY Total DESC;

-- Q.10) Most Common Weapons
SELECT Weapon_Desc,COUNT(*) AS Total FROM crime_cleaned 
GROUP BY Weapon_Desc ORDER BY Total DESC LIMIT 10;

-- Q.11) Crime by Premises
SELECT Premis_Desc,COUNT(*) AS Total FROM crime_cleaned 
GROUP BY Premis_Desc ORDER BY Total DESC LIMIT 10;

-- Q.12) Case Resolution Analysis
SELECT Status_Desc,COUNT(*) AS Total FROM crime_cleaned 
GROUP BY Status_Desc ORDER BY Total DESC;

-- Q.13) Crime Growth By Year(%)
WITH yearly AS
(SELECT Crime_Year,COUNT(*) AS Total_Crimes
FROM crime_cleaned GROUP BY Crime_Year)
SELECT Crime_Year,Total_Crimes,
LAG(Total_Crimes) OVER(ORDER BY Crime_Year) AS Previous_Year,
ROUND(((Total_Crimes-LAG(Total_Crimes) OVER(ORDER BY Crime_Year))/
LAG(Total_Crimes) OVER(ORDER BY Crime_Year))*100,2) AS Growth_Percentage
FROM yearly;

-- Q.14) Top 5 Crime Areas
SELECT AREA_NAME, COUNT(*) AS Total_Crimes,
RANK() OVER(ORDER BY COUNT(*) DESC) AS RANK_NO
FROM crime_cleaned
GROUP BY AREA_NAME LIMIT 5;

-- Q.15) Top Crime In Each Area
SELECT * FROM(
SELECT AREA_NAME,Crm_Cd_Desc, COUNT(*) AS Total_Crimes,
RANK() OVER(PARTITION BY AREA_NAME ORDER BY COUNT(*) DESC) AS RANK_NO
FROM crime_cleaned
GROUP BY AREA_NAME,Crm_Cd_Desc
) x WHERE RANK_NO=1;

-- Q.16) Weapon Used By Crime Type
SELECT Crm_Cd_Desc,Weapon_Desc,COUNT(*) AS Total 
FROM crime_cleaned
GROUP BY Crm_Cd_Desc,Weapon_Desc ORDER BY Total DESC;

-- Q.17) Monthly Crime Trend By Year
SELECT Crime_Year,Month_Name,COUNT(*) AS Total
FROM crime_cleaned
GROUP BY Crime_Year, Crime_Month, Month_Name ORDER BY Crime_Year;

-- Q.18) TOP 10 Crime Hotspots
SELECT Location,COUNT(*) AS Total
FROM crime_cleaned
GROUP BY Location ORDER BY Total DESC;

-- Q.19) Crime Percentage By Area
SELECT AREA_NAME,ROUND(COUNT(*)*100/(SELECT COUNT(*) FROM crime_cleaned),2)
AS Crime_Percentage FROM crime_cleaned
GROUP BY AREA_NAME ORDER BY Crime_Percentage DESC;

-- Q.20) Top 3 Crimes In Every Area
SELECT * FROM(
SELECT AREA_NAME,Crm_Cd_Desc,
RANK() OVER(PARTITION BY AREA_NAME ORDER BY COUNT(*) DESC) AS RANK_NO
FROM crime_cleaned
GROUP BY AREA_NAME,Crm_Cd_Desc
) X WHERE RANK_NO<4;

-- Q.21) Average Victim Age By Crime Type
SELECT Crm_Cd_Desc,ROUND(AVG(Vict_Age),1) AS Avg_Age
FROM crime_cleaned
GROUP BY Crm_Cd_Desc ORDER BY Avg_Age DESC;

-- Q.22) Area Risk Score
SELECT AREA_NAME,COUNT(*) AS Total_Crimes,SUM(
CASE WHEN Weapon_Desc!='No Weapon Reported' THEN 1 ELSE 0 END) AS Weapon_Crimes
FROM crime_cleaned
GROUP BY AREA_NAME ORDER BY Total_Crimes DESC;

-- Q.23) Running Total Of Crimes
SELECT Crime_Year,COUNT(*) AS Total_Crimes,SUM(COUNT(*)) OVER(ORDER BY Crime_Year)
AS Running_Total FROM crime_cleaned
GROUP BY Crime_Year;
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
