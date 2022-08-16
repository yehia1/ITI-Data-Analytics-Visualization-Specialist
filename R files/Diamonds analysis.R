# Module: Background on Exploratory Analysis

# Dataset 'diamonds' from ggplot2
# install.packages("ggplot2")

library(ggplot2)
View(diamonds)
?diamonds

# Histograms

hist(diamonds$price)
#make the histogram got 10 columns only
hist(diamonds$price,breaks = 10)
# making the y axis probability
hist(diamonds$price,freq = FALSE)
# adding color to each cut 
hist(diamonds$price,col = diamonds$cut )

library(lattice)

histogram(~price, data = diamonds)
#makes hist for each cut type
histogram(~price| cut, data = diamonds)

#makes densityplot for each cut type
densityplot(~price| cut, data = diamonds,plot.points = FALSE,ref = TRUE)

#makes densityplot for each cut type in one plot and auto.key to add the cut types reference
densityplot(~price, groups = cut,
            data = diamonds,plot.points = FALSE,
            auto.key = list(columns = 3),ref = TRUE)

library(ggplot2)

#showing the histogram with ggplot of price
ggplot(diamonds, aes(x = price)) + geom_histogram()

#showing density plot
ggplot(diamonds, aes(x = price)) + geom_density()

#showing hist and density together adding width to not get error 
ggplot(diamonds, aes(x = price)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = 1000,
                 color = 'white',
                 fill = 'black') + 
  geom_density(alpha = 0.25,fill = 'yellow')

## QQ plots 

#showing the qq plot to get the distrbution
qqnorm(diamonds$price)
# making the number of samples 40000 random
x = rnorm(40000)
# draw the distributions to show the normality
qqnorm(x)
qqline(x)

#making the qq plot with a different way
qqmath(~ price, data = diamonds)

#making hitogram of price 
hist(diamonds$price)

#making the qq plot with gg function
ggplot(diamonds,aes(sample = price))+stat_qq()

#Boxoplots

boxplot(price~ cut,diamonds)

# adding the mean to the shape in the boxplot
means<- tapply(diamonds$price,diamonds$cut,mean)
points(means,col = 'red')

## Lattice boxplot

# adding 1 numerical value with 2 categorical values in 1 boxplot
bwplot(color~price |cut, data =diamonds)

bwplot(color~carat |cut, data =diamonds,horizontal =TRUE)

## GGplot boxplot

# adding 1 numerical value with 2 categorical values in 1 boxplot 
ggplot(diamonds, 
       aes(color,price))+
  geom_boxplot()+
  coord_flip()+
  facet_wrap(~cut)

## Scatterplots

#plotting scatterplot with line for regression in it
plot(diamonds$price,diamonds$carat)
abline(lm(carat~ price, data = diamonds))

#to add categorical value to graph we use clustering as color
#plotting the character small solid circle using cex and pch and bty to add a box to points
plot(diamonds$price,diamonds$carat,
     col = diamonds$cut,
     pch = 20,
     cex = 0.75,
     bty = "l")

# using k means algorithm

plot(diamonds$price,diamonds$carat,
     col = kmeans(diamonds[,c(8,9,10)],5)$cluster)

## Lattice scatter

xyplot(carat~price ,data = diamonds,
       groups = color,
       auto.key = list(columns = 7),
       type = c("p","r"),cex = 0.5,
       pch = 20)

# adding categorical data to get multiple scatters
xyplot(carat~price |color,data = diamonds,
       groups = color,
       auto.key = list(columns = 7),
       type = c("p","r"),cex = 0.5,
       pch = 20)

## GGplot scatter

ggplot(diamonds,aes(x = price,y = carat))+
  geom_point(shape = 1)+
  geom_smooth(method = lm)+ 
  ggtitle("Diamond Prices By Weight")
  
# more detailed graph for dense 
ggplot(diamonds,aes(x = price,y = carat,color = color))+
  geom_point(shape = 19, position = position_jitter(width = 1,height = 0.5))+
  scale_color_hue(l = 50)+
  geom_smooth(method = lm,se = FALSE,fullrange = TRUE)

#shading the dense area
ggplot(diamonds,aes(x = price,y = carat,color = color))+
  geom_point(shape = 19, alpha = 0.2)+
  scale_color_hue(l = 50)+
  geom_smooth(method = lm,se = FALSE,fullrange = TRUE)

## Bar charts

summary(diamonds)
counts <- table(diamonds$cut,diamonds$color)
barplot(counts, legend = rownames(counts))

counts

## lattice barplot only work with data frame

df = as.data.frame(ftable(diamonds$cut,diamonds$color,diamonds$clarity))

head(df,10)

barchart(Var3~ Freq|Var2 ,groups = Var1,df,stack = TRUE,
         auto.key = list(columns = 3))

## GGplot

ggplot(df, aes(x = Var1, y = Freq,fill = Var3))+
  geom_bar(stat = 'identity',position = 'stack')+
  facet_grid(~ Var2)

#enhcaned shape of barplot and flipping the x axis lables by 90 degree
ggplot(df, aes(x = Var1, y = Freq,fill = Var2))+
  geom_bar(stat = 'identity',position = 'stack')+
  facet_grid(~ Var3)+
  xlab("")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8))

# another way without dataframe using original dataset
ggplot(diamonds,aes(x = cut,fill = clarity))+
  geom_bar(stat= 'count',position = 'stack')+
  facet_grid(~color)+
  xlab("")+
  theme(axis.text.x = element_text(angle = 90, hjust = 1, size = 8))

 
