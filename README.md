# Kenyan House Data ELT Pipeline

A robust ELT pipeline that extracts, transforms, and loads house listing data in Kenya to enable insightful analytics on pricing trends, location-based market dynamics, and feature preferences. This project uses **Apache Airflow** for orchestration, **dbt** for transformation, and **Snowflake** for the data warehousing and storage.

## 🚀 Project Overview

This ELT pipeline ingests over 2,000 house listings scraped from real estate platforms and structures them for analysis. The pipeline handles:

- Extracting house data from buyrentkenya.
- Cleaning and transforming data using pandas, SQL and dbt models.
- Loading processed data into Snowflake.
- Automating the workflow using Apache Airflow.
- Generating aggregated insights like average prices per location and house capacity, number of houses per location, feature trends, and highest-priced listings.

## ⚙️ Setup Instructions
### 1. Clone this repository
Run the following command in your terminal to clone this repository:
```bash
git clone https://github.com/dkkinyua/houses_elt_pipeline
```
### 2. Install and activate virtual envioronment

Install your virtual environment using `venv` or `virtualenv` (whichever you desire) by running the following command:

```bash
python3 -m venv eltenv # Using venv, you can customize the env name
virtualenv eltenv # Using virtualenv
```
To activate the virtual environment:

```bash
source eltenv/bin/activate # Linux/MacOS
eltenv\Scripts\activate # Windows
```
### 3. Install dependencies
To run these project, you need the following dependencies. Install them by running:

```bash
pip install -r requirements.txt
```
### 4. Set up your dbt profile.

Your project credentials are set up in `~/.dbt/profiles.yml` file. You need to configure your project as so.

```yml
houses_elt_pipeline:
  outputs:
    dev:
      account: your.snowflake.acct.aws
      database: yourdb
      password: 'yourpassword'
      role: your_role
      schema: your_schema
      threads: 10
      type: snowflake
      user: user
      warehouse: your_warehouse
  target: dev
```

Replace placeholders with your Snowflake credentials.

> NOTE: There's no need of running `dbt init` while cloning this repository as it will create new files and folders. Just configure your `profiles.yml` file.

## Insights generated
- Average house price per location

- Most expensive houses per location

- Least expensive houses per location

- Average pricing per house capacity i.e. 3 bedroom, 4 bedroom


## Conclusion
Do you have an issue or would you like to contribute to this project? Contact me via [email](mailto:denzelkinyua11@gmail.com) or start a pull request.
