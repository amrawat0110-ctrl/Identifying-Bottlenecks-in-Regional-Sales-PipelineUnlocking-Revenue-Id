# Unlocking Revenue: Identifying Bottlenecks in Regional Sales Pipeline

A business case study project that uses **MySQL** to analyse regional
sales and **Microsoft Excel** to present results through charts, KPI
summaries, and analysis tables.

> **Important data note:** `RegionalSales2025.csv` included with this
> project is a generated sample dataset containing 1,000 rows. Replace
> it with the official class-provided dataset before submitting if your
> instructor expects the original data. Results in the Excel workbook
> and report are based on the sample data.

## Project objectives

-   Identify monthly completed-sales trends across regions.
-   Calculate cancellation and return percentages by region.
-   Find the top three region/product combinations with the highest
    potential revenue loss.
-   Compare average order value by product category.
-   Rank the top five sales agents by completed revenue.
-   Calculate category-wise sales and contribution to total sales.
-   Find customers with three or more returned orders.
-   Present key metrics and trends in an Excel dashboard.

## Project files

  -----------------------------------------------------------------------
  File                                Purpose
  ----------------------------------- -----------------------------------
  `SalesBottleneck.sql`               MySQL table setup and SQL queries
                                      for all seven analysis questions,
                                      plus dashboard-support queries.

  `RegionalSales2025.csv`             Sample sales transaction dataset
                                      with 1,000 rows.

  `BottleneckDashboard.xlsx`          Excel workbook with raw data,
                                      query-style analysis sheets, KPI
                                      summary, and charts.

  `Business_Case_Study_Report.docx`   Written project report with
                                      business problem, objectives,
                                      sample outputs, insights,
                                      recommendations, and conclusion.
  -----------------------------------------------------------------------

## Dataset columns

  Column          Description
  --------------- ---------------------------------------------
  `OrderID`       Unique order identifier
  `Date`          Transaction date
  `CustomerID`    Unique customer identifier
  `Region`        East, West, North, or South
  `ProductName`   Product name
  `Category`      Product category
  `Quantity`      Number of units sold
  `UnitPrice`     Selling price per unit
  `TotalAmount`   Total order amount (`Quantity × UnitPrice`)
  `OrderStatus`   `Completed`, `Cancelled`, or `Returned`
  `SalesAgent`    Sales agent assigned to the order

## Workflow flowchart

``` mermaid
flowchart TD
    A([Start]) --> B[Load RegionalSales2025.csv]
    B --> C[Import CSV into MySQL table: regional_sales]
    C --> D[Run SalesBottleneck.sql]
    D --> E[Analyse trends, cancellations, returns, categories and agents]
    E --> F[Review results in BottleneckDashboard.xlsx]
    F --> G[Use charts and KPI summaries to identify bottlenecks]
    G --> H[Write insights and recommended actions in the report]
    H --> I([End])
```

## Data analysis flowchart

``` mermaid
flowchart TD
    A[Sales transactions] --> B{Order status}
    B -->|Completed| C[Calculate completed revenue]
    B -->|Cancelled| D[Measure cancellations and potential revenue loss]
    B -->|Returned| E[Measure returns and identify frequent-return customers]
    C --> F[Group by month, region, category and sales agent]
    D --> F
    E --> F
    F --> G[Compare performance and find bottlenecks]
    G --> H[Recommend corrective actions]
```

## How to run the project

### 1. Import the CSV into MySQL

1.  Open MySQL Workbench and connect to your MySQL server.
2.  Create/select the database `regional_sales_db`.
3.  Use **Table Data Import Wizard** to import `RegionalSales2025.csv`.
4.  Name the imported table `regional_sales`.
5.  Confirm that column names and data types match the dataset structure
    above.

You can create the database and table by running the initial setup
statements in `SalesBottleneck.sql`. If the import wizard creates a
table for you, make sure the table is named `regional_sales`.

### 2. Run the SQL analysis

Open `SalesBottleneck.sql` in MySQL Workbench and run the queries. The
script answers these questions:

1.  Monthly trend of completed sales.
2.  Percentage of cancelled and returned orders per region.
3.  Three region/product combinations with the highest potential revenue
    loss.
4.  Average order value by category.
5.  Top five sales agents by completed revenue.
6.  Category-wise total sales and contribution to the grand total.
7.  Customers with at least three returned orders.

### 3. Review the Excel dashboard

Open `BottleneckDashboard.xlsx`. Important sheets include:

-   `Dashboard` --- summary metrics and charts.
-   `RawData` --- transaction-level data.
-   `MonthlyTrend` --- monthly completed revenue.
-   `StatusByRegion` --- cancellation and return percentages.
-   `RevenueLossTop3` --- largest potential revenue-loss combinations.
-   `CategoryAOV` --- average order value by category.
-   `TopAgents` --- top five agents by completed revenue.
-   `CategorySales` --- total sales and contribution percentages.
-   `FrequentReturns` --- customers with three or more returns.
-   `RegionCategory` and `StatusCounts` --- source tables for dashboard
    visuals.
-   `KPI` --- key performance indicators.

### 4. Interpret findings

Use the results to investigate weak regions, product categories with
high return/cancellation amounts, agent performance, and monthly
changes. Treat cancelled/returned `TotalAmount` as **potential revenue
at risk**, not necessarily accounting-recognised loss. Compare rates as
well as raw counts so that regions with different order volumes are
assessed fairly.

## Business recommendations

-   Investigate the reasons behind cancellations and returns for the top
    region/product combinations.
-   Review product descriptions, quality checks, packaging, and delivery
    issues for frequently returned products.
-   Coach sales agents using cancellation rates, customer feedback, and
    order volume alongside completed revenue.
-   Plan category promotions after checking profit margin, stock
    availability, and demand.
-   Review monthly revenue and order-status trends regularly.

## Final deliverables checklist

-   [ ] `SalesBottleneck.sql` --- SQL analysis queries.
-   [ ] `RegionalSales2025.csv` --- dataset.
-   [ ] `BottleneckDashboard.xlsx` --- Excel dashboard and analysis
    outputs.
-   [ ] `Business_Case_Study_Report.docx` --- written report.
-   [ ] `README.md` --- project documentation and flowcharts.

## Tools used

-   MySQL 8.0
-   Microsoft Excel
-   CSV dataset
-   Mermaid flowcharts (supported by GitHub Markdown preview)

## Conclusion

This project demonstrates how SQL analysis and Excel visualisation can
be combined to identify regional sales bottlenecks, monitor revenue at
risk, compare categories and sales agents, and communicate practical
business recommendations.

---

Author 

Name : Armin Khareghat 

---