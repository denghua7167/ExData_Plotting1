Plot4<- function( ){
  ## Read the data file
  datafile<- "./household_power_consumption.txt"
  data<- read.table(datafile, sep=";", header=T, na.strings = "?")
  
  ## Subseting the data
  selectdata<- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ]
  selectdata$Datetime<- strptime(paste(selectdata$Date, selectdata$Time),
                                 "%d/%m/%Y %H:%M:%S") 
  
  ## Making the plot and save it to Plot4.png
  png(filename="Plot4.png",width=480, height=480, units="px")
  par(mfrow = c(2, 2))
  plot(selectdata$Datetime, selectdata$Global_active_power, 
       ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
  
  plot(selectdata$Datetime, selectdata$Voltage, 
       ylab = "Voltage", xlab = "datetime", type = "l")
  
  with(selectdata, { 
    plot(Datetime, Sub_metering_1, xlab = "",
         ylab = "Global Active Power (kilowatts)", type = "l")
    lines(Datetime, Sub_metering_2, col = 'Red')
    lines(Datetime, Sub_metering_3, col = 'Blue')
  })
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
  plot(selectdata$Datetime, selectdata$Global_reactive_power, 
        ylab = "Global_reactive_power", xlab = "datetime", type = "l")
  
  dev.off()
}