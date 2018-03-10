#plot1
#unz("exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.txt")
file<-file("household_power_consumption.txt")
EPC<-read.table(text=grep("^[1,2]/2/2007",readLines(file),value=TRUE), header=T, sep=";", na.strings="?")
names(EPC)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hist(EPC$Global_active_power, xlab="Global_active_power(kilowatts)",main="Global_active_power", col=2)
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

