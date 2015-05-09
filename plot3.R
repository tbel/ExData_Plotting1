source("readData.R")

png("plot3.png")
par(mfrow=c(1,1))
plot(hpc$datetime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime, hpc$Sub_metering_2, col="red")
lines(hpc$datetime, hpc$Sub_metering_3, col="blue")
legend("topright", legend=c(colnames(hpc)[7:9]), lty=1, col=c("black","red","blue"))
dev.off()
