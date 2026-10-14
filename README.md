# weather-flights-etl-pipeline
Automated ETL pipeline integrating weather forecasts and airport arrivals into MySQL, using Python, APIs, and Google Cloud Platform (GCP).

## Overview

This project was developed as part of the **Gans e-scooter case study**.

Gans is a fictional e-scooter-sharing company. One of its operational challenges is ensuring that scooters are available where and when customers need them.

This project builds a simple data pipeline that collects external data that could later help support scooter redistribution decisions.

Read a Medium post about this project here: https://medium.com/@tatianapashkova/what-problem-am-i-trying-to-solve-data-engineering-and-goal-setting-36b9ab73d3c7

## Goal

The project provides basic data engineering infrastructure for combining weather and flight information with city data. These external factors could later be combined with scooter usage data to help Gans anticipate demand and improve scooter placement.

## Data Sources

The pipeline collects:

- **City data:** City names, countries, and coordinates scraped from Wikipedia.
- **Weather forecasts:** Five-day forecasts from the OpenWeather API.
- **Airport data:** Airports located within 50 km of each city, retrieved using the AeroDataBox API.
- **Flight data:** Flights arriving at these airports on the following day, retrieved using the AeroDataBox API.

The Python pipeline transforms the API and web-scraped data into pandas DataFrames and stores them in a MySQL database.

## Database

The MySQL database contains five tables:

- `cities`
- `weather_forecasts`
- `airports`
- `cities_airports`
- `arriving_flights`

The `cities_airports` table connects cities with their nearby airports.

## Pipeline

### One-time processes

1. Retrieve city coordinates.
2. Find airports near each city.
3. Store city and airport information in the database.

### Recurring processes

1. Retrieve five-day weather forecasts **every five days**.
2. Retrieve the next day's arriving flights **daily**.
3. Store the new data in the database.

## Technologies

- **Python:** pandas, SQLAlchemy, BeautifulSoup
- **Database:** MySQL
- **APIs:** OpenWeather API, AeroDataBox API
- **Google Cloud Platform (GCP):** Cloud SQL, Cloud Functions, Cloud Scheduler
