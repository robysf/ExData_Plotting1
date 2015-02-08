#######################################
###### EXPLORATORY DATA ANALYSIS ######
############  Assignment 1 ############
############### Plot 3  ###############
#######################################

# Read in data (large file! 200 Mb)
setwd("/Users/robysf/Documents/Fellowship/Coursera/Exploratory_Data_Analysis/Project1/")
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# convert y-axis parameters to numeric from character
powerData$Sub_metering_1 <- as.numeric(powerData$Sub_metering_1)
powerData$Sub_metering_2 <- as.numeric(powerData$Sub_metering_2)
 ## (Sub_metering_3 is already imported as numeric)

# subset data to include only Feb 1 and Feb 2, 2007
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
if(!require(dplyr)) install.packages("dplyr")
library(dplyr)
plotData <- filter(powerData, Date == "2007-02-01" | Date == "2007-02-02")

# convert x-axis parameter to a unified date-time variable
plotData$datetime <- strptime(paste(plotData$Date, plotData$Time), 
                              format = "%Y-%m-%d %H:%M:%S")

# generate desired plot as png
png(filename = "plot3.png")
plot(plotData$datetime, plotData$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering")
lines(plotData$datetime, plotData$Sub_metering_2, type = "l", col = "red")
lines(plotData$datetime, plotData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()
