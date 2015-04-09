##Read only the rows with dates 2007-02-01 and 2007-02-02
data <- read.table("./household_power_consumption.txt", sep = ";", header=FALSE, skip=66637, nrows=2880)
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Adjust date and time
data$DateTime = paste(data$Date, data$Time)
data$DateTime = strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
##Set weekdays to English
Sys.setlocale(category = "LC_TIME", locale = "C") 
##Make graph
png(filename="plot2.png")
with(data, plot(DateTime, Global_active_power, pch=32, ylab="Global Active Power (kilowatts)", xlab=""))
with(data, lines(DateTime, Global_active_power, lty = 1, ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
