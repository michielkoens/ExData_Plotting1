# Read all data
hhpc <- read.table("household_power_consumption.txt", header = TRUE, 
                   as.is = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)))
# Select the two days we use
dates <- (hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007")
hhpc <- hhpc[dates,]
# Convert date and time
hhpc$DateTime <- strptime(paste(hhpc$Date, hhpc$Time), "%d/%m/%Y %H:%M:%S")

# Open device
png("plot2.png", width = 480, height = 480, bg = "transparent")
plot(hhpc$DateTime, hhpc$Global_active_power, type="l", main="", 
     ylab="Global Active Power (kilowatts)", xlab="")

# Close device
dev.off()
