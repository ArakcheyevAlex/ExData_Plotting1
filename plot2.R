setwd("~/learning_r/ExData_Plotting1")
fileUrl<- "../data/household_power_consumption.txt"

powerConsumptionData <- read.csv.sql(fileUrl, sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")
powerConsumptionData$Date <- as.Date(powerConsumptionData$Date, format = "%d/%m/%Y")
powerConsumptionData <- data.frame(DateTime = strptime(paste(powerConsumptionData$Date, powerConsumptionData$Time), "%d/%m/%Y %H:%M:%S"), powerConsumptionData)

Sys.setlocale("LC_TIME", "en_GB.UTF-8")

png(file = "plot2.png", width = 480, height = 480)
plot(powerConsumptionData$DateTime, powerConsumptionData$Global_active_power, type = "l", main = "", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
