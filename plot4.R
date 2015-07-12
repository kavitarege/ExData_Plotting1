# reading data and fetching data between 2007-02-01 and 2007-02-02
dat <- read.csv2("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dataToUse <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02", ]
dataToUse$Time <- paste(dataToUse$Date, dataToUse$Time, sep=" ")
dataToUse$Time <- strptime(dataToUse$Time, "%Y-%m-%d %H:%M:%S")

png("plot4.png", width = 480, height = 480)
dev.copy(png, file = "plot4.png")
#plotting 2 graphs in each row
par(mfrow=c(2,2))
#graph 1 Global_active_power(in kilowatt) 
plot(dataToUse$Time, dataToUse$Global_active_power,
     ylab='Global Active Power', xlab='', type='l')
#graph 2 minute-averaged voltage
plot(dataToUse$Time, dataToUse$Voltage,
     xlab='datetime', ylab='Voltage', type='l')

# graph 3 energy sub-metering No. 1/energy sub-metering No. 2/energy sub-metering No. 3 (in watt-hour of active energy)
plot(dataToUse$Time, dataToUse$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(dataToUse$Time, dataToUse$Sub_metering_2, col='red')
lines(dataToUse$Time, dataToUse$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid', bty='n')

# graph 4 household global minute-averaged reactive power (in kilowatt) 
plot(dataToUse$Time, dataToUse$Global_reactive_power,
     xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off()
