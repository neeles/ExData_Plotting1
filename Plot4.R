hhdConsumption <- read.table("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
head(hhdConsumption)
hhdCon <- hhdConsumption[ as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-02",]
rm(hhdConsumption)
summary(hhdCon)


### Plot4.png

par(mfrow = c(2,2), mar = c(4,3.9,0.2,0.4)+.1)
with(hhdCon, plot( Global_active_power, xaxt="n",type = "l", xlab= "", ylab=""))
axis(1, at=c(1,1481,2880), labels = c("Thu", "Fri", "Sat"), cex.lab=.75)
title(xlab = "", ylab = "Global Active Power", cex.lab=.75)

with(hhdCon, plot( Voltage, xaxt="n",type = "l", xlab="", ylab=""))
axis(1, at=c(1,1481,2880), labels = c("Thu", "Fri", "Sat"))
title(xlab = "datetime", ylab = "Voltage", cex.lab=.75)

with(hhdCon, plot( Sub_metering_1, xaxt="n",type = "l", xlab="", ylab = ""))
with(hhdCon, points( Sub_metering_2, col="red", xaxt="n",type = "l", xlab = "", ylab = ""))
with(hhdCon, points( Sub_metering_3, col="blue", xaxt="n",type = "l", xlab = "", ylab =""))
axis(1, at=c(1,1481,2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", col = c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), cex=.75)
title(xlab = "", ylab = "Energy Sub metering", cex.lab=.75)

with(hhdCon, plot( Global_reactive_power, xaxt="n",type = "l", xlab = "", ylab = ""))
axis(1, at=c(1,1481,2880), labels = c("Thu", "Fri", "Sat"))
title(xlab = "datetime", ylab = "Global_reactive_power", cex.lab=.75)

dev.copy(png, file = "plot4.png", width=480, height = 480, units = "px")
dev.off()
