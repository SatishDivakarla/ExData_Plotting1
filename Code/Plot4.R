colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
twoDayHouseHoldData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,
                                  nrows=2880,col.names=colNames,na.string="?")
dateTime <- strptime(paste(twoDayHouseHoldData$Date, twoDayHouseHoldData$Time), 
                     "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2))

# Plot 1
activePowerData <- twoDayHouseHoldData$Global_active_power
plot(dateTime,activePowerData,type="l",ylab="Global Active Power",
     xlab="")

#Plot 2
plot(dateTime,twoDayHouseHoldData$Voltage,type="l",ylab="Voltage",xlab="datetime")

#Plot3
plot(dateTime,twoDayHouseHoldData$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")
lines(dateTime,twoDayHouseHoldData$Sub_metering_2,col="red")
lines(dateTime,twoDayHouseHoldData$Sub_metering_3,col="blue")
#legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
#       lty= "solid",col=c("Black","Red","Blue"),cex=0.6,bty="n")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty= "solid",col=c("Black","Red","Blue"),cex=0.6,bty="n")

par(font=2)
#Plot4
plot(dateTime,twoDayHouseHoldData$Global_reactive_power,
     ylab="Global_reactive_power",xlab="datetime",type="l")


