## OVERVIEW

The dataset was collected from Data.CMS.GOV for the hospital General information. The like for the dataset is https://data.cms.gov/provider-data/dataset/xubh-q36u. 
The list includes addresses, phone numbers, hospital type, and overall hospital rating. 

### SQL Business queries
I was able to clean the data and standardize it for easier analysis
 The quesries answered during the project include:
 
 1.	How many hospitals are there in each state?
(Useful for understanding regional healthcare coverage)
2.	What is the distribution of hospital ownership types (e.g., Government, Proprietary, Voluntary)?
3.	Which cities have the highest number of hospitals?
________________________________________
*Hospital Quality Ratings*
4.	Which hospitals have a 5-star rating?
(Identify top-performing hospitals)
5.	What is the average rating for hospitals by state or region?
6.	Are government hospitals rated better or worse than proprietary ones on average?
________________________________________
*Emergency Services & Special Capabilities*
7.	What percentage of hospitals provide emergency services?
8.	Which hospitals provide emergency services but have ratings below average?
9.	List all hospitals within a 50-mile radius of a given ZIP code with a 4+ star rating. (requires geolocation data, potentially external to this dataset)
10.	Find all general hospitals in California that do not offer emergency services.
________________________________________
*Operational & Management Analysis*
11.	Which hospital types are most common among low-rated hospitals (1 or 2 stars)?
12.	Are non-profit hospitals generally rated higher than for-profit ones?
