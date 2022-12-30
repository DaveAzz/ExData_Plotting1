## Read data into R

# Set file name variable
file_name <- "household_power_consumption.txt"

# Read txt file into data variable
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Update data variable to be a subset of the initial data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Create new column combining date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Create plot4 PNG file

png(file = "plot4.png")

par(mfrow = c(2, 2))

plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

with(data, plot(datetime, Voltage, type = "l"))

plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, data$Sub_metering_2, col = "red")
lines(data$datetime, data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
with(data, plot(datetime, Global_reactive_power, type = "l"))

dev.off()

