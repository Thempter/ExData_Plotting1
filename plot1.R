
#Read dataSet.
dat <- read.table(file = "../household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Subsetting the original dataSet to work only with the factors described below.
x <- dat[dat$Date %in% c("1/2/2007", "2/2/2007"),]


par(mar= c(4, 4, 2, 1))
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")

#Makes the histogram with the given title an labels using Global_active_power observations.
hist(x$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")


dev.off()