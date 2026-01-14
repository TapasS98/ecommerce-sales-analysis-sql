# E-commerce Sales Analysis SQL Project

## Project Overview

**Project Title**: E-commerce Sales Analysis  
**Level**: Beginner to Intermediate  
**Database**: `ecommerce_db`

This project demonstrates SQL skills and techniques commonly used by data analysts to explore, clean, and analyze e-commerce sales data. The project involves setting up an e-commerce database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives

1. **Set up an e-commerce database**: Create and populate a database with the provided sales data
2. **Data Cleaning**: Identify and remove records with missing or null values
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data

## Dataset Description

The dataset contains **120 records** of e-commerce transactions with the following columns:

| Column Name | Description |
|-------------|-------------|
| order_id | Unique identifier for each order |
| order_date | Date when the order was placed |
| ship_date | Date when the order was shipped |
| customer_id | Unique identifier for each customer |
| customer_name | Name of the customer |
| segment | Customer segment (Consumer, Corporate, Home Office) |
| country | Country of the customer |
| city | City of the customer |
| state | State of the customer |
| region | Geographic region (East, West, Central, South) |
| product_id | Unique identifier for each product |
| category | Product category (Furniture, Office Supplies, Technology) |
| sub_category | Product sub-category |
| product_name | Name of the product |
| sales | Sales amount in USD |
| quantity | Number of units sold |
| discount | Discount percentage applied |
| profit | Profit earned from the sale |

## Project Structure

### 1. Database Setup

**Database Creation**: Create a database named `ecommerce_db`

**Table Creation**: Create a table named `ecommerce_sales` to store the sales data

```sql
CREATE DATABASE ecommerce_db;

CREATE TABLE ecommerce_sales
(
    order_id INT PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(200),
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records
- **Customer Count**: Find unique customers
- **Product Count**: Identify unique products
- **Category Analysis**: Identify all product categories
- **Null Value Check**: Check for and remove any null values

### 3. Data Analysis & Business Questions

The project includes 20 comprehensive SQL queries covering:

**Basic Analysis:**
1. Retrieve all orders from December 2023
2. Find Technology orders exceeding $1000
3. Calculate total sales and profit by category
4. Find average discount by category
5. Identify top 10 most profitable products

**Intermediate Analysis:**
6. Analyze sales by region and customer segment
7. Calculate average delivery time by region
8. Find customers with more than 10 orders
9. Identify loss-making products
10. Calculate monthly sales trends

**Advanced Analysis:**
11. Find top 5 cities by sales
12. Calculate profit margins by sub-category
13. Analyze seasonal trends by quarter
14. Identify high-lifetime-value customers
15. Analyze discount impact on profitability

**Complex Analysis:**
16. Year-over-year growth analysis
17. Top performing products by region
18. Customer segmentation analysis
19. Repeat customer identification
20. Best vs worst product comparison

## Key Findings

- **Product Performance**: Technology category generates highest revenue but Office Supplies maintains better profit margins
- **Customer Behavior**: Corporate segment shows highest average order value
- **Geographic Trends**: West region leads in sales volume
- **Discount Analysis**: Heavy discounting (>20%) negatively impacts profitability
- **Seasonal Patterns**: Q4 shows peak sales activity

## Reports

- **Sales Dashboard**: Summary of total sales, profit, and key metrics
- **Customer Analytics**: Insights into customer segments and lifetime value
- **Product Performance**: Top and bottom performing products
- **Regional Analysis**: Sales distribution across different regions

## Tools Used

- **Database**: MySQL / PostgreSQL
- **SQL Techniques**: 
  - Aggregate Functions
  - Window Functions
  - CTEs (Common Table Expressions)
  - Joins
  - Subqueries
  - Date Functions
  - CASE Statements

## How to Use This Project

### Step 1: Clone the Repository
```bash
git clone https://github.com/yourusername/ecommerce-sales-analysis-sql.git
cd ecommerce-sales-analysis-sql
```

### Step 2: Set Up the Database
1. Open your SQL client (MySQL Workbench, pgAdmin, DBeaver, etc.)
2. Run the database setup script to create the database and table
3. Import the CSV file or run INSERT statements

### Step 3: Import the Dataset
**Option A - Using CSV Import:**
```sql
LOAD DATA INFILE 'path/to/ecommerce_sales.csv'
INTO TABLE ecommerce_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
```

**Option B - Manual Import:**
- Use your SQL client's import wizard
- Select the `ecommerce_sales.csv` file
- Map columns appropriately

### Step 4: Run the Analysis Queries
- Open the `ecommerce_analysis.sql` file
- Execute queries individually or in sections
- Analyze the results

### Step 5: Explore and Modify
- Modify queries to explore different aspects
- Create your own business questions
- Build custom reports

## Prerequisites

- Basic understanding of SQL
- SQL database management system (MySQL, PostgreSQL, SQL Server, etc.)
- SQL client software

## Project Structure
```
ecommerce-sales-analysis-sql/
│
├── data/
│   └── ecommerce_sales.csv
│
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_data_exploration.sql
│   └── 03_analysis_queries.sql
│
├── README.md
│
└── results/
    └── analysis_findings.md
```

## Future Enhancements

- Add data visualization using Python/R
- Create interactive dashboards with Tableau/Power BI
- Implement predictive analytics for sales forecasting
- Add customer churn analysis
- Build automated reporting scripts

## Learning Outcomes

After completing this project, you will be able to:
- Set up and manage a relational database
- Perform comprehensive data cleaning
- Write complex SQL queries
- Analyze business metrics
- Extract actionable insights from data
- Present findings effectively

## Contributing

Contributions are welcome! Feel free to:
- Report bugs
- Suggest new analysis queries
- Improve documentation
- Add new features

## License

This project is open source and available under the MIT License.

## Acknowledgments

- Inspired by real-world e-commerce data analysis scenarios
- Dataset created for educational purposes
- Thanks to the SQL and data analytics community

---

⭐ If you found this project helpful, please give it a star!

