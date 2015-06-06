
#Read dataSet.
dat <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subsetting the original dataSet to work only with the factors described below.
x <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]

#Manipulation of date an time to join date and time.
dataTime <- as.POSIXlt(paste(as.Date(x$Date, format="%d/%m/%Y"), x$Time, sep=" "))

#Set gobal parameter to use 4 plots.
par(mfrow = c(2,2))

#plot1
plot(dataTime, x$Global_active_power,ylab = "Global Active Power", xlab = "" ,type = "l")

#plot2 
plot(dataTime, x$Voltage,ylab = "Voltage" ,type = "l")

#plot3
plot(dataTime, x$Sub_metering_1,ylab = "Energy sub metering", xlab = "" ,type = "n")
lines(dataTime, x$Sub_metering_1, col="black")
lines(dataTime, x$Sub_metering_2, col="red")
lines(dataTime, x$Sub_metering_3, col="blue")
legend("top", cex=0.7 ,bty="n", lty=1, col = c("black", "red", "blue"), legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

#plot4
plot(dataTime, x$Global_reactive_power,ylab = "Global_reactive_power" ,type = "l")

#copy the screen device to png device.
dev.copy(png, "plot4.png",width = 480, height = 480, units = "px", bg = "white")

#shutdown png device.
dev.off()

#shutdown screen device. 
dev.off()