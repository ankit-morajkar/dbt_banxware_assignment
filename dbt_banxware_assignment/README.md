dbt Banxware Assignment

Project Overview
This project is a demonstration of using dbt (Data Build Tool) to transform raw sales and customer data for analysis in a Snowflake data warehouse. The raw data is ingested from CSV files and transformed into a structured format to answer key business questions.

Key Features:
Data Ingestion: Ingest sales.csv and customers.csv into Snowflake as raw data.
Data Transformation: Transform the raw sales data to extract year, month, day, and calculate total sales amounts.
Business Analysis: Queries to answer business questions such as the top 5 products by total sales, top customers, and average order value.

Prerequisites
Before running this project, ensure you have the following installed and configured:

dbt: Install dbt using pip
Snowflake Account: Have access to your Snowflake account to use as the data warehouse.
CSV Files: sales.csv and customers.csv located in the data/ directory of this project.

Setup Instructions
1. Clone the Repository
First, clone the repository to your local machine:

git clone https://github.com/ankit-morajkar/dbt_banxware_assignment

cd dbt_banxware_assignment

2. Set up dbt Profile
Configure dbt to connect to your Snowflake instance. This is done via the profiles.yml file located in ~/.dbt/profiles.yml.

Here is an example configuration for Snowflake:

dbt_banxware_assignment:
  outputs:
    dev:
      type: snowflake
      threads: 4
      account: <your_snowflake_account>.snowflakecomputing.com
      user: <your_snowflake_user>
      password: <your_snowflake_password>
      role: <your_snowflake_role>
      database: home_assignment
      warehouse: <your_snowflake_warehouse>
      schema: <your_snowflake_schema>
  target: dev

Replace the placeholder values (e.g., <your_snowflake_account>) with your Snowflake details.

3. Place the CSV Files in the data/ Folder
Ensure the sales.csv and customers.csv files are located in the data/ directory of the project:

4. Install dbt Dependencies
Navigate to the root of your project directory and install the dbt dependencies:

dbt deps

This will install any necessary dbt packages or dependencies for the project.

Running the Project
1. Load Data into Snowflake
To load the CSV files into Snowflake as tables (raw_sales_data and raw_customer_data), run the following command:

dbt seed

This will ingest the CSV files into your Snowflake schema.

2. Run Data Transformations
To run the transformation models that clean and structure the raw data, execute the following:

dbt run

This command will:
Create a transformed sales data table (transformed_sales_data) that includes calculated fields such as total_sales_amount and extracted date fields (year, month, day).

3. Test Your Data
To validate the integrity of the transformed data, you can run the following command:

dbt test
This will execute any tests defined in the project, such as checks for data quality or uniqueness.

4. Run Analysis Queries
The project includes SQL queries to answer specific business questions. These queries can be found in the queries/ folder. To run them in Snowflake, execute the corresponding SQL files:

Top 5 Products by Total Sales in 2023:
dbt run-operation run_query --args '{"sql_file": "queries/top_5_products_2023.sql"}'

Top 5 Customers by Total Sales in 2023:
dbt run-operation run_query --args '{"sql_file": "queries/top_5_customers_2023.sql"}'

Average Order Value per Month in 2023:
dbt run-operation run_query --args '{"sql_file": "queries/avg_order_value_by_month_2023.sql"}'

Customer with the Highest Order Volume in October 2023:
dbt run-operation run_query --args '{"sql_file": "queries/highest_order_volume_october_2023.sql"}'
