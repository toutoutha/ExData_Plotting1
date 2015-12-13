setwd("~/coursera/DataScience/ExploratoryDataScience/project1")

#read entire dataset
entireData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#subset to data of interest (1st and 2nd Febr)
febrData <- entireData[entireData$Date %in% c("1/2/2007", "2/2/2007") , ]

#add a new column for DateTime
febrData$DateTime <- paste(febrData$Date, febrData$Time)

#add a new column for DateTime2 in the right format
febrData$DateTime2 <- strptime(febrData$DateTime, format="%d/%m/%Y %H:%M:%S")


# Plot 4
png(file = "plot4.png", width = 480, height = 480)
par(bg=NA)
par(mfrow = c(2, 2))
with(febrData, {
  plot(DateTime2, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(DateTime2, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(DateTime2, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  points(febrData$DateTime2, febrData$Sub_metering_2, type = "l", col = "red")
  points(febrData$DateTime2, febrData$Sub_metering_3, type = "l", col = "blue")
  legend("topright", cex = 0.8, bty = "n", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime2, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()

