###read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?", skip=50000, nrows=50000, colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$Time <- paste(data$Date, data$Time)
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 
subset_data <- data[which(data$Date=="2007-02-1" | data$Date =="2007-02-02"),]
rownames( subset_data ) <- seq_len( nrow( subset_data ) )

###create plot into PNG graphic device
png(filename = "plot3.png", width = 480, height = 480)

par(mfcol = c(1,1), ps=12, mar=c(4,5,3,1))

plot(x = subset_data$Time, y= subset_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

lines(subset_data$Time,subset_data$Sub_metering_1,col="black",lwd=1)
lines(subset_data$Time,subset_data$Sub_metering_2,col="red",lwd=1)
lines(subset_data$Time,subset_data$Sub_metering_3,col="blue",lwd=1)

plot_text <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
plot_colors <- c("black", "red", "blue")

legend("topright", legend = plot_text, lty=c(1,1), lwd=c(2.5,2.5), col=plot_colors)

dev.off()