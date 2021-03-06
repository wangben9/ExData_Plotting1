## Load data

household_data <- read.csv2(file = "./data/household_power_consumption.txt")
inds <- household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007"
target_data <- household_data[inds,]
head(target_data)
tail(target_data)
rm(household_data)

dates <- strptime(paste(target_data$Date,target_data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 1
temp <- as.numeric(matrix(target_data$Global_active_power))
hist(temp, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()
