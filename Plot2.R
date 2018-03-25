require(dplyr)
#setting working directory
setwd("C:/Users/Karolina/Desktop/Coursera Data Science/Explr Data Analysis/Project 1")
#loading data
raw_data<-read.table("household_power_consumption.txt", header = TRUE, sep=";")
#changing Date to 'date' format
raw_data$Date2<-as.Date(raw_data$Date, format = "%d/%m/%Y")
#changing Time to 'time' format
raw_data$Time2<-format(raw_data$Time,
                         format = "%H:%M:%S")

#subsetting raw_data to include only dates 2007-02-01 and 2007-02-02 data
plot_data<-as.data.frame(raw_data[(raw_data$Date2=="2007-02-01") | 
               (raw_data$Date2=="2007-02-02"),])
#changing Global_active_power from fator to numeric
plot_data$Global_active_power<-
  as.numeric(levels(plot_data$Global_active_power))[plot_data$Global_active_power]
#creating DateTime variable/column
plot_data$DateTime<-as.POSIXct(paste(as.character(plot_data$Date2), plot_data$Time2), 
                                    format="%Y-%m-%d %H:%M:%S")

#Opening graphic device - png
png(file="Plot2.png", width=480, height=480)
#Line Chart
plot(Global_active_power ~ DateTime, plot_data, xlab="",  type = "l", 
     ylab="Global Active Power (kilowatts)")

#closing GD
dev.off() 