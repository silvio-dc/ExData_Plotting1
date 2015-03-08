# This file expects that you downloaded the data from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and extracted it and set the working directory to the folder containing the "household_power_consumption.txt"-file.

Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",stringsAsFactors=FALSE)

data_rel <- data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
rm(data)

data_rel$dateTime <- strptime(paste(data_rel[,1],data_rel[,2]), "%d/%m/%Y %H:%M:%S")

#plot 2
png(filename="plot2.png", width=480, height=480)
plot(data_rel$dateTime, data_rel$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
