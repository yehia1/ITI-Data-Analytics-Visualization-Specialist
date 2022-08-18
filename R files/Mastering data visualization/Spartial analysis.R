library(ggplot2)

#Create a base map (no data)
ggplot() + borders(
  database = "world",
  colour = "grey60",
  fill = 'grey90')+
  ggtitle("Base map of the world")+
  xlab("")+
  ylab('')+
  theme(
    panel.background = element_blank(),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

#set working directory
setwd("E:/Coding/Data anaylsis/ITI-Data-Analytics-Visualization-Specialist/R files/Mastering data visualization")

#Read movies by country from CSV file
movies <- read.csv('Movies by Country.csv')

head(movies)

#Create dot density map 
ggplot(
  data = movies,aes(Longitude,Latitude))+
  borders(
    database = "world",
    colour = "grey60",
    fill = 'grey90')+
  geom_point()+
  ggtitle("Movies by Country")+
  xlab("")+
  ylab('')+
  theme(
    panel.background = element_blank(),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )
  

#Create a density map for better visualization
ggplot(
  data = movies,aes(Longitude,Latitude))+
  borders(
    database = "world",
    colour = "grey60",
    fill = 'grey90')+
  geom_density2d()+
  ggtitle("Movies by Country")+
  xlab("")+
  ylab('')+
  theme(
    panel.background = element_blank(),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

#zoom into a map
ggplot(
  data = movies,aes(Longitude,Latitude))+
  borders(
    database = "world",
    colour = "grey60",
    fill = 'grey90')+
  geom_density2d()+
  coord_cartesian(
    xlim = c(-20,59),
    ylim = c(35,71))+
  ggtitle("Movies by Country")+
  xlab("")+
  ylab('')+
  theme(
    panel.background = element_blank(),
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )






  