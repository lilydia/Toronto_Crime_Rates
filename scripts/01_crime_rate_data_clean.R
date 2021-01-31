#### Preamble ####
# Purpose: Clean the crimes data downloaded from https://open.toronto.ca/dataset/police-annual-statistical-report-reported-crimes/
# Author: Youjing Li
# Email: youjing.li@utoronto.ca
# Date: 26 January 2021
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the crimes data and saved it to inputs/data
# To do: 
# - clean titles and extract useful information on:
# - crime type
# - location
# - year


#### Workspace setup ####
library(tidyverse)
library(janitor)
# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv")
names(raw_data)

# Clean up column names
clean_data <- 
  raw_data %>% 
  janitor::clean_names(case = 'snake')

# Filter out id and index which give no information
clean_data <- 
  clean_data %>% 
  select(reported_year, 
         geo_division,
         category,
         subtype,
         count,
         count_cleared)

# Remove raw_data from global variable 
rm(raw_data)

#### Save data ### 
write_csv(clean_data, "inputs/data/clean_data.csv")

