#tidier data Day 2 11 April 2019
#Nothando


#Load libraries
library(tidyverse)
library(lubridate)

# Loading the dataset
load("data/SACTNmonthly_v4.0.RData")
SACTN <- SACTNmonthly_v4.0 #Renaming the SACTNmonthly to SACTN
rm(SACTNmonthly_v4.0)# rm- remove function:removing SACTNmonthly_v4.0


#tidy data
#filter,mutate,group_by,select,arranghe-found in the tidyverse package
SACTN_1 <- SACTN %>% 
filter(site == "Port Nolloth")# only exract Port Nolloth data

#Filtering and restricting for certain months
SACTN %>%  #lOOK AT sactn dataset and  filter only on site "pollock beach"
  filter(site == "Pollock Beach", month(date) == 12 | month(date) == 1)#here we specify month as the lubridate package allows for R
#to only detect the month within the date column

#Arrange observations

SACTN_ARR <- SACTN %>%  #Create a new dataset
  arrange(depth, temp)# Arrange function places from lowest to highest

#Descending order highest to lowest
SACTN_2 <- SACTN %>%
  arrange(desc(temp))#highest temp to the top of the data and lowest temp at the bottom


#filter but for a specific date/year
SACTN_Hume <- SACTN %>% #Selecting the dataset
  filter(site == "Humewood", year(date) == 1990)# extracts only humewood for only 1990

#filtering for more than just 1 year
humewood_90s <- SACTN %>%     #dataset used
  filter(site == "Humewood", year(date) %in% seq(1990, 1999, 1))# Filter the site humewood for the 
#year 1990 to 1999

#Look at sactn and filter only port nollath, source DEA and temp <= 11
PN_SACTN <- SACTN %>% 
  filter(site == "Port Nolloth", # First give the site to filter
         src == "DEA", # Then specify the source
         temp <= 11 | # Temperatures at or below 11°C OR
           is.na(temp)) # Include missing values
  

#Tidyverse package:select function

SACTN_select <- SACTN %>% 
  select(site, src, temp)

SACTN_organise <-  SACTN %>%
  select(temp, src, site) #arranging variables into preffered order


SACTN_every <- SACTN %>% 
  select(type,src,everything())


#exploring the mutate column,creates a new column
SACTN_mutate <- SACTN %>%
  mutate(kelvin = temp + 273.15)#gives a name "kelvin" to the new column created then Converts temps into kelvin


#Summarise function
SACTN_sum <- SACTN %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE),
            min_temp = min(temp, na.rm = TRUE),
            max_temp = max(temp, na.rm = TRUE))
  












