# ETL-Project

GW Data Analytics Bootcamp: ETL Project
“DC Museums Ratings & Likes”
Aya Heshmat, Linxi Zhao, & Sarah Osorio

#Project Proposal
After requesting API data from the Yelp website, our team will scrape information from Instagram to create a database of a handful of DC Museums. The database will include yelp ratings, # of comments and likes from the first load of Instagram posts from museum hashtags.


#EXTRACT
Finding Data
Using the Yelp API documentation, we were able to pull dictionary keys from a direct search including the following parameters: term includes “museum” and location = “dc”. The data was converted to a json object that includes: name of museum, hashtag of museum, number of ratings, and rating for the museum. The data was exported as a csv file to import to the database. 

The Instagram data was pulled via web-scraping the html of each museum hashtag. We extracted html elements including: the hashtag, the unique Instagram url for each post, number of likes per post, and number of comments per post. The lists of the data were converted to a json object and exported as a csv to import to the database.

The Instagram data was summarized using jupyter notebook pandas into a dataframe that includes: sum of the number of likes and sum of the number of comments per each Instagram hashtag. The Instagram hashtag correlates to the museum name created by looping through the museum names and removing all the spaces.


#TRANSFORM
Data Cleanup & Analysis
Using pgAdmin and postgres, SQL code was performed to create the following database tables: yelp_data, ig_data, and ig_summary_data that includes the data we found (see previous section). Primary IDs, Comments and likes were converted to integers, rating was converted to a float as it includes decimals, and the names and hashtags were converted to characters/string. Primary keys were assigned by the unique values in each dataset. Yelp_data has a serial ID, ig_data has unique url links, ig_summary_data has unique hashtags, and the Museum’s primary key is a serial id. 


#LOAD
Final Database
The CSV files were loaded to the pgAdmin database that was structured using SQL language to create three tables: yelp_data, ig_data, ig_data_summary, and museums. We imported the yelp csv, Instagram csv, and the Instagram Summary csv. A Museum table was created to hold unique museum ID as well as the hashtag. This database followed the rules of first normalization. With this structure, we can extract data from multiple tables via easy searching with the indices created by primary keys. 
