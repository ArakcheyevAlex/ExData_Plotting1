setwd("~/learning_r/ExData_Plotting1")
fileUrl<- "../data/household_power_consumption.txt"

powerConsumptionData <- read.csv.sql(fileUrl, sql = "SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")

png(file = "plot1.png", width = 480, height = 480)
hist(powerConsumptionData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
