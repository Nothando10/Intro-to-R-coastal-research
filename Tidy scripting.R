#Working with tidy data, long is better than wide data
#Mainly focus on tidyverse package
#Nothando 11 April 2019

#Loading libraries
library(tidyverse)

#Loading in the dataset
load("data/SACTN_mangled.RData")#In this dataset there are different dataframes

#plotting the data
ggplot(SACTN1, aes(x = date, y = temp)) +
  geom_line(aes(colour = site, group = paste0(site, src))) +
  labs(x = "", y = "Temperature (°C)", colour = "Site") +
  theme_bw()

#Gather function in R
#Part of the tidyverse package
SACTN2_tidy <- SACTN2 %>%              #creates/loads a new dataset
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") #gathering 3 variables and creating a new column
#This new column is called "src"
#We will have the various sources/src :DEA, KZNSB,SAWS.
#Then creaes anew column with all the values and
#Title of this column is "temp" colected by each of the different sources

#Here we remove the NA values within the datasets
SACTN2_tidy <- SACTN2 %>%
  gather(DEA, KZNSB, SAWS, key = "src", value = "temp") %>% 
na.omit()          #remove all NA values

#Spreading
SACTN3_tidy <- SACTN3 %>%
  spread(key = var, value = val)

