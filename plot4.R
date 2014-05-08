# plot4.R
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
# End Loading


png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(febData,{
  plot(DateTime,Global_active_power/1000,type="l", xlab="", ylab="Global Active Power (kilowatts)")
  
  plot(DateTime,Voltage,  xlab="datetime", ylab="Voltage", type="l")
  
  plot(DateTime,Sub_metering_1,  xlab="", ylab="",  yaxt="n", type="n")
  axis(side=2,at=c(0,10,20,30))
  title(ylab="Energy of Submetering")
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright",lty=1, col = c("black","red","blue"), legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"))
  
  plot(DateTime,Global_reactive_power,  xlab="datetime", ylab="Voltage", type="l")
})
dev.off()

