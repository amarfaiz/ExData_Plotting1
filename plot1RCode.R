# Written by Amar Faiz

# The working directory had been set to local folder
# Read raw data from the working directory
rawData <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", stringsAsFactors = FALSE)

# Filter only the intermediate data (data with date of 1st and 2nd February 2007) stored in desiredData
intermediateData <- rawData[rawData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Filter only the wanted data (Global Active Power)
wantedData <- as.numeric(intermediateData$Global_active_power)

# Plot the output graph as histogram
imagePlot1 <- hist(wantedData, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Copy and save the histogram as plot1.png. Close the graphic plugin
dev.copy(png, 'plot1.png')
dev.off()

