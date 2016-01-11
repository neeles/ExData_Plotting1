hhdConsumption <- read.table("~/Downloads/household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
head(hhdConsumption)
hhdCon <- hhdConsumption[ as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(hhdConsumption$Date, "%d/%m/%Y") == "2007-02-02",]
rm(hhdConsumption)
summary(hhdCon)

###Plot1.png
par(mfrow=c(1,1))
with(hhdCon, hist(Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (in kilowatts)"))
dev.copy(png, file = "plot1.png", width=480, height = 480, units = "px")
dev.off()
