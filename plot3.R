
# reading data and fetching data between 2007-02-01 and 2007-02-02dat <- read.csv2("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dataToUse <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02", ]
dataToUse$Time <- paste(dataToUse$Date, dataToUse$Time, sep=" ")
dataToUse$Time <- strptime(dataToUse$Time, "%Y-%m-%d %H:%M:%S")
#PNG file with a width of 480 pixels and a height of 480 pixels
png("plot3.png", width = 480, height = 480)
dev.copy(png, file = "plot3.png")
#plotting energy sub-metering No. 1/energy sub-metering No. 2/energy sub-metering No. 3 (in watt-hour of active energy)
plot(dataToUse$Time, dataToUse$Sub_metering_1, xlab= "", ylab= "Energy sub metering", type = "l", col='black') 
lines(dataToUse$Time,dataToUse$Sub_metering_2, col='red') 
lines(dataToUse$Time,dataToUse$Sub_metering_3, col='blue') 
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')
dev.off()