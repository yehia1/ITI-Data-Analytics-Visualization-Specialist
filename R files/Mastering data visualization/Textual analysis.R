#set working directory
setwd("E:/Coding/Data anaylsis/ITI-Data-Analytics-Visualization-Specialist/R files/Mastering data visualization")

#read the data
Plots <- read.csv('Plots.csv')

head(Plots)

#Load text mining package
library(tm) 


#Load snowballC package
library(SnowballC)


#Convert data to corpus
corpus <- VCorpus(VectorSource(Plots$Plot))

#Inspect first entry in the corpus
corpus[[1]]$content

corpus <-tm_map(corpus, function(x) iconv(x,'UTF-8', sub = "byte"))
#convert terms to lower case
corpus <- tm_map(corpus, tolower)

corpus[[1]]

# Remove punctuation
corpus <- tm_map(corpus, removePunctuation)

# Reduce terms to stems in corpus
corpus <- tm_map(corpus, stemDocument)

# strip whitespace from corpus
corpus <- tm_map(corpus, stripWhitespace)

#remove stop words
corpus <- tm_map(corpus, removeWords, stopwords("english"))

#Convert corpus to text document
corpus <- tm_map(corpus, PlainTextDocument)

#Inspect first entry in the corpus
corpus[[1]]$content



#load the word cloud
library(wordcloud)

#Create a frequency word cloud
wordcloud(
  words = corpus)

# Load the words data from a CSV file
words <- read.csv("Words.csv")

# Peek at plot keywords
head(words, 10)

# Create a quantitative word cloud
wordcloud(
  words = words$Term,
  freq = words$Box.Office,
  max.words = 50,
  scale = c(2, 0.1))

# Load the color brewer package
library(RColorBrewer)

# Create a gradient color palette
palette <- brewer.pal(
  n = 9, 
  name = "Oranges")

# Map critic score to colors
colors <- palette[cut(words$Critic.Score, 9)]

# Create a word cloud with color
wordcloud(
  words = words$Term,
  freq = words$Box.Office,
  max.words = 50,
  scale = c(2, 0.5),
  colors = colors,
  ordered.colors = TRUE)
