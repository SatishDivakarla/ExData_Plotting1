colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
twoDayHouseHoldData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,
                                  nrows=2880,col.names=colNames,na.string="?")
dateTime <- strptime(paste(twoDayHouseHoldData$Date, twoDayHouseHoldData$Time), 
                     "%d/%m/%Y %H:%M:%S")

plot(dateTime,twoDayHouseHoldData$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(dateTime,twoDayHouseHoldData$Sub_metering_2,col="red")
lines(dateTime,twoDayHouseHoldData$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("Black","Red","Blue"),cex=0.6)