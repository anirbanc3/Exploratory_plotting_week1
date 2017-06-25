library(data.table)

filename <- "Electric power consumption"
if (!file.exists(filename)) {
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",filename)
  unzip(filename)
}

infile <- "household_power_consumption.txt"
data <- fread(infile, sep = ";", header = TRUE, na.strings = "?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot1.png", width=480, height=480)
hist(subData$Global_active_power, xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power", col = "red")
dev.off()