#mapping with style 11 April 2019
#Nothando

#load libraries
#Here are 2 new packages
library(tidyverse)
library(scales)
library(ggsn)

# Load Africa map
load("data/africa_map.RData")

ggplot() +
  borders() + # The global shape file
  coord_equal() # Equal sizing for lon/lat

#Assign a name to a plot
sa_1 <- ggplot() +
  borders(fill = "grey70", colour = "black") +
  coord_equal(xlim = c(12, 36), ylim = c(-38, -22), expand = 0) # Force lon/lat extent
sa_1

# Assign a new name (sa_2) making reference to sa_1 which was created above
sa_2 <- sa_1 + 
  annotate("text", label = "Atlantic\nOcean",  #"n"- starts a new line
           x = 15.1, y = -32.0,
           size = 5.0,
           angle = 30,
           colour = "purple") +
  annotate("text", label = "Indian\nOcean",
           x = 33.2, y = -34.2,
           size = 5.0,
           angle = 330,
           colour = "orange")
sa_2


#Assigning a new name sa_3 making a reference to sa_2 created above
sa_3 <- sa_2 +
  scalebar(x.min = 22, x.max = 26, y.min = -36, y.max = -35, # Set location of bar
           dist = 200, height = 1, st.dist = 0.8, st.size = 4, # Set particulars
           dd2km = TRUE, model = "WGS84") + # Set appearance
  north(x.min = 22.5, x.max = 25.5, y.min = -33, y.max = -31, # Set location of symbol
        scale = 1.2, symbol = 16)
sa_3

#Separating and uniting
SACTN4a_tidy <- SACTN4a %>% 
  separate(col = index, into = c("site", "src"), sep = "/ ")#seperate the column titled "index" into 2 columns,"site" and "src"

#Unite
SACTN4b_tidy <- SACTN4b %>% #Create a new dataset SACTN4b_tidy
  unite(year, month, day, col = "date", sep = "-")#Unite year, month and date into a new coumn "date" seperated by"-"

#Joining 
SACTN4_tidy <- left_join(SACTN4a_tidy, SACTN4b_tidy) #combinig 2 datasets



