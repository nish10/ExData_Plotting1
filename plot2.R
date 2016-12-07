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

#plotting the graph 2
png("plot2.png")

# type argument takes the value "p" to draw only the points,
# "l" to draw only the lines and "o" to draw both points and lines.
with(tidydata, plot(date_time, Global_active_power, type ="l", xlab="",ylab="Global Active Power (kilowatts)"))

dev.off()

