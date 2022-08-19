#set working directory
setwd("E:/Coding/Data anaylsis/ITI-Data-Analytics-Visualization-Specialist/R files/Mastering data visualization")

#read the data
actors = read.csv('Actors.csv')

head(actors)

#Get five-time plus acting pairs
actors5 <- actors[actors$Count>= 5,]

actors5
#load igraph package
library(igraph)

#Create a graph for acting pairs
graph5 <- graph.data.frame(
  d =actors5,
  directed = FALSE
) 

plot(graph5,main = 'five times or more acting pairs')

#Get actors who acted together 2 times or more
actors2 <- actors[actors$Count>= 2,]

#Create a undireced graph object
graph2 = graph.data.frame(
  d =actors2,
  directed = FALSE
)

plot(graph2,
     main = '2 times or more acting pairs',
     vertex.size = 2,
     vertex.label = NA,
     edge_curved = FALSE,
     edge.width =edge_attr(graph2)$count,
     )

# Create graph clusters
cluster<- cluster_edge_betweenness(graph2)

#plot community graph
plot(
  x = cluster,
  y = graph2,
  vertex.size = 3,
  vertex.label = NA,
  edge_curved = FALSE,
  edge.width =edge_attr(graph2)$count,
)
