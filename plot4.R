library(data.table)

filename <- "Electric power consumption"
if (!file.exists(filename)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename)
  unzip(filename)
}

infile <- "household_power_consumption.txt"
data <- fread(infile, sep = ";", header = TRUE, na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(datetime, subData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
plot(datetime, subData$Voltage,type = "l", ylab = "Voltage", xlab = "datetime")
plot(datetime, subData$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
points(datetime, subData$Sub_metering_2, type = "l", col = "red")
points(datetime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, bty = "n", col=c("black", "red", "blue"))
plot(datetime, subData$Global_reactive_power, type = "l",xlab = "datetime",ylab = "Global_reactive_power")
dev.off()

