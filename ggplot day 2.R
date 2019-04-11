#Plotting with boots using thethird variable  as a colour variation (colour scale)
#short cutes:
#cntrl shift m: %>% 
#alt - : <- 
#cntrl enter:run script


#Loading the ibraries
library(tidyverse)
library(boot)

#load built in datasets
urine <- boot::urine #assign a name "urinr" to appearin the environemnt 
#explore data

head(urine)
tail(urine)
dim(urine)
names(urine)
colnames(urine)
rownames(urine)

#ggplot-plotting function
ggplot(urine, aes(x = osmo, y = ph))+ #ggplot - plotting/specify axis
  geom_point(aes(colour=cond)) #cond - this is a variable in a dataset 

 ?urine #dataset infor

ggplot(urine, aes(x=osmo, y = ph))+
  geom_point(aes(colour = as.factor(r)))

#To create your own colour pallete
#http://tristen.ca/hcl-picker/#/hlc/6/0.95/48B4B6/345363
 # • http://tools.medialab.sciences-po.fr/iwanthue/index.php
#• http://jsfiddle.net/d6wXV/6/embedded/result/





