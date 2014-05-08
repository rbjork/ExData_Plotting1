# plot1.R
# code by Ronald Bjork
# for Exploratory Analysis
# project 1

# NOTE: The loading code for plot1,2,3,and 4 are all the same so it need not be repeated.

# Loading
file <- "./household_power_consumption.txt"
data <- read.table(file,header=TRUE,sep=";")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")

feb1 <- as.Date("01/02/2007",format="%d/%m/%Y")
feb2 <- as.Date("02/02/2007",format="%d/%m/%Y")

feb1Data <- data[(data$Date == feb1 ),]
feb2Data <- data[(data$Date == feb2 ),]
febData <- rbind(feb1Data,feb2Data)

library(lubridate)

febData$DateTime <- ymd_hms(paste(as.character(febData$Date), as.character(febData$Time), sep=" "))
febData$Global_active_power <- as.numeric(febData$Global_active_power)
# End Loading and cleaning


png(file = "plot1.png", width = 480, height = 480)
hist(febData$Global_active_power/1000,freq = TRUE, col="red", xlab="", main="")
title(xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()