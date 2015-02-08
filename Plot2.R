Plot2<- function( ){
  ## Read the data file
  datafile<- "./household_power_consumption.txt"
  data<- read.table(datafile, sep=";", header=T, na.strings = "?")
  
  ## Subseting the data
  selectdata<- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ]
  selectdata$Datetime<- strptime(paste(selectdata$Date, selectdata$Time),
                                 "%d/%m/%Y %H:%M:%S") 
  
  ## Making the plot and save it to Plot2.png
  png(filename="Plot2.png",width=480, height=480, units="px")
  plot(selectdata$Datetime, selectdata$Global_active_power,
       ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")
  dev.off()
}