 powertable<-read.table("household_power_consumption.txt",skip=1,sep=";")
 names(powertable) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
  powertable2 <- subset(powertable,powertable$Date %in% c("1/2/2007" ,"2/2/2007"))
  hist(as.numeric(as.character( powertable2$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
 dev.copy(png,file="plot1.png",width=480,height=480)
 dev.off
