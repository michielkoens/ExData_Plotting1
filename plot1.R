# Read all data
hhpc <- read.table("household_power_consumption.txt", header = TRUE, 
                   as.is = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)))
# Select the two days we use
dates <- (hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007")
hhpc <- hhpc[dates,]

# Open device
png("plot1.png", width = 480, height = 480, bg = "transparent")

# Create simple hist plot
hist(hhpc$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", 
     breaks=12)

# Close device
dev.off()
