library(sqldf)

setwd("~/learning_r/ExData_Plotting1")
fileUrl<- "../data/household_power_consumption.txt"

powerConsumptionData <- read.csv.sql(fileUrl, sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
powerConsumptionData <- data.frame(DateTime = paste(powerConsumptionData$Date, powerConsumptionData$Time), powerConsumptionData)
powerConsumptionData$DateTime <- strptime(powerConsumptionData$DateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

png(file = "plot3.png", width = 480, height = 480)

plot(powerConsumptionData$DateTime, powerConsumptionData$Sub_metering_1, type = "l", main = "", ylab = "Energy sub metering", xlab = "")
lines(powerConsumptionData$DateTime, powerConsumptionData$Sub_metering_2, col = "red")
lines(powerConsumptionData$DateTime, powerConsumptionData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1))

dev.off()

