Plot1<- function( ){
## Read the data file
## Make sure the data file is in the same directory as Plot1.R
datafile<- "./household_power_consumption.txt"
data<- read.table(datafile, sep=";", header=T, na.strings = "?")

## Subseting the data
selectdata<- data[(data$Date=="1/2/2007"|data$Date=="2/2/2007"), ]

## Making the plot
hist(selectdata$Global_active_power, main = "Global Active Power", 
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)", 
     col = "red", breaks = 13, ylim = c(0,1200), xlim = c(0, 6), 
     xaxp = c(0, 6, 3), yaxp = c(0, 1200, 6))

## Save it to Plot1.png
dev.copy(png, 'Plot1.png', width=480, height=480, units="px")
dev.off()
}
