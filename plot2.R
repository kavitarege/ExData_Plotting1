# reading data and fetching data between 2007-02-01 and 2007-02-02

dat <- read.csv2("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dataToUse <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02", ]
dataToUse$Time <- paste(dataToUse$Date, dataToUse$Time, sep=" ")
dataToUse$Time <- strptime(dataToUse$Time, "%Y-%m-%d %H:%M:%S")
head(dataToUse)
png("plot2.png", width = 480, height = 480)
#plotting household global minute-averaged active power (in kilowatt) 
dev.copy(png, file = "plot2.png")
plot(dataToUse$Time, as.numeric(dataToUse$Global_active_power), xlab= "Week Days", ylab= "Global Active Power", type = "l", col='red') 
dev.off()