## Script to generate Course Project 1 Plot 2

# Get rows for days 1/2/2007 and 2/2/2007
# Used grep at commandline to identify row range

data <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep = ";", comment.char="", nrows=2880, skip=66637, na.strings = "?", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Setup values for plot and tick text
days <- c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")

first_unique_rows <- data[which(!duplicated(data$Date)),][,1:3]

atvals <- rownames(first_unique_rows)

xtick_nums <- format(as.POSIXlt(as.Date(first_unique_rows$Date, format("%d/%m/%Y")))$wday)


# Add extra day tick text on to the end
if(max(as.numeric(rownames(data))) > as.numeric(tail(atvals, n = 1))){
    atvals <- c(atvals , max(as.numeric(rownames(data))) + 1) 
    
    xtick_nums <- c(xtick_nums,max(as.numeric(xtick_nums)) + 1)
}

# Convert x axis tick labels to text
xtick_txt <- days[as.numeric(xtick_nums)+1]

# Plot to png file
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(data[,3]
     , type = "l"
     , ylab = "Global Active Power"
     , xlab = NA
     , xaxt='n')

axis(side = 1
     , at=atvals
     , labels = xtick_txt
     , xpd = TRUE)

plot(data[,5]
     , type = "l"
     , ylab = "Voltage"
     , xlab = "datetime"
     , xaxt='n')

axis(side = 1
     , at=atvals
     , labels = xtick_txt
     , xpd = TRUE)

plot(data[,7]
     , type = "l"
     , ylab = "Energy sub metering"
     , xlab = NA
     , xaxt='n')

lines(data[,7]
      , col = "black")
lines(data[,8]
      , col = "red")
lines(data[,9]
      , col = "blue")

axis(side = 1
     , at=atvals
     , labels = xtick_txt
     , xpd = TRUE)

legend(x = "topright"
       , lwd = 1
       , bty = "n"
       , col = c("black","red","blue")
       , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data[,4]
     , type = "l"
     , ylab = "Global_reactive_power"
     , xlab = "datetime"
     , xaxt='n')

axis(side = 1
     , at=atvals
     , labels = xtick_txt
     , xpd = TRUE)

dev.off()

