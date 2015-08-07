dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
	colClasses=c("character","character","numeric","numeric","numeric",
	"numeric","numeric","numeric","numeric"),na.strings="?")
dataset$date <- as.Date(dataset$Date,format="%d/%m/%Y")
subdata <- subset(dataset, date >= "2007-02-01" & date <= "2007-02-02")
subdata$datetime <-strptime(paste(subdata$Date,subdata$Time,sep="-"),
	     format="%d/%m/%Y-%H:%M:%S")

png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(subdata,plot(datetime,Global_active_power,pch=".",type="n",xlab="",
	ylab="Global Active Power"))
with(subdata,lines(datetime,Global_active_power))

with(subdata,plot(datetime,Voltage,pch=".",type="n"))
with(subdata,lines(datetime,Voltage))

with(subdata,plot(datetime,Sub_metering_1,pch=".",type="n",xlab="",
	ylab="Energy sub metering"))
with(subdata,lines(datetime,Sub_metering_1))
with(subdata,lines(datetime,Sub_metering_2,col="red"))
with(subdata,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),
	legend = names(dataset)[7:9],box.lty=0)

with(subdata,plot(datetime,Global_reactive_power,pch=".",type="n"))
with(subdata,lines(datetime,Global_reactive_power))
dev.off()