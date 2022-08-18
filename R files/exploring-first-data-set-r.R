
# Module: Background on Exploratory Analysis

# Dataset 'diamonds' from ggplot2
# install.packages("ggplot2")

library(ggplot2)
View(diamonds)
?diamonds



# Module: First Level Data Exploration

# Summary Statistics

fivenum(diamonds$price)
summary(diamonds)
boxplot(diamonds$price)
boxplot(diamonds$carat)
str(diamonds)


# Distributions

hist(diamonds$price)
qqnorm(diamonds$price)

hist(log(diamonds$price))
hist(diamonds$carat)


# Hypothesis Tests

diam = as.data.frame(diamonds)
set.seed(50)
mysample =sample.int(n =53940,
                     size = 5000, 
                     replace = F)
shapiro.test(diam[mysample, 7])

shapiro.test(rnorm(1000, 50, 5))

shapiro.test(diam[mysample, 1])



# Module: Statistical Tests to Confirm Initial Findings

# Categoric-numeric relation

boxplot(price ~ cut, data = diamonds)
kruskal.test(price ~ cut, data = diamonds)
anova(lm(price ~ cut, data = diamonds))

boxplot(carat ~ cut, data = diamonds)
kruskal.test(carat ~ cut, data = diamonds)
anova(lm(carat ~ cut, data = diamonds))

# Numeric relations

cor(diamonds$price, diamonds$carat,
    method = 'spearman')

cor(diamonds$price, diamonds$carat,
    method = 'pearson')


# Correlation matrix

# Half table
as.dist(cor(diamonds[,c(1,5:10)],
            method = 'spearman'))

# Whole table
cor(diamonds[,c(1,5:10)],
    method = 'spearman')

plot(diamonds$x, diamonds$carat)

# Heatmap

library(GGally)

x = diamonds[,c(1,5:10)]

ggcorr(x, nbreaks = 20, mid = "white", 
       high = "darkred", label = T,
       method = c("pairwise", "spearman"))


# Categorical relations

mydata = table(diamonds[,c(2:4)])
mydata

chisq.test(diamonds$cut, diamonds$color)

chisq.test(diamonds$cut, diamonds$clarity)

