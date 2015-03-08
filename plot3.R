# This file expects that you downloaded the data from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and extracted it and set the working directory to the folder containing the "household_power_consumption.txt"-file.
Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",stringsAsFactors=FALSE)

data_rel <- data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
rm(data)

data_rel$dateTime <- strptime(paste(data_rel[,1],data_rel[,2]), "%d/%m/%Y %H:%M:%S")

#plot 3
png(filename="plot3.png", width=480, height=480)
plot(data_rel$dateTime, data_rel$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
lines(data_rel$dateTime, data_rel$Sub_metering_2, col="red")
lines(data_rel$dateTime, data_rel$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
dev.off()
