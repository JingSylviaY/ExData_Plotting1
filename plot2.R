
#plot2
file<-file("household_power_consumption.txt")
EPC<-read.table(text=grep("^[1,2]/2/2007",readLines(file),value=TRUE), header=T, sep=";", na.strings="?")
names(EPC)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

EPC$Date<-as.Date(EPC$Date, format="%d/%m/%Y")
EPC$Datetime<-as.POSIXct(paste(EPC$Date,EPC$Time))
attach(EPC)
plot(Datetime, Global_active_power, xlab="", ylab="Global_active_power(kilowatts)",type="l")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
