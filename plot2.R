# plot2.R
#-----------------------------------------------------------------------------
# Draw Gloabl Active Power usage for 2 days (2007-02-01 to 2007-02-02) 
# Rawdata: Electric Power Consumption Data 
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

setwd("c:/Users/rnatarajan/workspace/Courcera/DataScience/ExploratoryDataAnalysis/Project")

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
# Plot to png graphis device
png(file="plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatt)")
dev.off()

# optional 
#data$Weekday <- weekdays(as.Date(data$Date, "%d/%m/%Y")) 
#rug(data$Global_active_power)
#View(data,"Global Active Power (2 days)")
