
#setting working directory
setwd("C:/Users/Karolina/Desktop/Coursera Data Science/Explr Data Analysis/Project 1")
#loading data
raw_data<-read.table("household_power_consumption.txt", header = TRUE, sep=";")
#changing Date to 'date' format
raw_data$Date2<-as.Date(raw_data$Date, format = "%d/%m/%Y")
#subsetting raw_data to include only dates 2007-02-01 and 2007-02-02 data
data<-raw_data[(raw_data$Date2=="2007-02-01") | 
               (raw_data$Date2=="2007-02-02"),]
#opening graphic device - png
png(file="Plot1.png", width=480, height=480)
#histogram
hist(as.numeric(levels(data$Global_active_power))[data$Global_active_power], 
     xlab="Global Active Power (kilowatts)", 
     main="Global Active Power", col="red")
#closing GD
dev.off()