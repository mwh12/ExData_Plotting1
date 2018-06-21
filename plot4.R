 powertable<-read.table("household_power_consumption.txt",skip=1,sep=";")
 names(powertable) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  powertable2 <- subset(powertable,powertable$Date %in% c("1/2/2007" ,"2/2/2007"))
   powertable2$Date<-as.Date(powertable2$Date , format="%d/%m/%Y")
datetime <- paste( powertable2$Date,powertable2$Time)
powertable2$Datetime <- as.POSIXct(datetime)

 par(mfrow=c(2,2))
 with(powertable2,plot(Datetime,as.numeric(as.character(Global_active_power)),type="l",  ylab="Global Active Power",xlab=""))
plot(powertable2$Datetime,as.numeric(as.character(powertable2$Voltage)),type="l",  ylab="Voltage",xlab="datetime")
 with(powertable2,plot(Datetime,as.numeric(as.character(Sub_metering_1)),type="l", xlab="",ylab="Energy Sub metering"))
lines(powertable2$Datetime,as.numeric(as.character(powertable2$Sub_metering_2)),col="Red")
lines(powertable2$Datetime,as.numeric(as.character(powertable2$Sub_metering_3)),col="Blue")
legend("topright",lty=1,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(powertable2$Datetime,as.numeric(as.character(powertable2$Global_reactive_power)),type="l",  ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png",width=480,height=480)
 dev.off
