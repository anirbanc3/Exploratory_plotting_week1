library(data.table)

filename <- "Electric power consumption"
if (!file.exists(filename)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename)
  unzip(filename)
}

infile <- "household_power_consumption.txt"
data <- fread(infile, sep = ";", header = TRUE, na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

glActive <- subData[,subData$Global_active_power]
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, glActive, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()