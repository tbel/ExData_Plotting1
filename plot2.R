source("readData.R")

png("plot2.png")
par(mfrow=c(1,1))
plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
