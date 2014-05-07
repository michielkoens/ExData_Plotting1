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
png("plot3.png", width = 480, height = 480, bg = "transparent")

# Create empty plot, and then draw three line plots with different colors on top
with(hhpc, {
    plot(DateTime, Sub_metering_1, type="n", 
        ylab="Energy sub metering", xlab="", main="")
    points(DateTime, Sub_metering_1, type="l", col="black")
    points(DateTime, Sub_metering_2, type="l", col="red")
    points(DateTime, Sub_metering_3, type="l", col="blue")
})
# Add a legend
legend("topright", lty=c(1,1,1), col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close device
dev.off()
