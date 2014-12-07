###read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?", skip=50000, nrows=50000, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
subset_data <- data[which(data$Date=="2007-02-1" | data$Date =="2007-02-02"),]
rownames( subset_data ) <- seq_len( nrow( subset_data ) )

###create plot then copy as a PNG file
par(mfcol = c(1,1), ps=12, mar=c(4,5,3,1))

plot(x = subset_data$Time, y= subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, filename = "plot2.png", width = 480, height = 480)
dev.off()