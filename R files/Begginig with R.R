#Create a new dataframe
df <- data.frame(
  Name= c('a','b','c'),
  Value = c(5,6,7)
)
head(df)

#plot the data frame barcharts
barplot(names = df$Name,
        height = df$Value,
        xlab = 'Name',
        ylab = 'Value',
        col = 'yellow',main = 'First graph')

#using the lattice library

library(lattice)

# adding basic dot plot using lattice
dotplot(Value~ Name , df,
        xlab = 'Name',
        ylab = 'Value',
        col = 'black',main = 'Second graph')

barchart(Value~ Name , df,
         xlab = 'Name',
         ylab = 'Value',
         main = 'Third graph')

# using ggplot2

library(ggplot2)

ggplot(df,aes(Name,Value))+
  geom_point()


ggplot(df,aes(Name,Value))+
  geom_bar(stat = 'identity',fill = 'skyblue')+
  ggtitle('fourth graph')+
  xlab('Name')+
  ylab('Value')







