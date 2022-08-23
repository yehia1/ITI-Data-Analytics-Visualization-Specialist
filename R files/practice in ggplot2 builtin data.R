library(ggplot2)

#quiz 1
data('midwest',package = 'ggplot2')

#draw scatter plot area on x and poptot on y and popdensity on color with best 

ggplot(midwest,
       aes(x = area, y = poptotal,size = popdensity))+
  geom_point(shape = 1)+
  ggtitle('Popdensity vs poptotal')


ggplot(midwest,
       aes(x = area, y = poptotal,size = popdensity))+
  geom_point(shape = 1)+
  geom_smooth(method = 'lm')+
  ggtitle('Popdensity vs poptotal')

ggplot(midwest,
       aes(x = area, y = poptotal,size = popdensity))+
  geom_point(shape = 1)+
  geom_smooth(method = 'loess')+
  ggtitle('Popdensity vs poptotal')


#quiz 2 
data('mpg',package = 'ggplot2')

#draw histogram on a continuous (Numeric variable displ and fill by class
ggplot(mpg,
       aes(x = displ,fill = class))+
geom_histogram(binwidth = 0.1)


ggplot(mpg,
       aes(x = displ,fill = class))+
  geom_histogram(bins = 5)


# do scatter plot between city vs high way mileage with smooth line method = lm 
ggplot(mpg,
       aes(x = cty, y = hwy))+
  geom_point(shape = 1)+
  geom_smooth(method = 'lm')+
  geom_jitter()+
  ggtitle('City vs Highway mileage')+
  xlab('city')+
  ylab('Highway mileage')

# do scatter plot between city vs high way mileage with smooth line method = lm 
ggplot(mpg,
       aes(x = cty, y = hwy))+
  geom_smooth(method = 'lm')+
  geom_jitter()+
  ggtitle('City vs Highway mileage')+
  xlab('city')+
  ylab('Highway mileage')
