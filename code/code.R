citibike <- read.csv(file.path("/Users/supababe/Documents/school/MAT327_Statistics/data","201807w1-citibike-tripdata.csv"))
citibike$start.station.latitude <- NULL
citibike$start.station.longitude <- NULL
citibike$end.station.longitude <- NULL
citibike$end.station.latitude <- NULL
citibike$starttime <- as.POSIXct(citibike$starttime)
citibike$stoptime <- as.POSIXct(citibike$stoptime)
citibike$tripduration <-citibike$tripduration/60

mean(citibike$tripduration)
sd(citibike$tripduration)
mean(citibike$birth.year)
sd(citibike$birth.year)
mean(citibike$starttime)
sd(citibike$starttime)/60
mean(citibike$stoptime)
sd(citibike$stoptime)/60

boxplot(citibike$tripduration, main='Boxplot of Citi Bike trip duration')
hist(citibike$birth.year, main='Histogram of Citi Bike users birth year', xlab='Year')
boxplot(citibike$starttime, main='Boxplot of pick up time in POSIXct time')
boxplot(citibike$stoptime, main='Boxplot of drop off time in POSIXct time')
hist(citibike$gender, main='Histogram of users gender', xlab='Gender (0=unknown; 1=male; 2=female)')
boxplot(citibike$birth.year, main='Boxplot of users birth year')

install.packages('qcc')
library(qcc)
pareto.chart(table(citibike$usertype), ylab="Frequency", main='Pareto chart for User Types')
pareto.chart(table(citibike$gender), ylab="Frequency", main='Pareto chart for User Gender', xlab= 'Gender (0 = unknown, 1 = male, 2 = female)')
pareto.chart(table(citibike$start.station.id), ylab="Frequency", main='Pareto chart for Pick up station')
pareto.chart(table(citibike$end.station.id), ylab="Frequency", main='Pareto chart for Drop off station')




