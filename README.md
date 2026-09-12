<<<<<<< HEAD
# 🚔 Crime Intelligence & Public Safety Analytics Dashboard (2020–2022)
=======
# 🚔 Crime Intelligence & Public Safety Analytics Dashboard (2020–2024)
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873

> **An End-to-End Business Intelligence Project using SQL, Python, and Power BI**

---

# 📌 Project Overview

<<<<<<< HEAD
Crime analysis plays a vital role in improving public safety and optimizing law enforcement resource allocation. This project analyzes **601K+ crime records (2020–2022)** to uncover meaningful insights related to crime trends, high-risk areas, victim demographics, weapon usage, and case resolution.
=======
Crime analysis plays a vital role in improving public safety and optimizing law enforcement resource allocation. This project analyzes **1M+ crime records (2020–2024)** to uncover meaningful insights related to crime trends, high-risk areas, victim demographics, weapon usage, and case resolution.
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873

The project demonstrates an end-to-end Business Intelligence workflow involving **SQL**, **Python**, and **Power BI**, transforming raw data into interactive dashboards and actionable business insights.

---

# 🎯 Business Objectives

<<<<<<< HEAD
- Analyze crime trends from 2020–2022
=======
- Analyze crime trends from 2020–2024
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
- Identify crime hotspots and high-risk police areas
- Discover the most frequently reported crime categories
- Analyze victim demographics (Age, Gender, Descent)
- Evaluate weapon-related crimes
- Study crime distribution across locations and premises
- Build an interactive dashboard for decision-makers

---

# 🛠️ Tech Stack

| Technology | Purpose |
|------------|----------|
| **MySQL** | Data Cleaning, Feature Engineering & Business Analysis |
| **Python** | Exploratory Data Analysis (EDA) |
| **Pandas** | Data Manipulation & Data Analysis |
| **NumPy** | Numerical Computing |
| **Matplotlib** | Data Visualization |
| **Seaborn** | Statistical Data Visualization |
| **Power BI** | Interactive Dashboard Development |
| **DAX** | KPI Calculations & Measures |
| **Jupyter Notebook** | Data Analysis & Documentation |

---

# 📂 Project Structure

```text
Crime-Intelligence-Dashboard/
│
├── SQL/
<<<<<<< HEAD
│   ├── crime_data.sql
=======
│   ├── create_data.sql
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
│
├── Python/
│   ├── crime_analysis.ipynb
│
├── PowerBI/
│   └── Crime_Analysis Dashboard.pbix
│
├── Dashboard Images/
│   ├── 01_Executive_Overview.jpeg
│   ├── 02_Victim_Demographics_and_Crime_Characteristics.jpeg
│   └── 03_Advanced_Crime_Intelligence_and_Strategic_Insights.jpeg
│
└── README.md
```

---

# 📊 Dataset Information

## Dataset

Due to GitHub's file size limitation, the dataset is not included in this repository.

Source:
https://data.lacity.org/Public-Safety/Crime-Data-from-2020-to-Present

<<<<<<< HEAD
The dataset contains over **601,319** reported crime incidents from **2020–2022**, including:
=======
The dataset contains over **1 Million** reported crime incidents from **2020–2024**, including:
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873

- Crime Report Number
- Crime Category
- Police Area
- Reporting Date
- Occurrence Date
- Victim Age
- Victim Gender
- Victim Descent
- Weapon Used
- Premises Description
- Case Status
- Latitude & Longitude

---

# 🧹 Data Cleaning (SQL)

The dataset was cleaned using MySQL before analysis.

### Data Cleaning Steps

- Removed duplicate records
<<<<<<< HEAD
- Identified and appropriately handled missing values
=======
- Handled missing values
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
- Standardized categorical values
- Cleaned victim demographic fields
- Converted date columns into SQL Date format
- Removed unnecessary columns
- Created a cleaned dataset (`crime_cleaned`)
- Feature Engineering

### Feature Engineering

Created the following analytical features:

- Crime Year
- Crime Month
- Month Name
- Quarter Number
- Crime Hour
- Victim Age Group

---

# 📈 SQL Business Analysis

The following business questions were answered using SQL:

- Total Crimes Reported
- Year-wise Crime Trend
- Monthly Crime Trend
- Top Crime Categories
- Top High-Crime Areas
- Crime Distribution by Hour
- Victim Gender Analysis
- Victim Age Group Analysis
- Crime by Victim Descent
- Weapon Crime Analysis
- Crime by Premises
- Case Resolution Analysi
- Crime Growth By Year
- Area Ranking
- Running Total Analysis
- Percentage Contribution Analysis

### SQL Concepts Used

- Aggregate Functions
- GROUP BY
- CASE WHEN
- CTEs
- Window Functions
- RANK()
- LAG()
- Subqueries
- Date Functions

---

# 🐍 Python Analysis

Performed Exploratory Data Analysis (EDA) using Python.

### Libraries Used

- Pandas
- NumPy
- Matplotlib
- Seaborn

### Analysis Performed

- Dataset Exploration
- Missing Value Analysis
- Crime Trend Visualization
- Crime Category Analysis
- Area-wise Crime Analysis
- Victim Demographic Analysis
- Weapon Crime Analysis
- Correlation Analysis
- Business Insights

---

# 📊 Power BI Dashboard

The Power BI report consists of **three interactive pages**.

---

## 📄 Page 1 – Executive Overview

### KPI Cards

- 🚨 Total Reported Crimes
- 📂 Crime Categories
- 📍 Police Areas Covered

### Visualizations

- Crime Trend
- Top 5 Crime Categories
- Top 5 High Crime Areas
- Crime Distribution by Age Group

---

## 👥 Page 2 – Victim Demographics & Crime Characteristics

### Visualizations

- Victim Gender Distribution
- Victim Descent Distribution
- Crime Across Victim Age Groups
- Weapon Crime Distribution by Year
- Top 5 Weapon Crimes

---

## 📊 Page 3 – Advanced Crime Intelligence & Strategic Insights

### KPI Cards

- 🔫 Weapon Crime Rate (%)
- 📊 Average Crimes per Police Area
- 📅 Average Annual Crime Count

### Visualizations

- Top Crime Hotspot Locations
- Area-wise Crime Matrix
- Crime Driver Analysis (Decomposition Tree)
- Annual Change in Case Resolution Rate

---

# 📌 Key Business Insights

✔ A small number of police areas account for a significant proportion of total reported crimes.

✔ Crime patterns exhibit noticeable yearly and monthly trends.

✔ Certain crime categories consistently dominate overall incident volume.

✔ Weapon-related crimes contribute substantially to violent crime incidents.

✔ Adult victims constitute the largest affected demographic group.

✔ Geographic hotspot analysis enables targeted policing strategies.

---

# 📸 Dashboard Preview

## 📄 Executive Overview

<<<<<<< HEAD
![Executive Overview](Dashboard%20Pics/01_Executive_Overview.jpg)
=======
![Executive Overview](Dashboard%20Pics/01_Executive_Overview.jpeg)
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873

---

## 👥 Victim Demographics & Crime Characteristics

<<<<<<< HEAD
![Victim Demographics and Crime Characteristics](Dashboard%20Pics/02_Victim_Demographics_and_Crime_Characteristics.jpg)
=======
![Victim Demographics and Crime Characteristics](Dashboard%20Pics/02_Victim_Demographics_and_Crime_Characteristics.jpeg)
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873

---

## 📊 Advanced Crime Intelligence & Strategic Insights

<<<<<<< HEAD
![Advanced Crime Intelligence and Strategic Insights](Dashboard%20Pics/03_Advanced_Crime_Intelligence_and_Strategic_Insights.jpg)
=======
![Advanced Crime Intelligence and Strategic Insights](Dashboard%20Pics/03_Advanced_Crime_Intelligence_and_Strategic_Insights.jpeg)
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873

---

# 🚀 How to Run the Project

## 1️⃣ SQL

- Import the dataset into MySQL.
- Execute:
  - `crime_data.sql`
  
---

## 2️⃣ Python

Install dependencies

```bash
<<<<<<< HEAD
pip install pandas numpy matplotlib seaborn plotly
=======
pip install pandas numpy matplotlib
>>>>>>> e71dd5b82fe43f416b0bcbfb95cd10c0f391b873
```

Run

```bash
python crime_analysis.ipynb
```

---

## 3️⃣ Power BI

Open

```text
Crime_Analysis Dashboard.pbix
```

Refresh the dataset if required.

---

# 📚 Skills Demonstrated

- SQL
- Data Cleaning
- Data Transformation
- Feature Engineering
- Window Functions
- Exploratory Data Analysis (EDA)
- Data Visualization
- Business Intelligence
- Dashboard Development
- Power BI
- DAX
- Business Storytelling

---
