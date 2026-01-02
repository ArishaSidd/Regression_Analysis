# --- 1. Load Library ---
library(tidyverse)

# --- 2. Generate Data ---
set.seed(123) # Ensures you get the same numbers every time
n <- 300
segments <- c("Electronics", "Clothing", "Home_Goods")

pricing_data <- data.frame(
  segment = rep(segments, each = 100),
  marketing_spend = runif(n, 500, 2000),
  competitor_price = runif(n, 50, 150)
) %>%
  mutate(
    price = case_when(
      segment == "Electronics" ~ runif(n(), 100, 150),
      segment == "Clothing" ~ runif(n(), 30, 60),
      segment == "Home_Goods" ~ runif(n(), 20, 40)
    ),
    sales_volume = 1000 - (3 * price) + (0.2 * marketing_spend) + (1.5 * competitor_price) + rnorm(n, 0, 50)
  )

# --- 3. Save to Desktop ---
# This creates the physical file you will submit
write.csv(pricing_data, "C:/Users/HP/Desktop/pricing_data.csv", row.names = FALSE)

print("SUCCESS: pricing_data.csv is now on your Desktop!")

