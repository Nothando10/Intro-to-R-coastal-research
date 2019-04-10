#Plotting ggplot
#Day 1 first plots 10 April 2019

#Loading libraries
library(tidyverse)#blanket package
OR
library(ggplot2)#more specific to plotting

#loading in the data
#R has built in datasets
ChickWeight <- datasets::ChickWeight

#Explore the data
Summary(ChickWeight)
names(ChickWeight)
dim(ChickWeight)
glimpse(ChickWeight)

#Create a scatter and line graph
ggplot(data = ChickWeight, aes(x = Time, y = weight)) +#Specify the data,x-axis,y-axis
  geom_point() +#Scatter or point plot
  geom_line(aes(group = Chick))   #or each chick in the dataset
#The group function when plotting is the same as the "group_by" function
#Use + and not %>% when plotting


#Same as above but specifies different color for each diet 
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point() +
  geom_line(aes(group = Chick))

#HYPOTHESIS:What is the most effective diet

ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +     #Different color
  geom_point() +         #plotting points
  geom_smooth(method = "lm")   #lm is a liear model:1 line of best fit

#Exploring colors and size variation
ggplot(data = ChickWeight, aes(x = Time, y = weight, colour = Diet)) +
  geom_point(aes(size = weight)) +
  geom_smooth(method = "lm", size = 1.2)+
  labs(x = "Time(days)",y = "weight(kg)")+
        # theme(legend.position = "bottom")+
  theme_bw()


