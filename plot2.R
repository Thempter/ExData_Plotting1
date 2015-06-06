
#Read dataSet.
dat <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subsetting the original dataSet to work only with the factors described below.
x <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

#Manipulation of date an time to join date and time.
dataTime <- as.POSIXlt(paste(as.Date(x$Date, format="%d/%m/%Y"), x$Time, sep=" "))


#Use a png device
par(mar= c(4, 4, 2, 1))
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")


plot(dataTime, x$Global_active_power,ylab = "Global Active Power (kilowatts)", xlab = "" ,type = "l")


dev.off()