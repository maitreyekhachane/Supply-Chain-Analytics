# Supply-Chain-Analytics

![Executive Summary](Dashboard%20images/Executive%20Summary.png)

# DataCo Supply Chain Analytics

End-to-end Supply Chain Analytics using Python, SQL Server, and Power BI.

## 📌 Project Overview

Supply chain management involves coordinating orders, inventory, shipping, and delivery while maintaining sales and profitability. Delays, unprofitable products, and changes in sales performance can affect customer satisfaction and business growth.

This project analyzes the DataCo supply chain dataset to understand sales and profit performance, identify products and markets contributing to business results, evaluate delivery performance, and uncover operational risks.

The project follows an end-to-end analytics workflow using **Python**, **SQL Server**, and **Power BI** to transform raw data into meaningful business insights and actionable recommendations.

## 🎯 Objectives

- Analyze overall sales, profit, and profitability trends.
- Identify high-performing and low-performing products.
- Evaluate sales performance across markets, customer segments, and time periods.
- Analyze delivery delays and shipping-mode performance.
- Investigate unprofitable order items and discount-related profitability patterns.
- Track monthly and yearly sales trends.
- Build an interactive Power BI dashboard to support business decision-making.
- Provide data-driven recommendations to improve profitability and operational performance.

## 🛠️ Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Seaborn
  - Data Cleaning and Transformation
  - Exploratory Data Analysis (EDA)

- **SQL Server**
  - SQL Queries
  - Aggregate Functions
  - `GROUP BY` and `ORDER BY`
  - Common Table Expressions (CTEs)
  - Window Functions
  - Business Metrics and Performance Analysis

- **Power BI**
  - DAX Measures
  - Interactive Dashboards
  - KPI Cards
  - Time-Series Analysis
  - Drill-through and Tooltips, where applicable
  - Product and Market Analysis
  - Delivery Performance Analysis
  - Insights and Recommendations

## 📂 Project Workflow

```text
Raw Dataset
    ↓
Data Cleaning & Transformation (Python)
    ↓
Feature Engineering
    ↓
Exploratory Data Analysis (EDA)
    ↓
SQL Server Data Import
    ↓
SQL Analysis & Business Queries
    ↓
Power BI Dashboard Development
    ↓
Business Insights & Recommendations
```

## 📈 Dataset Information

The project uses the DataCo Supply Chain dataset.

- **Total Records:** 180,519
- **Total Columns:** 58
- **Total Sales:** 36.78M
- **Total Profit:** 3.97M
- **Profit Margin:** 10.78%
- **Total Orders:** 65,752
- **Total Customers:** 20,652
- **Average Order Value:** 559.45
- **Late Delivery Rate:** 54.83%

*Note: Sales and profit are presented in the dataset's recorded units. The late delivery rate is calculated at the order-item record level, not the distinct-order level.*

## 🔍 Data Cleaning & Feature Engineering

The Python phase focused on preparing the dataset for reliable analysis.

Key activities included:

- Inspecting dataset structure, data types, and missing values.
- Handling missing values where appropriate.
- Reviewing repeated customer and order identifiers without incorrectly removing valid order-item records.
- Converting order dates into datetime format.
- Creating shipping delay features for delivery analysis.
- Preparing the cleaned dataset for SQL Server and Power BI.
- Performing exploratory analysis to identify trends, outliers, and potential business risks.

## 📊 Dashboard Pages

### 1️⃣ Executive Overview

- Total Sales
- Total Profit
- Profit Margin
- Total Orders
- Total Customers
- Average Order Value
- Overall business performance overview

### 2️⃣ Sales & Product Performance

- Sales and Profit Analysis
- Top Products by Sales
- Product-Level Profitability
- Category Performance
- Sales Trends Over Time
- Identification of Unprofitable Products

### 3️⃣ Market & Customer Analysis

- Sales by Market
- Sales by Customer Segment
- Customer Distribution
- Market-Level Performance Comparison
- Customer and Regional Sales Patterns

### 4️⃣ Delivery & Operational Performance

- Delivery Status Distribution
- Late Delivery Rate
- Shipping-Mode Performance
- Shipping Delay Analysis
- Delivery Performance Across Markets
- Operational Risk Identification

### 5️⃣ Insights & Recommendations

- Key Business Findings
- Profitability Improvement Opportunities
- Delivery Performance Risks
- Sales Trend Observations
- Data-Driven Business Recommendations

### 6️⃣ Index

- Dashboard Navigation
- Project Overview
- Navigation to Individual Dashboard Pages

## 📌 Key Insights

- The dataset records **36.78M in sales** and **3.97M in profit**, with an overall profit margin of approximately **10.78%**.
- The dataset contains **65,752 distinct orders** and **20,652 distinct customers**.
- Approximately **54.83% of order-item records** are marked as late deliveries, indicating a potential operational concern that warrants further investigation.
- First Class and Second Class shipping show higher late-delivery rates than Standard Class in the analyzed records.
- Approximately **18.71% of order-item records** have negative profit, highlighting opportunities to investigate product costs, discounts, and pricing.
- The average order value is approximately **559.45**, providing a baseline for order-value analysis.
- Monthly sales growth analysis identifies substantial declines near the end of the dataset, including a sharp decrease in November 2017. The unusually low number of records in 2018 should be checked before drawing conclusions about business decline.
- Profitability analysis across products, markets, and customer segments can help identify areas for deeper investigation and more informed business decisions.

## 💡 Business Recommendations

- **Improve delivery performance:** Investigate the reasons behind late deliveries, including fulfillment delays, shipping capacity, and logistics processes.
- **Review shipping performance:** Examine why First Class and Second Class shipments have higher recorded late-delivery rates and determine whether operational changes are needed.
- **Investigate unprofitable products:** Review product costs, selling prices, discounts, and order-level profitability to identify potential improvement opportunities.
- **Optimize discount strategies:** Compare profitability across discount levels and evaluate whether discounting policies support sustainable margins.
- **Monitor sales trends:** Track monthly and yearly performance and investigate unusual declines after validating data completeness.
- **Strengthen product-level planning:** Use sales and profit rankings to support product prioritization, inventory planning, and profitability monitoring.
- **Use market-level insights:** Compare performance across markets and customer segments to identify opportunities for targeted business strategies.
- **Monitor KPIs regularly:** Use the Power BI dashboard to track sales, profit, margins, and delivery performance over time.


## 🚀 Conclusion

This project demonstrates an end-to-end data analytics workflow, from data preparation and exploratory analysis to SQL-based business analysis and interactive Power BI reporting.

By combining Python, SQL Server, and Power BI, the project transforms supply chain data into measurable insights that can help businesses investigate profitability challenges, monitor delivery performance, and make more informed operational decisions.

**Skills demonstrated:** Data Cleaning, Exploratory Data Analysis, SQL Querying, Business Intelligence, DAX, KPI Development, Dashboard Design, and Business Insight Generation.
