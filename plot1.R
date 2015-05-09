source("readData.R")

png("plot1.png")
par(mfrow=c(1,1))
hist(hpc$Global_active_power, col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
