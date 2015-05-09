
# --------------------------------------------------------------------------------
# Reading data
# --------------------------------------------------------------------------------
library(lubridate)

read_hpc <- function(){
    if (!"hpc.zip" %in% dir(".")) {
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "hpc.zip")
    }
    
    # for sake of speed can first narrow the dataset using "skip" and "nrows" parameters of read.csv;
    # setting nrows=400000 is enough
    hpc<-read.csv(unz("hpc.zip", "household_power_consumption.txt"), sep=";", na.strings="?")
    hpc<-filter(hpc, Date %in% c("1/2/2007","2/2/2007"))
    hpc<-mutate(hpc, datetime=as.POSIXct(strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")))
    return(hpc)
}

if (!exists("cache")) {
    print("loading hpc")
    cache<-read_hpc()
    hpc<-cache
} else {
    print("use cached hpc")
    hpc<-cache
}

# --------------------------------------------------------------------------------
# Draw
# --------------------------------------------------------------------------------


png("plot4.png")

par(mfrow=c(2,2))

plot(hpc$datetime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#axis(1, at=c(1, nrow(hpc)*c(.5,1)), labels=c("Thu", "Fri", "Sat"))

plot(hpc$datetime, hpc$Voltage, type="l", ylab="Voltage", xlab="datetime")
#axis(1, at=c(1, nrow(hpc)*c(.5,1)), labels=c("Thu", "Fri", "Sat"))

plot(hpc$datetime, hpc$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(hpc$datetime,hpc$Sub_metering_2, col="red")
lines(hpc$datetime,hpc$Sub_metering_3, col="blue")
legend("topright", legend=c(colnames(hpc)[7:9]), lty=1, col=c("black","red","blue"))

plot(hpc$datetime, hpc$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()
