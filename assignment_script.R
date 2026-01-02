# =================================================================
# PROJECT: Price Elasticity Multivariate Regression Analysis
# GOAL: Determine the impact of Price on Sales Volume
# =================================================================

# 1. LOAD NECESSARY LIBRARIES
library(tidyverse) # For data manipulation and plotting
library(car)       # For Multicollinearity (VIF)
library(lmtest)    # For Heteroscedasticity (BP Test)
library(broom)     # For cleaning statistical output

# 2. DATA IMPORT
# Using the corrected path from your Documents folder
path_docs <- paste0(Sys.getenv("USERPROFILE"), "/Documents/pricing_data.csv")
my_data <- read.csv(path_docs)

# 3. FEATURE ENGINEERING (Log Transformations)
# Log-Log models are the standard for calculating "Elasticity"
my_data$log_sales <- log(my_data$sales_volume)
my_data$log_price <- log(my_data$price)

# 4. MULTIVARIATE REGRESSION MODELING
# We include price, marketing, competition, and segments to isolate effects
model <- lm(log_sales ~ log_price + marketing_spend + competitor_price + segment, data = my_data)

# 5. OUTPUT RESULTS FOR REPORT
print("--- REGRESSION SUMMARY TABLE ---")
summary(model)

# 6. MODEL VALIDATION (Assumptions Testing)
print("--- VIF TEST (Checks for Multicollinearity) ---")
vif(model)

print("--- BREUSCH-PAGAN TEST (Checks for Heteroscedasticity) ---")
bptest(model)

# 7. FINAL VISUALIZATION
# Create a coefficient plot with 95% Confidence Intervals
viz_results <- tidy(model, conf.int = TRUE) %>% 
  filter(term != "(Intercept)")

ggplot(viz_results, aes(x = estimate, y = term)) +
  geom_point(size = 3, color = "steelblue") +
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high), height = 0.2) +
  geom_vline(xintercept = 0, color = "red", linetype = "dashed") +
  labs(
    title = "Impact of Factors on Sales Volume",
    subtitle = "Analysis of Price Elasticity and Market Drivers",
    x = "Coefficient Estimate (Impact)", 
    y = "Variables"
  ) +
  theme_minimal()

# 8. CLEANUP (Optional)
# This removes the raw data from memory but keeps your results
# rm(my_data, path_docs)
