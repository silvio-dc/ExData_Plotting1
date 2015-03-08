Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",stringsAsFactors=FALSE)

data_rel <- data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
rm(data)

data_rel$dateTime <- strptime(paste(data_rel[,1],data_rel[,2]), "%d/%m/%Y %H:%M:%S")

#plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data_rel$dateTime, data_rel$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")
plot(data_rel$dateTime, data_rel$Voltage, type="l",ylab="Voltage", xlab="datetime")
plot(data_rel$dateTime, data_rel$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
lines(data_rel$dateTime, data_rel$Sub_metering_2, col="red")
lines(data_rel$dateTime, data_rel$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"), lty=1)
plot(data_rel$dateTime, data_rel$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")
dev.off()