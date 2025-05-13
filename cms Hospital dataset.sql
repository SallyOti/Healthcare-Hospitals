

--DATA CLEANING
--Check for duplicates
--standardize the dataset
--Remove any unwanted columns/rows


CREATE TABLE hospiatl_dataset
LIKE hospital_general_information;


SELECT * FROM cms_hospitaldataset.hospital_general_information;


INSERT INTO hospiatl_dataset
SELECT * FROM hospital_general_information;

SELECT *
FROM hospiatl_dataset;


---Check for duplicates


SELECT *,ROW_NUMBER() OVER(PARTITION BY `Facility ID`,`Facility Name`,Address,`City/Town`,State,`Zip Code`) AS row_num
FROM hospiatl_dataset;




WITH duplicate_dataset AS (
SELECT *,ROW_NUMBER() OVER(PARTITION BY `Facility ID`,`Facility Name`,Address,`City/Town`,State,`Zip Code`) AS row_num
FROM hospiatl_dataset)
SELECT *
FROM duplicate_dataset
WHERE row_num>1;

--Standardize data

UPDATE hospiatl_dataset
SET `Hospital overall rating`=Null
WHERE `Hospital overall rating`= "Not Available";




--Data exploratory Analysis


SELECT *
FROM hospiatl_dataset;

SELECT COUNT(*) AS num_hospitals,State
FROM hospiatl_dataset
Group by State;

SELECT `Hospital Ownership`,COUNT(*) AS num_hospitals
FROM hospiatl_dataset
Group by `Hospital Ownership`;


SELECT `City/Town`,COUNT(*) AS num_hospitals
FROM hospiatl_dataset
Group by  `City/Town`
ORDER BY num_hospitals DESC;



SELECT `Facility Name`,`Hospital overall rating`
FROM hospiatl_dataset
WHERE `Hospital overall rating`=5
ORDER BY `Facility Name`;


SELECT State,ROUND(AVG(`Hospital overall rating`),2) AS average_rating
FROM hospiatl_dataset
Group by State
ORDER BY average_rating DESC;



SELECT `Hospital Ownership`,ROUND(AVG(`Hospital overall rating`),2) AS average_rating
FROM hospiatl_dataset
Group by `Hospital Ownership`
ORDER BY average_rating DESC;


SELECT (SUM(`Emergency Services`='Yes')/COUNT(*))*100 AS hospitalspercentage_Emergency_service
FROM hospiatl_dataset;



SELECT `Facility Name`,`Hospital overall rating`,`Emergency Services`
FROM hospiatl_dataset
WHERE `Hospital overall rating`< (SELECT AVG(`Hospital overall rating`) AS average_rating
FROM hospiatl_dataset) AND `Emergency Services`='Yes'
ORDER BY 1,2;


SELECT `Facility Name`,State,`Emergency Services`,`Hospital Type`
FROM hospiatl_dataset
WHERE State='CA' AND `Emergency Services`='No' AND  `Hospital Type` LIKE '%Acute Care%';



SELECT DISTINCT `Hospital Type`
FROM hospiatl_dataset
WHERE `Hospital overall rating` BETWEEN 1 AND 2;




SELECT DISTINCT CASE WHEN `Hospital Ownership`LIKE '%Voluntary%' THEN 'non_profit' else 'for_profit' END AS hospital_type,`Hospital overall rating`
FROM hospiatl_dataset
WHERE `Hospital overall rating` IS NOT NULL
ORDER BY 1,2 desc;










