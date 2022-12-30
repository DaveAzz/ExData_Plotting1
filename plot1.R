## Read data into R

# Set file name variable
file_name <- "household_power_consumption.txt"

# Read txt file into data variable
data <- read.table(file_name, header = TRUE, sep = ";", dec = ".", na.strings = "?")

# Update data variable to be a subset of the initial data
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

# Create new column combining date and time
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")


## Create plot1 PNG file

png(file = "plot1.png")

hist(data$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()
