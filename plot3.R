## Load data

household_data <- read.csv2(file = "./data/household_power_consumption.txt")
inds <- household_data$Date == "1/2/2007" | household_data$Date == "2/2/2007"
target_data <- household_data[inds,]
head(target_data)
tail(target_data)
rm(household_data)

dates <- strptime(paste(target_data$Date,target_data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 3
temp1 <- as.numeric(matrix(target_data$Sub_metering_1))
temp2 <- as.numeric(matrix(target_data$Sub_metering_2))
temp3 <- as.numeric(matrix(target_data$Sub_metering_3))
name1 <- "Sub_metering_1"
name2 <- "Sub_metering_2"
name3 <- "Sub_metering_3"

plot(dates, temp1, ylab = "Energy sub metering", type = "n")
points(dates, temp1, ylab = "Energy sub metering", type = "l", col = "green")
points(dates, temp2, ylab = "Energy sub metering", type = "l", col = "red")
points(dates, temp3, ylab = "Energy sub metering", type = "l", col = "blue")
legend("topright", legend = c(name1, name2, name3), 
       col = c("green", "blue", "red"),
       lty = c(1,1,1))

# Save plot
dev.copy(png, file = "plot3.png")
dev.off()
