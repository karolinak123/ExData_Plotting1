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
#changing Sub_metering from fator to numeric
plot_data$Sub_metering_1<-as.numeric(levels(plot_data$Sub_metering_1))[plot_data$Sub_metering_1]
plot_data$Sub_metering_2<-as.numeric(levels(plot_data$Sub_metering_2))[plot_data$Sub_metering_2]
#changing Voltage from fator to numeric
plot_data$Voltage<-as.numeric(levels(plot_data$Voltage))[plot_data$Voltage]
#changing Global_active_power from fator to numeric
plot_data$Global_active_power<-
  as.numeric(levels(plot_data$Global_active_power))[plot_data$Global_active_power]
#changing Global_reactive_power from fator to numeric
plot_data$Global_reactive_power<-
  as.numeric(levels(plot_data$Global_reactive_power))[plot_data$Global_reactive_power]
#creating DateTime variable/column
plot_data$DateTime<-as.POSIXct(paste(as.character(plot_data$Date2), plot_data$Time2), 
                                    format="%Y-%m-%d %H:%M:%S")
#Opening graphic device - png
png(file="Plot4.png", width=480, height=480)

par(mfrow = c(2, 2))
with(plot_data, {
      #line chart #1
      plot(Global_active_power ~ DateTime, xlab="",  type = "l", 
           ylab="Global Active Power")
      
      #plot #2
      plot(Voltage ~ DateTime, xlab="datetime",  type = "l", 
           ylab="Voltage")
      
      
      ##line chart #3
      #creating plot with first variable Sub_metering_1
      plot(Sub_metering_1 ~ DateTime, xlab="",  type = "l", 
           ylab="Energy sub metering", col="black")
      #adding lines with Sub_metering_2 and _3 to the plot
        lines(Sub_metering_2 ~ DateTime, col="red")
        lines(Sub_metering_3 ~ DateTime, col="blue")
      #placing and creating legend
        legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), 
             legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
      #plot #4
      plot(Global_reactive_power ~ DateTime, xlab="datetime",  type = "l", 
           ylab="Global_reactive_power")})
#closing GD
dev.off() 