#### Preamble ####
# Purpose: Use opendatatoronto to get crimes data -- https://open.toronto.ca/dataset/police-annual-statistical-report-reported-crimes/
# Author: Youjing Li
# Email: youjing.li@utoronto.ca
# Date: 26 January 2021
# Prerequisites: -
# Issues: I want to know how crime rates changed over the years in Toronto.
# To do: 
# - Load and save raw files.


#### Workspace set-up ####
# Libraries
# install.packages("opendatatoronto")
# install.packages("tidyverse")
# install.packages("lubridate")
library(opendatatoronto)
library(tidyverse)
library(lubridate)

#### Get the data ####
all_data <- 
  opendatatoronto::search_packages("Police Annual Statistical Report - Reported Crimes") %>%
  opendatatoronto::list_package_resources() %>%
  filter(name == "Reported Crimes ") %>% 
  select(id) %>%
  opendatatoronto::get_resource()

#### Save the data ####
write_csv(all_data, "inputs/data/raw_data.csv")

