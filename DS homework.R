library(tidyverse)
library(dplyr)
library(lubridate)
library(tibble)
library(funModeling) 
library(Hmisc)
library(MASS)
library(ISLR)

##importing data
##raw1 <- read.csv(file ='product_ds_hw_data.csv') 
list_data = as_tibble(product_ds_hw_data)

##1.	Understanding your variables (types,important variables and leaving behind useless variables)

##checking the structure
dim(list_data)       
str(list_data)
glimpse(list_data)
status(list_data)

##Dataset health status

"q_zeros: quantity of zeros (p_zeros: in percent)
q_inf: quantity of infinite values (p_inf: in percent)
q_na: quantity of NA (p_na: in percent)
type: factor or numeric
unique: quantity of unique values"

##renaming columns and changing date format
list_data = list_data %>% rename(price_sold_eur_fixed = gmv_eur_fixed, nlistings_by_user = lister_nth_listing)
list_data = list_data %>% mutate(created_at = ymd_hms(created_at), sale_time = ymd_hms(sale_time))

##reviewing the data
head(list_data)
tail(list_data)


##necessary data columns for the listing info
listing_data=list_data %>% dplyr::select(id, created_at, user_id, listing_price_eur_fixed, status,
                      sale_time, price_sold_eur_fixed, brand, listing_quality_string, 
                      suggested_price_maximum, catalog_code_1, catalog_code_2, 
                      nlistings_by_user)

glimpse(listing_data)
summary(listing_data)
sum(listing_data$listing_price_eur_fixed)


##necessary data columns for the user info
user_data=list_data %>% dplyr::select(user_id, total_positive_feedback_count, total_negative_feedback_count,
                                  window_items_listed, window_items_bought, window_items_sold, listings_in_first_7days_detailed)

glimpse(user_data)

##Liquidity
total_items_listed = sum(user_data$window_items_listed)
total_items_sold = sum(user_data$window_items_sold)
seller_liquidity = total_items_sold / total_items_listed
seller_liquidity

total_items_bought = sum(user_data$window_items_bought)
buyer_liquidity = total_items_bought / total_items_listed
buyer_liquidity

##sales analysis

sales_data=list_data %>% dplyr::select(status, price_sold_eur_fixed,
                                  sale_time, brand, color_primary, catalog_code_1, catalog_code_2)
sales_data = na.omit(sales_data) 
sales_data
 
sales_data %>% group_by(brand) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) 

freq(sales_data, path_out = "D:/Learning R")


##2 - Analyzing categorical variables
freq(list_data)
freq(listing_data)
freq(list_data, path_out = "D:/Learning R")

##ALL Listing:from the plots we can see that the most popular color is black, blue, grey and white.
##Most of all are woman clothes, kids clothes and footwear.


##3 - Analyzing numerical variables
plot_num(listing_data, path_out = "D:/Learning R")
plot_num(user_data, path_out = "D:/Learning R")

##Quantitatively - Pay attention to variables with high standard deviation.
##A high value in variation_coef may indictate outliers. range_98 indicates where most of the values are.
data_prof=profiling_num(listing_data)
head(data_prof)

describe(list_data) ##Check min and max values (outliers)
##Check Distributions (same as before)

##-------------------------------------------------------------

sum(!is.na(listing_data$price_sold_eur_fixed))
sum(is.na(listing_data$sale_time)) ##kiek null reiksmiu


##linear model for dependencies
lm.fit = lm(listing_price_eur_fixed~price_sold_eur_fixed, data=listing_data)
lm.fit
summary(lm.fit)


