library(dplyr)
library(ggplot2)
library(statsr)

#-----------------------dataset 1----------------------------
data(arbuthnot)

#showing rows and columns
dim(arbuthnot)
#showing names of columns(variables)
names(arbuthnot)

#selecting year from dataset
arbuthnot$year

#'+ geom_point()' is used another layer for scatter plot 
ggplot(data = arbuthnot, aes(x = year, y = girls)) + geom_point()

arbuthnot$boys + arbuthnot$girls

#adding a new variable to the data frame
#'%>%' operator is called the piping operator. 
#Basically, it takes the output of the current line and pipes it into the following
#line of code.
arbuthnot <- arbuthnot %>% mutate(total = boys + girls)

#'+ geom_point()' is used another layer for line plot 
ggplot(data = arbuthnot, aes(x = year,y = total)) + geom_line()

ggplot(data = arbuthnot, aes(x = year,y = total)) + geom_line() + geom_point()


#-----------------------dataset 2----------------------------
data(present)

range(present$year)

present <- present %>% mutate(total = boys + girls)
present <- present %>% mutate(prop_boys = boys/total)
ggplot(data = present, aes(x = year, y = prop_boys)) + geom_line() + geom_point()

#Ture,false could be plotted too
present <- present %>% mutate(more_boys = boys > girls)
ggplot(data = present, aes(x = year, y = more_boys)) + geom_line() + geom_point()

present <- present %>% mutate(prop_boy_girl = boys/girls)
ggplot(data = present, aes(x = year, y = prop_boy_girl)) + geom_line() + geom_point()

present %>% mutate(total = boys + girls) %>% arrange(desc(total))