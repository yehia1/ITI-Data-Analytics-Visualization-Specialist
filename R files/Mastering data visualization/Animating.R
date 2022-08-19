#set working directory
setwd("E:/Coding/Data anaylsis/ITI-Data-Analytics-Visualization-Specialist/R files/Mastering data visualization")

# Load the data
studios <- read.csv('Studios.csv')

head(studios)

#Load the color brewer package
library(RColorBrewer)

#Create discrete color pallete
pallete <- brewer.pal(10,'Set3')

# Get the last period data
period <- studios[studios$Period == 183,]

# Create scatterplot of last period (July 2015)
plot(
  x = period$Count,
  y = period$Box.Office,
  xlim = c(0, 225),
  ylim = c(0, 17500),
  col = palette[as.integer(period$Studio)],
  pch = 19,
  cex = 2,
  main = "Top 10 Studios (2000-2015)",
  sub = period$Release,
  xlab = "Movies Released",
  ylab = "Box Office Revenue ($M)")

# Create animation function
animate <- function() {
  for(i in 1:183)
  {
    # Get current period data
    period <- studios[studios$Period == i,]
    
    # Create scatterplot of current period
    plot(
      x = period$Count,
      y = period$Box.Office,
      xlim = c(0, 225),
      ylim = c(0, 17500),
      col = palette[as.integer(period$Studio)],
      pch = 19,
      cex = 2,
      main = "Top 10 Studios (2000-2015)",
      sub = period$Release,
      xlab = "Movies Released",
      ylab = "Box Office Revenue ($M)")
    
    # Display legend
    legend(
      x = "bottomright", 
      as.character(levels(period$Studio)), 
      col = palette[as.integer(period$Studio)], 
      pch = 19, 
      cex = 0.75)
    

  }
}
# Load animation package
library(animation)

# Set the frame rate
ani.options(
  interval = 0.067,
  ani.width = 640,
  ani.height = 480)



