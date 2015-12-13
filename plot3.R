setwd("~/coursera/DataScience/ExploratoryDataScience/project1")

#read entire dataset
entireData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#subset to data of interest (1st and 2nd Febr)
febrData <- entireData[entireData$Date %in% c("1/2/2007", "2/2/2007") , ]

#add a new column for DateTime
febrData$DateTime <- paste(febrData$Date, febrData$Time)

#add a new column for DateTime2 in the right format
febrData$DateTime2 <- strptime(febrData$DateTime, format="%d/%m/%Y %H:%M:%S")


# Plot 3
png(file = "plot3.png", width = 480, height = 480, bg = "transparent")
with(febrData, plot(DateTime2, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(febrData$DateTime2, febrData$Sub_metering_2, type = "l", col = "red")
points(febrData$DateTime2, febrData$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


