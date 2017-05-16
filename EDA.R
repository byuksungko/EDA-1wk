rm(list = ls())
library(dplyr)
setwd("C:/Users/AMC/Desktop/R/exdata_data_household_power_consumption/")
getwd()

## Loading the data
dataset1 <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?")
dataset2 <- dataset1 %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")
DateTime <- paste(dataset2$Date, dataset2$Time, sep = " ")
dataset3 <- data.frame(DateTime, dataset2[,3:9])
dataset3$DateTime <- strptime(dataset3$DateTime, format = "%d/%m/%Y %H:%M:%S")

## Making Plots
# Plot1
png(file="plot1.png", width = 480, height = 480)
hist(dataset3$Global_active_power, col = "Red", main = "Global Active Power", xlim = c(0,6), ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()

# Plot2
png(file="plot2.png", width = 480, height = 480)
plot(dataset3$DateTime,dataset3$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Plot3
png(file="plot3.png", width = 480, height = 480)
plot(dataset3$DateTime,dataset3$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(dataset3$DateTime,dataset3$Sub_metering_2, type = "l", col = "red")
lines(dataset3$DateTime,dataset3$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", y = NULL, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

# Plot4
png(file="plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
plot(dataset3$DateTime,dataset3$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
plot(dataset3$DateTime,dataset3$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(dataset3$DateTime,dataset3$Sub_metering_2, type = "l", col = "red")
lines(dataset3$DateTime,dataset3$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dataset3$DateTime,dataset3$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(dataset3$DateTime,dataset3$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()