#######################################
###### EXPLORATORY DATA ANALYSIS ######
############  Assignment 1 ############
############### Plot 2  ###############
#######################################

# Read in data (large file! 200 Mb)
setwd("/Users/robysf/Documents/Fellowship/Coursera/Exploratory_Data_Analysis/Project1/")
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# convert y-axis parameter to numeric from character
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)

# subset data to include only Feb 1 and Feb 2, 2007
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
install.packages("dplyr")
library(dplyr)
plotData <- filter(powerData, Date == "2007-02-01" | Date == "2007-02-02")

# convert x-axis parameter to a unified date-time variable
plotData$datetime <- strptime(paste(plotData$Date, plotData$Time), 
                               format = "%Y-%m-%d %H:%M:%S")

# generate plot in local display:
plot(plotData$datetime, plotData$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

# save as png file (default appears to be 480 x 480)
dev.copy(png, file = "plot2.png")
dev.off()
