## Load data

household_data <- read.csv2(file = "./data/household_power_consumption.txt")
inds <- household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007"
target_data <- household_data[inds,]
head(target_data)
tail(target_data)
rm(household_data)

dates <- strptime(paste(target_data$Date,target_data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 4
db1 <- as.numeric(matrix(target_data$Global_active_power))
db2 <- as.numeric(matrix(target_data$Voltage))
db4 <- as.numeric(matrix(target_data$Global_reactive_power))


temp1 <- as.numeric(matrix(target_data$Sub_metering_1))
temp2 <- as.numeric(matrix(target_data$Sub_metering_2))
temp3 <- as.numeric(matrix(target_data$Sub_metering_3))
name1 <- "Sub_metering_1"
name2 <- "Sub_metering_2"
name3 <- "Sub_metering_3"

par(mfrow = c(2,2), mar = c(2,2,2,2))

# subplot 1
plot(dates, db1, ylab = "Global Active Power", type = "l")

# subplot 2
plot(dates, db2, xlab = "datetime", ylab = "Voltage", type = "l")

# subplot 3
plot(dates, temp1, ylab = "Energy sub metering", type = "n")
points(dates, temp1, ylab = "Energy sub metering", type = "l", col = "green")
points(dates, temp2, ylab = "Energy sub metering", type = "l", col = "red")
points(dates, temp3, ylab = "Energy sub metering", type = "l", col = "blue")
legend("topright", legend = c(name1, name2, name3), 
       col = c("green", "blue", "red"),
       lty = c(1,1,1))


# subplot 4
plot(dates, db4, xlab = "datetime", ylab = "Global Reactive Power", type = "l")


## Save plot
dev.copy(png, file = "plot4.png")
dev.off()
