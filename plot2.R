library(sqldf)

setwd("~/learning_r/ExData_Plotting1")
fileUrl<- "../data/household_power_consumption.txt"

powerConsumptionData <- read.csv.sql(fileUrl, sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
powerConsumptionData <- data.frame(DateTime = paste(powerConsumptionData$Date, powerConsumptionData$Time), powerConsumptionData)
powerConsumptionData$DateTime <- strptime(powerConsumptionData$DateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

png(file = "plot2.png", width = 480, height = 480)
plot(powerConsumptionData$DateTime, powerConsumptionData$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
