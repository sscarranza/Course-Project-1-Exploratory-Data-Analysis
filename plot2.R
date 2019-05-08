# Course Project 1: Exploratory Data Analysis
# SABRINA KATE S. CARRANZA | PLOT #2

## Display the data
rm(list = ls())
data <- read.table("household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")

## Transform the Date variable to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert times and dates
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## Plot no. 2
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Save the file as png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)
