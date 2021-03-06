setwd("~/coursera/DataScience/ExploratoryDataScience/project1")

#read entire dataset
entireData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#subset to data of interest (1st and 2nd Febr)
febrData <- entireData[entireData$Date %in% c("1/2/2007", "2/2/2007") , ]

#add a new column for DateTime
febrData$DateTime <- paste(febrData$Date, febrData$Time)

#add a new column for DateTime2 in the right format
febrData$DateTime2 <- strptime(febrData$DateTime, format="%d/%m/%Y %H:%M:%S")


# Plot 1
par(bg=NA)
hist(febrData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", breaks = 12)
dev.copy(png, file = "plot1.png", width = 480, height = 480, bg = "transparent")
dev.off()

