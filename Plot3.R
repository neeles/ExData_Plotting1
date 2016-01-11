hhdConsumption <- read.table("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
head(hhdConsumption)
hhdCon <- hhdConsumption[ as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-02",]
rm(hhdConsumption)
summary(hhdCon)


### Plot3.png
par(mfrow=c(1,1))
with(hhdCon, plot( Sub_metering_1, xaxt="n",type = "l", xlab = "", ylab = "Energy Sub metering"))
with(hhdCon, points( Sub_metering_2, col="red", xaxt="n",type = "l", xlab = "", ylab = "Global Active Power (in kilowatts)"))
with(hhdCon, points( Sub_metering_3, col="blue", xaxt="n",type = "l", xlab = "", ylab = "Global Active Power (in kilowatts)"))
axis(1, at=c(1,1481,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", col = c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", width=480, height = 480, units = "px")
dev.off()
