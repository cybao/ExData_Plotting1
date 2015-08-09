#read in the data
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
	colClasses=c("character","character","numeric","numeric","numeric",
	"numeric","numeric","numeric","numeric"),na.strings="?")
#select the subset of data according to the date
dataset$date <- as.Date(dataset$Date,format="%d/%m/%Y")
subdata <- subset(dataset, date >= "2007-02-01" & date <= "2007-02-02")

#create the date time field
subdata$datetime <-strptime(paste(subdata$Date,subdata$Time,sep="-"),
	     format="%d/%m/%Y-%H:%M:%S")

#create the line plots of sub metering
png(file="plot3.png",width=480,height=480)
with(subdata,plot(datetime,Sub_metering_1,pch=".",type="n",xlab="",
	ylab="Energy sub metering"))
with(subdata,lines(datetime,Sub_metering_1))
with(subdata,lines(datetime,Sub_metering_2,col="red"))
with(subdata,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend = names(dataset)[7:9])
dev.off()