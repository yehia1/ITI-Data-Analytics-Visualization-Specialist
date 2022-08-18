# set working directory
setwd('E:/Coding/Data anaylsis/ITI-Data-Analytics-Visualization-Specialist/R files')

# load movie data from CSV file
movies <- read.csv('Movies.csv')

head(movies)

#Univariate visualization for
# qualtive variablew

#rating bar chart
count <- table(movies$Rating)
count

#making barcharts vertical and horiz
barplot(height = count,
     main = 'count of movies by rating',
     xlab = 'Rating',
     ylab = 'Count of Movies')

barplot(height = count,
        horiz = TRUE,
        main = 'count of movies by rating',
        xlab = 'Rating',
        ylab = 'Count of Movies')

# Create pie chart of rating
pie( x = count,
     main = "Count of Movies by Rating")

# Create pie chart of awards
pie(x = table(movies$Awards),
     clockwise = TRUE,
     main = "Proportion of Movies that won Awards")

## Lattice one categorical value

library(lattice)

ratings <-as.data.frame(count)

names(ratings)[1] <- "Rating"
names(ratings)[2] <- "Counts"

# Create frequency bar chart 
barchart(
  x = Counts~ Rating,
  ratings,
  main = "Count of Movies by Rating",
  xlab = 'Ratings'
  )

barchart(
  x = Rating~ Counts,
  ratings,
  main = "Count of Movies by Rating",
  xlab = 'Ratings'
)

## GGplot2 

#drawing the same barcharts 
ggplot(data = movies,
       aes(x = Rating))+
  geom_bar()+
  ggtitle("Count of Movies by Rating")


ggplot(data = movies,
         aes(x = Rating))+
  geom_bar()+
  ggtitle("Count of Movies by Rating")+
  coord_flip()  

# Creatign a piechart
ggplot(data = movies,
       aes(x = "",fill = Rating))+
  geom_bar(width=1, color="white")+
  coord_polar(theta= "y",start = 0)+
  ylab("")+
  ggtitle("Count of Movies by Rating")

# Creating a pie chart for awads
# Creatign a piechart
ggplot(data = movies,
       aes(x = "",fill = Awards))+
  geom_bar(width=1, color="white")+
  coord_polar(theta= "y",start = 0)+
  ylab("")+
  ggtitle("Winning Awards?")

## Working with Quantitative Univariate data

#Rating variable
plot(
  x = movies$Runtime,
  y = rep(0,nrow(movies)),
  main = 'Distributions of movie runtimes',
  xlab = "Runtime(minutes)",
  ylab = '',
  yaxt = 'n'
)
#some enhancements 
plot(
  x = movies$Runtime,
  y = rep(0,nrow(movies)),
  main = 'Distributions of movie runtimes',
  xlab = "Runtime(minutes)",
  ylab = '',
  yaxt = 'n',
  pch = 16,
  col = rgb(0,0,0,0.1)
)

# add boxplot
boxplot(
  x = movies$Runtime,
  main = 'Distributions of movie runtimes'
)

# histogram 
hist(
  x = movies$Runtime,
  breaks = 30,
  main = 'Distributions of movie runtimes',
  xlab = "Runtime(minutes)"
)

#densityplot
plot(
  x = density(movies$Runtime),
  main = 'Distributions of movie runtimes',
  xlab = "Runtime(minutes)"
)


## Lattice 

#running stripplot
stripplot(
  x = ~Runtime,
  data = movies,
  main = 'Distributions of Movie Runtimes',
  xlab = 'Runtime(minutes)'
)

# adding jitter
stripplot(
  x = ~Runtime,
  jitter = TRUE,
  amount = 0.5,
  data = movies,
  main = 'Distributions of Movie Runtimes',
  xlab = 'Runtime(minutes)'
)

#boxplot
bwplot(
  x = ~Runtime,
  movies,
  main = 'Distributions of Movie Runtimes',
  xlab = 'Runtime(minutes)'
)

#histogram
histogram(
  x = ~Runtime,
  movies,
  main = 'Distributions of Movie Runtimes',
  xlab = 'Runtime(minutes)'
)
  
#densityplot
densityplot(
  x = ~Runtime,
  movies,
  main = 'Distributions of Movie Runtimes',
  xlab = 'Runtime(minutes)'
)

## GGplot2 

#dotplot
ggplot(movies,
       aes(Runtime,stat = 'count'))+
  geom_dotplot(binwidth = 1)+
  ggtitle('distributions of Movie Runtimes')+
  xlab('Runtime (minutes)')

# violin dotplot
ggplot(movies,
       aes(Runtime,stat = 'count'))+
  geom_dotplot(binwidth = 1,
               stackdir = 'center')+
  ggtitle('distributions of Movie Runtimes')+
  xlab('Runtime (minutes)')

#Boxplot
ggplot(movies,
       aes(Runtime,Runtime))+
  geom_boxplot()+
  coord_flip()+
  ggtitle('distributions of Movie Runtimes')+
  xlab('Runtime (minutes)')+
  theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank()
  )

#histogram
ggplot(movies,
       aes(Runtime))+
  geom_histogram(binwidth = 10)+
  ggtitle('distributions of Movie Runtimes')+
  xlab('Runtime (minutes)')

#densityplot
ggplot(movies,
       aes(Runtime))+
  geom_density()+
  ggtitle('distributions of Movie Runtimes')+
  xlab('Runtime (minutes)')



##Biavariate visualization for 
##two qualitive variables

#create a contingency table

awards<- table(
  movies$Awards,
  movies$Rating)
awards

# create a grouped frequency bar chart 

barplot(
  height = awards ,
  beside = TRUE,
  main = "Count of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'awards',
  legend = c('No','Yes'),
  args.legend = list(x = 'topleft',title = 'awards')
)

#stacked barplot
barplot(
  height = awards ,
  beside = FALSE,
  main = "Count of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'awards',
  legend = c('No','Yes'),
  args.legend = list(x = 'topleft',title = 'awards')
)

proportions <- apply(awards, 2,function(x){x/sum(x)})


barplot(
  height = proportions ,
  beside = FALSE,
  main = "Proportions of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'awards',
  legend = c('No','Yes'),
  args.legend = list(x = 'topleft',title = 'awards')
)

awards <- table(movies$Rating,movies$Awards)
colnames(awards) <- c("No","Yes")

#Create a spineplot
spineplot(
  x = awards,
  main = "Proportions of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'awards',
)

#Create mosiac plot
mosaicplot(
  x = awards,
  main = "Proportions of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'awards',
)


## Two categorical values in lattice
barchart(
  x = awards,
  stack = FALSE,
  horizontal = FALSE,
  main = "Count of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'awards',
  auto.key = list(x = 0.05, y = 0.95,title = 'awards')
)

matrix <- apply(awards, 1,function(x){x/sum(x)})
matrix
proportions <- t(matrix)

#making a barchart of probabilties
barchart(
  x = proportions,
  stack = TRUE,
  horizontal = FALSE,
  main = "Propotions of Movies by rating and Awards",
  xlab = 'Rating',
  ylab = 'Propotion of movies',
  auto.key = list(x = 0.7, y = 1.05,title = 'awards',columns = 2,
                  background = 'white')
)

## ggplot side by side

ggplot(
  data = movies,
  aes(x = Rating,fill = Awards))+
  geom_bar(position = 'dodge')+
  ggtitle('Count of Movies by rating and Awards')+
  scale_fill_discrete(labels = c('No','Yes'))


# stacked frequency bar chart
ggplot(
  data = movies,
  aes(x = Rating,fill = Awards))+
  geom_bar()+
  ggtitle('Count of Movies by rating and Awards')+
  scale_fill_discrete(labels = c('No','Yes'))

# stacked frequency propotions bar chart
ggplot(
  data = movies,
  aes(x = Rating,fill = Awards))+
  geom_bar(position = 'fill')+
  ggtitle('Propotions of Movies by rating and Awards')+
  scale_fill_discrete(labels = c('No','Yes'))


## dealing with bivariate quantitve variables 

#Create a scatterplot 
plot(
  movies$Runtime,
  movies$Box.Office,
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
  col = 'skyblue'
)

#Create linear regression model
model <- lm(movies$Box.Office ~ movies$Runtime)
model
#Draw the linear regression line on the plot
lines(
  movies$Runtime,
  model$fitted,
  col = 'red',
  lwd = 3
)

library(MASS)

# Create a 2d kernel density estimation
density2d <- kde2d(
  movies$Box.Office, movies$Runtime,
)

# Create a contour plot of density
contour(
  density2d$x,
  density2d$y,
  density2d$z,
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
  )

#Create a level plot of density
image(
  density2d$x,
  density2d$y,
  density2d$z,
  col = topo.colors(100),
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
)

#Create a mesh plot of density
persp(
  density2d$x,
  density2d$y,
  density2d$z,
  col = cut(density2d$z,100),
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
)
palette('default')
 

# Lattice 2 quantitve data
xyplot(
  x = Box.Office~ Runtime,
  data = movies,
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
)

# add the linear regression line
xyplot(
  x = Box.Office~ Runtime,
  data = movies,
  type= c('p','r'),
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
)

# Create a grid from our 2d kernel density estimation
grid <- expand.grid(
  x = density2d$x,
  y = density2d$y
)

grid$z <- as.vector(density2d$z)

head(grid)

#Create a contour plot of density
contourplot(
  x = z ~ x * y,
  data =grid,
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
)

#Create a level plot
levelplot(
  x = z ~ x * y,
  data =grid,
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
)

# Create a meshplot
wireframe(
  x = z ~ x * y,
  data =grid,
  drape = TRUE,
  main = 'Runtime vs Box.office Revenue',
  xlab = 'Runtime(mintues)',
  ylab = 'Box Office $M',
  zlab = 'density'
)


## ggplot2

# Bivariate visualizations for 
# two quantitiative variables

# Create scatterplot
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  geom_point() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Add a linear regression line
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  geom_point() + 
  geom_smooth(method = "lm") +
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")


# Create a frequency heatmap
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  stat_bin2d() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Create a hexagonal binned frequency heatmap
ggplot(
  data = movies,
  aes(x = Runtime, y = Box.Office)) +
  stat_binhex() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Create a contour plot of density
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  geom_density2d() + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# Create a level plot of density
ggplot(
  data = movies, 
  aes(x = Runtime, y = Box.Office)) +
  stat_density2d(aes(fill = ..level..), geom = "polygon") + 
  ggtitle("Runtime vs. Box Office Revenue") +
  xlab("Runtime (minutes)") +
  ylab("Box Office ($M)")

# NOTE: 3D visualizations do not exist in ggplot2


##Bivariate visulaizations for both a
## qualitiative and quantiative variable

#Create a bivariate bar graph
average<- tapply(movies$Box.Office,
                 movies$Rating, mean)

print(average)
