#Day 1 Intro to R
#UWC:Amieroh Abrahams 10 April 2019


apples <- c(5.3, 7.8, 19.4, 1)
mean(apples)
sd(apples)
dim(apples)#dimensions:null coz its not a dataframe
length(apples)
range(apples)
median(apples)
max(apples)
min(apples)

##libraries
library(tidyverse)
#reading a dataset into R
laminaria <- read.csv("data/laminaria.csv")#using the laminaria data found in the laminaria folder
#explore the data
dim(laminaria)#140 rows and 12 columns
mean(laminaria)#cant use mean function on a dataframe

#calculate the mean of:
#blade weigth and bade length
# %>% -cntrl shift m
lam_sum <- laminaria %>%                  #specify dataset
  summarise(mean_wt=mean(blade_weight), #calculate mean of blade weight
mean_bl= mean(blade_length))            #calcuate mean of the blade length
lam_sum 

##Explore data-laminaria dataset
head(laminaria)                 #first 6 rows of the dataset
tail(laminaria)                #last 6 rows of the dataset
head(laminaria, n=2)          #Shows the 1st 2 rows
tail(laminaria, n=3)          #shows the last 3 rows

names(laminaria)           #Variables
colnames(laminaria)

nrow(laminaria) # amount of rows of dataset
ncol(laminaria)  #amount of columns in the dataset

lam2 <- laminaria %>% #specify datasets
  select(blade_weight, blade_length, site) #selecting specific columns
lam2

lam3 <- laminaria %>% #specify dataset
  filter(site=="Sea Point") %>% #specify one particular site
  summarise(mean_wt = mean(blade_weight),#mean bw for 1 site
            mean_bl = mean(blade_length), #mean bl for 1 site
            sd_bl = sd(blade_length))#standard deviation of bl
lam3


#function within tidyverse:Slice
lam_slice <- laminaria %>%
  slice (6:13)
lam_slice

#Removing NA with na.rm = TRUE
lam_miss <- laminaria %>% #Specify dataset
  summarise(mean_sm = mean(stipe_mass, na.rm =TRUE))#mean of the stipe mass
lam_miss











