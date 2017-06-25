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

png("plot3.png", width=480, height=480)
plot(datetime, subData$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
points(datetime, subData$Sub_metering_2, type = "l", col = "red")
points(datetime, subData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()