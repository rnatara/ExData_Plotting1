# plot3.R
#-----------------------------------------------------------------------------
# Draw frequency of Gloabl Active Power for 2 days (2007-02-01 to 2007-02-02) 
# Raw Data: Electric Power Consumption Data 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Project sumbission for Exploratory Data Analysis Data Sciences Course
# *** Note ***
#skip and nrows in read.csv obtained by grep/wc and adjusting for header row
#echo "skip: "
#grep -n '^1/2/2007' household_power_consumption.txt |head -1|cut -f1 -d:
#echo "nrows: "
#egrep '^[12]/2/2007' household_power_consumption.txt |wc -
#skip:
#66638
#nrows:
#2880
#-----------------------------------------------------------------------------
# nram, Apr 12, 2015


#read partial data into memory
data<-read.csv("household_power_consumption.txt", 
	       sep=";", 
	       skip=66636, 
	       nrows=2880, 
	       col.names=c("Date", "Time", "Global_active_power", 
			   "Global_reactive_power", "Voltage", 
			   "Global_intensity", "Sub_metering_1", 
			   "Sub_metering_2", "Sub_metering_3"))

# Get DateTime from Date and Time columns
data$datetime<- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# draw plots to png graphic device
png(file="plot4.png", width=480, height=480)
attach(data)
par(mfrow=c(2,2))
  # Plot 1
  plot(datetime, Global_active_power, type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

  # Plot 2
  plot(datetime, Voltage, type="l",
       xlab="",ylab="Voltage")

  # Plot 3
  plot(datetime, Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy Sub metering")
  lines(datetime, Sub_metering_2, type="l", col="red")
  lines(datetime, Sub_metering_3, type="l", col="blue")
  legend("topright",  box.col="white", inset=0.01, lty=c(1,1,1), col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # Plot 4
  plot(datetime, Global_reactive_power, type="l")
  detach(data)
dev.off()
