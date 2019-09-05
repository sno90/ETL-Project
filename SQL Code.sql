-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/dCbgpd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Project_Awesome ETL db
CREATE TABLE "yelp_data" (
    "yelp_id" SERIAL   NOT NULL,
    "museum_name" CHAR(500)   NOT NULL,
    "museum_name_no_space" CHAR(500)   NOT NULL,
    "museum_ratings" float   NOT NULL,
    "number_of_museum_reviews" int   NOT NULL
);

CREATE TABLE "ig_data" (
    "links" CHAR   NOT NULL,
    "ig_id" SERIAL   NOT NULL,
    "number_of_comments" int   NOT NULL,
    "number_of_likes" int   NOT NULL,
    CONSTRAINT "pk_ig_data" PRIMARY KEY (
        "links"
     )
);

CREATE TABLE "ig_summary_data" (
    "museum_name_no_space" CHAR(500)   NOT NULL,
    "sum_comments" int   NOT NULL,
    "sum_likes" int   NOT NULL,
    "museumID" int   NOT NULL,
    CONSTRAINT "pk_ig_summary_data" PRIMARY KEY (
        "museum_name_no_space"
     )
);

CREATE TABLE "Museums" (
    "museumID" int   NOT NULL,
    "museum_name_no_space" CHAR(500)   NOT NULL,
    CONSTRAINT "pk_Museums" PRIMARY KEY (
        "museumID"
     )
);

ALTER TABLE "ig_summary_data" ADD CONSTRAINT "fk_ig_summary_data_museumID" FOREIGN KEY("museumID")
REFERENCES "Museums" ("museumID");

ALTER TABLE "Museums" ADD CONSTRAINT "fk_Museums_museum_name_no_space" FOREIGN KEY("museum_name_no_space")
REFERENCES "yelp_data" ("museum_name_no_space");

