data<- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# converting class of Date column of data from character to Date 
data$Date<- as.Date(data$Date,format= "%d/%m/%Y")

#subsetting the data from the dates 2007-02-01 and 2007-02-02.
data<- data[(data[[1]] >= "2007-02-01" & data[[1]] <= "2007-02-02"),]

# removing all the rows in which NA are present
data<- data[complete.cases(data),]

library(tidyr)
#combine Date and Time column of data
tidydata<- unite(data, date_time, Date, Time, sep=" ")

#converting date_time column in POXISlt class
tidydata$date_time<- strptime(tidydata$date_time, "%Y-%m-%d %H:%M:%S")

# plotting graph 
png("plot3.png")
with(tidydata, plot(date_time, Sub_metering_1, xlab="", ylab="Energy sub metering", col ="black", type="l"))
with(tidydata, points(date_time, Sub_metering_2, col="red", type="l"))
with(tidydata, points(date_time, Sub_metering_3, col="blue", type="l"))
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), y.intersp= 1)

dev.off()

