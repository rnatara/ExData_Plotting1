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
data$DateTime<- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# draw plots to png graphic device
png(file="plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, type="l", col="gray",
     xlab="", ylab="Energy Sub metering")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright",  lty=c(1,1,1), col=c("gray","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
