#TIDIEST DATA DAY 2 

#load libraries
library(tidyverse)
library(lubridate)

#Load the data
load("data/SACTNmonthly_v4.0.RData")
# Copy the data as a dataframe with a shorter name
SACTN <- SACTNmonthly_v4.0
# Remove the original
rm(SACTNmonthly_v4.0)

#group_by fnction
#group by depth
SACTN_depth <- SACTN %>%
  group_by(src,date)


SACTN_depth_mean_2 <- SACTN %>% # Choose a base dataframe
  group_by(depth) %>% # Group by thedepth column
  summarise(mean_temp = mean(temp, na.rm = TRUE), # Calculate means
            count = n()) # Count observation # Safety measure

#Exploring all tidyverse functions in one chunk of code/EXTRACTING INFOR FROM YOUR DATASET
SACTN_tid <- SACTN %>%
  filter(site == "Paternoster" | site == "Oudekraal") %>%
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))



#WORKING WITH MULTIPLES SITES, BUT NOT ALL OF TEH ITES IN THE DATASET
# First create a character vector containing the desired sites
selected_sites <- c("Paternoster", "Oudekraal", "Muizenberg", "Humewood")

# Then calculate the statistics
SACTN_select <- SACTN %>%
  filter(site %in% selected_sites) %>%
  
  group_by(site, src) %>%
  summarise(mean_temp = mean(temp, na.rm = TRUE),
            sd_temp = sd(temp, na.rm = TRUE))




