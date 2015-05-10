## Script to generate Course Project 1 Plot 1

# Get rows for days 1/2/2007 and 2/2/2007
# Used grep at commandline to identify row range

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";", comment.char="", nrows=2880, skip=66637, na.strings = "?", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Plot to png file
png(filename = "plot1.png", width = 480, height = 480)

hist(data[,3]
     , col = "red"
     , main="Global Active Power"
     , xlab = "Global Active Power (kilowatts)")

par(cex.axis = .85)

dev.off()