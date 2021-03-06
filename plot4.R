
#plot4
file<-file("household_power_consumption.txt")
EPC<-read.table(text=grep("^[1,2]/2/2007",readLines(file),value=TRUE), header=T, sep=";", na.strings="?")
names(EPC)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

par(mfrow=c(2,2))
plot(Datetime, Global_active_power, xlab="", ylab="Global_active_power(kilowatts)",type="l")
plot(Datetime,Voltage, type="l")

plot(Sub_metering_1~ Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~ Datetime,col=2)
lines(Sub_metering_3~ Datetime,col="Blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(Datetime,Global_reactive_power, type="l")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

