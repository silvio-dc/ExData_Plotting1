Sys.setlocale("LC_TIME", "English")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings="?",stringsAsFactors=FALSE)

data_rel <- data[which(data[,1] %in% c("1/2/2007","2/2/2007")),]
rm(data)

data_rel$dateTime <- strptime(paste(data_rel[,1],data_rel[,2]), "%d/%m/%Y %H:%M:%S")

#plot 1
png(filename="plot1.png", width=480, height=480)
hist(data_rel$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()