-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/dCbgpd
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Project_Awesome ETL db
CREATE TABLE `Museums` (
    `MuseumID` int  NOT NULL ,
    `Name` string  NOT NULL ,
    `location` string  NOT NULL ,
    PRIMARY KEY (
        `MuseumID`
    )
);

CREATE TABLE `yelp_data` (
    `yelp_id` int  NOT NULL ,
    `MuseumID` int  NOT NULL ,
    `Ratings` float  NOT NULL ,
    `num_ratings` int  NOT NULL ,
    PRIMARY KEY (
        `yelp_id`
    )
);

CREATE TABLE `ig_data` (
    `ig_id` int  NOT NULL ,
    `link` string  NOT NULL ,
    `museumID` int  NOT NULL ,
    `num_likes` int  NOT NULL ,
    `num_comments` int  NOT NULL ,
    PRIMARY KEY (
        `ig_id`
    )
);

ALTER TABLE `yelp_data` ADD CONSTRAINT `fk_yelp_data_MuseumID` FOREIGN KEY(`MuseumID`)
REFERENCES `Museums` (`MuseumID`);

ALTER TABLE `ig_data` ADD CONSTRAINT `fk_ig_data_museumID` FOREIGN KEY(`museumID`)
REFERENCES `Museums` (`MuseumID`);

CREATE INDEX `idx_Museums_Name`
ON `Museums` (`Name`);

