# Written by Amar Faiz

# The working directory had been set to local folder
# Read raw data from the working directory
rawData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

# Filter only the intermediate data (data with date of 1st and 2nd February 2007) stored in desiredData
intermediateData <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Filter only the wanted data (Global Active Power)
wantedData <- as.numeric(intermediateData$Global_active_power)

# Obtain data for each information of sub-meters
subMeter1 <- as.numeric(intermediateData$Sub_metering_1)
subMeter2 <- as.numeric(intermediateData$Sub_metering_2)
subMeter3 <- as.numeric(intermediateData$Sub_metering_3)

# Obtain information of the timeline of the wanted data , 
wantedDateAndTime <- strptime(paste(intermediateData$Date, intermediateData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Plot the output graph as x-y plot with legend
plot(x = wantedDateAndTime, y = subMeter1, type = "l", ylab = "Energy Submetering")
lines(x = wantedDateAndTime, y = subMeter2, type = "l", col = "red")
lines(x = wantedDateAndTime, y = subMeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3, col = c("black", "red", "blue")) 
# Copy and save the x-y plot as plot2.png. Close the graphic plugin
dev.copy(png, 'plot3.png')
dev.off()