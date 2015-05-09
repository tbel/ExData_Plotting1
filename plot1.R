
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

 png("plot1.png")
par(mfrow=c(1,1))
hist(hpc$Global_active_power, col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
