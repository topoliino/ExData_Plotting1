##Read only the rows with dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", sep = ";", header=FALSE, skip=66637, nrows=2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Adjust date and time
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
##Make graph
png(filename="plot1.png")
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
