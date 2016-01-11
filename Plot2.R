hhdConsumption <- read.table("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
head(hhdConsumption)
hhdCon <- hhdConsumption[ as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-02",]
rm(hhdConsumption)
summary(hhdCon)

### Plot2.png
par(mfrow=c(1,1))
with(hhdCon, plot( Global_active_power, xaxt="n",type = "l", xlab = "", ylab = "Global Active Power (in kilowatts)"))
axis(1, at=c(1,1481,2880), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, file = "plot2.png", width=480, height = 480, units = "px")
dev.off()
