colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
twoDayHouseHoldData <- read.table("household_power_consumption.txt",header=TRUE,sep=";",skip=66636,
                                  nrows=2880,col.names=colNames,na.string="?")
dateTime <- strptime(paste(twoDayHouseHoldData$Date, twoDayHouseHoldData$Time), 
                      "%d/%m/%Y %H:%M:%S")

activePowerData <- twoDayHouseHoldData$Global_active_power
plot(dateTime,activePowerData,type="l",ylab="Global Active Power (kilowatts)",
     xlab="")