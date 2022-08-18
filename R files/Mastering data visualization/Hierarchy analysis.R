library(ggplot2)

#set working directory
setwd("E:/Coding/Data anaylsis/ITI-Data-Analytics-Visualization-Specialist/R files/Mastering data visualization")

#read the data
hierarchy <- read.csv('Hierarchy.csv')

head(hierarchy)

#Create a tree path column
hierarchy$Path <- paste(
  'World',
  hierarchy$Continent,
  hierarchy$Country,
  sep = '/'
)


library(data.tree)

#Create a tree from a a dataframe
tree <- as.Node(hierarchy,pathName = 'Path')

#plotting the tree
plot(tree)

#Create tree graph
library(igraph)

treeGraph<- as.igraph(tree)

treeGraph

#plotting the graph
plot(x = treeGraph,
     main = 'Geographic Distribution Hierarchy')

#add ron name for dendro lables 
row.names(hierarchy) <- hierarchy$Country

# Create distance matrix
Distance <- dist(hierarchy[,c(3,4)])
Distance

# Creat hierarchical clusters
clusters <- hclust(distance)

plot(clusters,
     main = 'Heirarchal clusters of countries')


library(ape)

#Create a phylogenice tree
phylo <- as.phylo(clusters)

#Create a radial table
plot(phylo,
     type = 'fan')

library(treemap)

# Create a frequeny tree map
treemap(
  dtf = hierarchy,
  index = c('Continent',"Country"),
  vSize = 'Count',
  vColor = 'Continent',
  type = 'categorical',
  title = 'Count of Movies by Continent and Country')


# Create a treemap 
treemap(
  dtf = hierarchy,
  index = c("Continent", "Country"),
  vSize = "Count",
  vColor = "Box.Office",
  type = "value",
  palette = c("#FF681D", "#FFE1D2"),
  title = "Count of Movies and Average Box Office Revenue\nby Continent and Country",
  title.legend = "Average Box Office Revenue ($M)")
