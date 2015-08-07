dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
	colClasses=c("character","character","numeric","numeric","numeric",
	"numeric","numeric","numeric","numeric"),na.strings="?")
dataset$date <- as.Date(dataset$Date,format="%d/%m/%Y")
subdata <- subset(dataset, date >= "2007-02-01" & date <= "2007-02-02")

png(file="plot1.png",width=480,height=480)
hist(subdata$Global_active_power,col="red",main="Global Active Power",
	xlab="Global Active Power (kilowatts)")
dev.off()