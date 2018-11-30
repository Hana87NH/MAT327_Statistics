#Import data
citibike <- read.csv(file.path("/Users/supababe/Documents/school/MAT327_Statistics/data","201807w1-citibike-tripdata.csv"))

#Cleaning data
#remove information not care about
citibike$start.station.latitude <- NULL
citibike$start.station.longitude <- NULL
citibike$end.station.longitude <- NULL
citibike$end.station.latitude <- NULL
citibike$bikeid <- NULL
library(lubridate)
#create a featrue start.date to store date and time separately
citibike$start.date <-date(as.POSIXct(citibike$starttime))
#change time format to hour of the day
citibike$starttime <- hour(as.POSIXct(citibike$starttime))
citibike$stoptime <- hour(as.POSIXct(citibike$stoptime))
#data has duplicate Sunday. Thus remove data from Sunday July 8th
citibike <- subset(citibike, start.date != '2018-07-08')
#create a feature day.of.week to store the week day
citibike$day.of.week <- weekdays(as.Date(date(citibike$start.date)))
#change tripduration from second to minute
citibike$tripduration <-citibike$tripduration/60
#reduce outliers (only consider trip durations 3 hrs and under)
citibike <- subset(citibike, tripduration <=180)
#create small dataset for each day of the week
monday <- subset(citibike, day.of.week =='Monday')
tuesday <- subset(citibike, day.of.week =='Tuesday')
wednesday <- subset(citibike, day.of.week =='Wednesday')
thursday <- subset(citibike, day.of.week =='Thursday')
friday <- subset(citibike, day.of.week =='Friday')
saturday <- subset(citibike, day.of.week =='Saturday')
sunday <- subset(citibike, day.of.week =='Sunday')
subcriber <- subset(citibike, usertype =='Subcriber')
nonSubcriber <- subset(citibike, usertype =='Customer')

#Calculating descriptive statistics
mean(citibike$tripduration)
sd(citibike$tripduration)
mean(citibike$birth.year)
sd(citibike$birth.year)
mean(citibike$starttime)
sd(citibike$starttime)/60
mean(citibike$stoptime)
sd(citibike$stoptime)/60

#Exploring data with plots
boxplot(citibike$tripduration, main='Boxplot of Citi Bike trip duration', xlab='Time in minutes')
hist(citibike$birth.year, main='Histogram of Citi Bike users birth year', xlab='Year')
boxplot(citibike$birth.year, main='Boxplot of users birth year')
hist(citibike$starttime, main='Histogram of bike pick up time', xlab='Time in 24hrs')
boxplot(citibike$starttime, main='Boxplot of bike pick up time', ylab='24 hrs time')
hist(citibike$stoptime, main='Histogram of bike drop off time', xlab='Time in 24hrs')
boxplot(citibike$stoptime, main='Boxplot of bike drop off time', ylab='24 hrs time')
hist(citibike$gender, main='Histogram of users gender', xlab='Gender (0=unknown; 1=male; 2=female)')
boxplot(starttime ~ day.of.week, data=citibike, main = 'Different boxplots of pick up time for each day of the week')
boxplot(tripduration ~ day.of.week, data=citibike, main = 'Different boxplots of trip duration for each day of the week')

install.packages('qcc')
library(qcc)
pareto.chart(table(citibike$usertype), ylab="Frequency", main='Pareto chart for User Types')
pareto.chart(table(citibike$gender), ylab="Frequency", main='Pareto chart for User Gender', xlab= 'Gender (0 = unknown, 1 = male, 2 = female)')
pareto.chart(table(citibike$start.station.id), ylab="Frequency", main='Pareto chart for Pick up station')
pareto.chart(table(citibike$end.station.id), ylab="Frequency", main='Pareto chart for Drop off station')

#Test for confidence intervals
t.test(citibike$tripduration)
t.test(citibike$birth.year)
t.test(citibike$starttime)

#Hypothesis test
#null hypothesis: the mean of tripduaration on Wednesday and Saturday are the same
t.test(wednesday$tripduration,saturday$tripduration, var.equal = FALSE)
#null hypothesis: the mean of pickup time on Monday and Sunday are the same
t.test(monday$starttime,sunday$starttime, alternative = "two.sided", var.equal = FALSE)
#null hypothesis: the proportion of number of Non-Subcriber using bike on Wednesday and Saturday are the same
sat_numNon <- nrow(subset(saturday, usertype == 'Customer')) #number of Non-subscriber users on Saturday
wed_numNon <- nrow(subset(wednesday, usertype == 'Customer')) #number of Non-subscriber users on Wednesday
prop.test(x = c(wed_numNon,sat_numNon), n = c(nrow(wednesday),nrow(saturday)),p=NULL)

#Additional Analysis
#ANOVA. Null hypothesis: the mean of tripduration on each day of the week are the same
anova(lm(tripduration ~ day.of.week, data=citibike))
#ANOVA. Null hypothesis: the mean of pick up time on each day of the week are the same
anova(lm(starttime ~ day.of.week, data=citibike))

#occurence of overtime ride
nrow(subset(citibike, tripduration >45))/nrow(citibike)




