data<- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header = TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# converting class of Date column of data from character to Date 
data$Date<- as.Date(data$Date,format= "%d/%m/%Y")

#subsetting the data from the dates 2007-02-01 and 2007-02-02.
data<- data[(data[[1]] >= "2007-02-01" & data[[1]] <= "2007-02-02"),]

# histogram of Global Active Power
png("plot1.png")
hist(subset_data$Global_active_power, xlab= "Global Active Power (kilowatts)", ylab="Frequency", 
     main="Global Active Power", col ="red")
dev.off()

