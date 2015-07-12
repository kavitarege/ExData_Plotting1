# reading data and fetching data between 2007-02-01 and 2007-02-02
dat <- read.csv2("household_power_consumption.txt",sep=";")
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dataToUse <- dat[dat$Date >= "2007-02-01" & dat$Date <= "2007-02-02", ]
dataToUse$Time <- paste(dataToUse$Date, dataToUse$Time, sep=" ")
dataToUse$Time <- strptime(dataToUse$Time, "%Y-%m-%d %H:%M:%S")
head(dataToUse)
png("plot1.png", width = 480, height = 480)
dev.copy(png, file = "plot1.png")
hist(as.numeric(dataToUse$Global_active_power), main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off()