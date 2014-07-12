# plot2.R - Histogram of Global Active Power

#Reading the data into R

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Creating Datetime variable
data$Time <- paste(data$Date, data$Time,sep = " ")

#converting the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

#Subset the data for observation of 01 and 02 Fe 2007

data <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

# Open plot4.png
png("plot4.png", height=480, width=480)


# Configure a 2x2 multiplot
par(mfrow=c(2,2))

# Global Active Power plot
plot(data$DateTime, 
     data$Global_active_power, 
     pch=NA, 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

# Voltage plot
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(data$DateTime, data$Voltage)

# Submetering plot
plot(data$DateTime, 
     data$Sub_metering_1, 
     pch=NA, 
     xlab="", 
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1)
lines(data$DateTime, data$Sub_metering_2, col='red')
lines(data$DateTime, data$Sub_metering_3, col='blue')
legend('topright', 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1,1,1),
       col = c('black', 'red', 'blue'),
       bty = 'n')

# Global reactive power plot
with(data, plot(DateTime, Global_reactive_power, xlab='datetime', pch=NA))
with(data, lines(DateTime, Global_reactive_power))

# Close PNG file
dev.off()
