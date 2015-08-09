# read in the data
dataset <- read.table("household_power_consumption.txt",header=TRUE,sep=";",
	colClasses=c("character","character","numeric","numeric","numeric",
	"numeric","numeric","numeric","numeric"),na.strings="?")

#select the subset of data according to date
dataset$date <- as.Date(dataset$Date,format="%d/%m/%Y")
subdata <- subset(dataset, date >= "2007-02-01" & date <= "2007-02-02")

#create the date time field
subdata$datetime <-strptime(paste(subdata$Date,subdata$Time,sep="-"),
	     format="%d/%m/%Y-%H:%M:%S")

#plot the global active power as a function of date and time
png(file="plot2.png",width=480,height=480)
with(subdata,plot(datetime,Global_active_power,pch=".",type="n",xlab="",
	ylab="Global Active Power (kilowatts)"))
with(subdata,lines(datetime,Global_active_power))
dev.off()