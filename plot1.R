#######################################
###### EXPLORATORY DATA ANALYSIS ######
############  Assignment 1 ############
############### Plot 1  ###############
#######################################

# Read in data (must be run from directory with "household_power_consumption.txt")
setwd("/Users/robysf/Documents/Fellowship/Coursera/Exploratory_Data_Analysis/Project1/")
powerData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)

# convert plotted parameter to numeric from character
powerData$Global_active_power <- as.numeric(powerData$Global_active_power)

# subset data to include only Feb 1 and Feb 2, 2007
powerData$Date <- as.Date(powerData$Date, format = "%d/%m/%Y")
install.packages("dplyr")
library(dplyr)
plot1Data <- filter(powerData, Date == "2007-02-01" | Date == "2007-02-02")

# generate plot in local display
hist(plot1Data$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# save as png file (default appears to be 480 x 480)
dev.copy(png, file = "plot1.png")
dev.off()
