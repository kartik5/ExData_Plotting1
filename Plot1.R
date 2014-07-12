# plot1.R - Histogram of Global Active Power

#Reading the data into R

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?",colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

#Creating Datetime variable
data$Time <- paste(data$Date, data$Time,sep = " ")

#converting the Date and Time variables to Date/Time classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, format = "%d/%m/%Y %H:%M:%S")

#Subset the data for observation of 01 and 02 Fe 2007

data <- subset(data, data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"))

#open plot1.png

png("plot1.png", height=480, width=480)

# Build histogram
hist(dataUse$Global_active_power, col='red', 
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power')
#Close PNG file
dev.off() 
