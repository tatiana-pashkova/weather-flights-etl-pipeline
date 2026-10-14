DROP DATABASE IF EXISTS weather_flights_db;

-- Create the database
CREATE DATABASE weather_flights_db;

-- Use the database
USE weather_flights_db;

-- Create the 'cities' table
DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    city_id INT AUTO_INCREMENT, -- Automatically generated ID for each city
    city_name VARCHAR(255) NOT NULL, -- Name of the city, null not allowed
	country VARCHAR(255) NOT NULL, -- Country where the city is
    latitude DECIMAL(8,6), -- Latitude, up to 8 digits, 6 digits after the decimal point
    longitude DECIMAL(9,6), -- Longitude, up to 9 digits, 6 digits after the decimal point
    PRIMARY KEY (city_id)  
);


select *
from cities;

-- Create the 'weather_forecasts' table
DROP TABLE IF EXISTS weather_forecasts;

CREATE TABLE weather_forecasts (
    prediction_id INT AUTO_INCREMENT, -- Automatically generated ID for each prediction
    city_id INT,
    temp FLOAT, 
    feels_like FLOAT,
    temp_min FLOAT,
    temp_max FLOAT, 
    sky varchar(255),
    sky_description varchar(255),
    perc_clouds INT,
    wind_speed FLOAT,
    wind_gust FLOAT, 
    prob_rain FLOAT,
    date_time DATETIME,
    retrieval_time DATETIME,
	PRIMARY KEY (prediction_id), -- Primary key to uniquely identify each prediction
    FOREIGN KEY (city_id) REFERENCES cities(city_id) -- Foreign key to connect each prediction to its city
);

select * from weather_forecasts;

-- Create the 'airports' table
DROP TABLE IF EXISTS airports;

CREATE TABLE airports (
    icao varchar(25),
    iata varchar(25), 
    `name` varchar(255),
    shortName varchar(255),
    municipalityName varchar(255), 
    countryCode varchar(25),
    timeZone varchar(255),
    `location.lat` FLOAT,
    `location.lon` FLOAT,
	PRIMARY KEY (icao) -- Primary key to uniquely identify each airport
);

select * from airports;

-- Create the 'cities_airports' table - the connection between cities and airports
DROP TABLE IF EXISTS cities_airports;

CREATE TABLE cities_airports (
    city_id INT,
    icao VARCHAR(25),
    PRIMARY KEY (city_id, icao),
	FOREIGN KEY (icao) REFERENCES airports(icao),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

select * from cities_airports;

-- Create the 'arriving_flights' table 
DROP TABLE IF EXISTS arriving_flights;

CREATE TABLE arriving_flights (
	arrival_id INT AUTO_INCREMENT,
	icao VARCHAR(25),
    retrieval_time DATETIME,
    arrival_time_sch_local DATETIME,
    arrival_time_revised_local DATETIME, 
    arrival_time_sch_utc DATETIME,
	arrival_time_revised_utc DATETIME,
    dep_time_sch_utc DATETIME,
    dep_time_revised_utc DATETIME,
    dep_airport_icao VARCHAR(25),
	dep_airport_name VARCHAR(255),
    dep_airport_country VARCHAR(25),
    airline VARCHAR(255),
    flight_length_hrs FLOAT, 
    PRIMARY KEY (arrival_id),
    FOREIGN KEY (icao) REFERENCES airports(icao)
);

