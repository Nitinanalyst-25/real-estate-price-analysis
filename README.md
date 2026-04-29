# Real Estate Price Analysis & Prediction
### Tools: SQL | Python | Tableau

---

## Project Overview

End-to-end property valuation analysis of 1,460 residential properties across 25 neighbourhoods to identify key price drivers and build a predictive model 
supporting data-driven real estate investment advisory decisions.

---

## Business Problem

Real estate advisory teams rely heavily on human intuition when valuing properties.
This project builds a data-driven valuation 
framework that:

- Identifies which property features 
  drive sale prices most significantly
- Predicts property sale price based 
  on its characteristics
- Surfaces market intelligence on 
  neighbourhood pricing and 
  investment opportunities
- Delivers actionable insights for 
  buyers, sellers, and advisors

---

## Dataset

- Source: Kaggle House Prices — 
  Advanced Regression Techniques
- Size: 1,460 properties | 81 features
- Target Variable: SalePrice
- Link: kaggle.com/competitions/
  house-prices-advanced-regression-techniques

---

## Project Workflow

### 1. SQL — Data Exploration & Business Segmentation
- Loaded and explored dataset structure across 81 columns
- Identified and documented missing value patterns across key columns
- Executed business segmentation queries:
  - Neighbourhood price intelligence
  - Quality rating vs price analysis
  - Property age impact on value
  - Size segment price comparison
  - Bedroom/bathroom configuration premium
- Applied Window Functions and CTEs to:
  - Rank properties within neighbourhoods
  - Calculate price deviation from 
    neighbourhood average
  - Identify premium, value, and 
    hidden gem property segments

### 2. Python — Data Cleaning,EDA & Modeling
- Dropped 7 irrelevant/null heavy columns
- Handled missing values across 13 columns using median, mode, zero, and 'None' imputation strategies
- Performed Exploratory Data Analysis:
  - SalePrice distribution analysis
  - Correlation heatmap
  - Feature vs price visualisations
  - Outlier detection
- Feature Engineering:
  - Log transformation of SalePrice
  - Property age derivation
  - Total bathroom calculation
  - Categorical encoding
  - Feature scaling
- Built and evaluated predictive models:
  - Linear Regression
  - Polynomial Regression
  - Random Forest Regressor
- Evaluated using MAE, RMSE, R²

### 3. Tableau — Dashboard & Storytelling
- Interactive dashboard communicating:
  - Market overview and price distribution
  - Neighbourhood price intelligence
  - Key price driver analysis
  - Property valuation vs neighbourhood 
    average benchmarking

---

## Key Business Insights

### Neighbourhood Intelligence
- Identified $236,719 price gap between premium neighbourhoods (NoRidge, NridgHt) and affordable areas (MeadowV, IDOTRR)
- Classified all 25 neighbourhoods into Premium, Value, and Hidden Gem opportunity segments

### Quality Impact
- Confirmed strong linear relationship between quality rating and sale price
- Properties at grade 7+ show accelerated price premium vs mid-range grade 5

### Renovation ROI
- Bathroom addition to 3-bedroom property delivers $75,472 average price premium
- Represents potential 3.5x-5x return on typical renovation investment

### Market Segmentation
- Medium sized properties (1,000-1,999 sqft) dominate market at 69.4% of all transactions
- Price per sq ft decreases as size increases confirming bulk value effect

---

## Repository Structure

```
real-estate-price-prediction/
├── data/
│   └── train.csv
├── sql/
│   └── real_estate_queries.sql
├── notebooks/
│   └── Real_Estate_Analysis.ipynb
├── visualisations/
│   └── (charts and plots)
└── README.md
```

## Status

🔄 In Progress

Completed:
✅ SQL — Data exploration and 
         business segmentation
✅ Python — Data cleaning and EDA

In Progress:
🔄 Python — Feature engineering 
            and model building

Upcoming:
📋 Tableau dashboard development

---

## Tools & Libraries

| Tool | Purpose |
|------|---------|
| MySQL | Data exploration and business queries |
| Python | Analysis, cleaning, modeling |
| Pandas | Data manipulation |
| NumPy | Numerical computing |
| Matplotlib/Seaborn | Visualisation |
| Scikit-learn | Predictive modeling |
| Tableau | Dashboard and storytelling |

---
