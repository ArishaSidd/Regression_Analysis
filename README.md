# Price Elasticity of Demand: Multivariate Regression Analysis

## 📊 Project Overview
This project utilizes **Multivariate Log-Log Regression** to estimate the price elasticity of demand across three distinct product segments: Electronics, Clothing, and Home Goods. By controlling for marketing spend and competitor pricing, the model isolates the direct impact of price changes on sales volume.

## 🎯 Objectives
* Calculate **Price Elasticity** to determine consumer sensitivity to price changes.
* Identify the statistical significance of **Marketing Spend** and **Competitor Pricing**.
* Validate model assumptions through **VIF (Multicollinearity)** and **Breusch-Pagan (Heteroscedasticity)** tests.

## 📂 Repository Structure
* `data_generation.R`: R script to generate the synthetic dataset of 300 observations.
* `assignment_script.R`: Main analysis script containing data cleaning, modeling, and visualization.
* `pricing_data.csv`: The raw dataset used for the analysis.
* `Final_Report.pdf`: Comprehensive interpretation of the statistical findings.

## 🛠️ Tech Stack
* **Language:** R
* **Libraries:** * `tidyverse`: Data manipulation and ggplot2 visualization.
    * `car`: Variance Inflation Factor (VIF) analysis.
    * `lmtest`: Breusch-Pagan testing.
    * `broom`: Statistical tidying of model outputs.

## 📈 Key Findings
* **Price Elasticity:** The model revealed a price elasticity of **-0.102**. This indicates an inelastic demand, where a 1% increase in price leads to only a 0.1% decrease in sales.
* **Marketing Impact:** Marketing spend showed a statistically significant positive correlation with sales volume.
* **Model Fit:** The model achieved an **Adjusted R-Squared of 0.8769**, explaining nearly 88% of the variance in sales.

## 🚀 How to Run
1. Clone this repository.
2. Run `data_generation.R` to create the `pricing_data.csv` file.
3. Open `assignment_script.R` in RStudio and run the full script to generate the regression tables and coefficient plots.

## 🖼️ Visualizations
The project includes a **Coefficient Plot** that visualizes the impact of each independent variable on sales volume, including 95% confidence intervals.
