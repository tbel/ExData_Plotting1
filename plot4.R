source("readData.R")

png("plot4.png")

par(mfrow=c(2,2))

plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#axis(1, at=c(1, nrow(hpc)*c(.5,1)), labels=c("Thu", "Fri", "Sat"))

plot(hpc$datetime, hpc$Voltage, type="l", ylab="Voltage", xlab="datetime")
#axis(1, at=c(1, nrow(hpc)*c(.5,1)), labels=c("Thu", "Fri", "Sat"))

plot(hpc$datetime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime,hpc$Sub_metering_2, col="red")
lines(hpc$datetime,hpc$Sub_metering_3, col="blue")
legend("topright", legend=c(colnames(hpc)[7:9]), lty=1, col=c("black","red","blue"))

plot(hpc$datetime, hpc$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
