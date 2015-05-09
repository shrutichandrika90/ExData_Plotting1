file<-"C:\\Users\\SHRUTI\\Desktop\\household_power_consumption.txt"
library(sqldf)
mydata<-read.csv(file,sep=";",na.strings="?")
mydata[,1]<-as.Date(mydata[,1],"%d/%m/%Y")
mydate<-as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
# Creating a subset
subset<-mydata[which(mydata[,"Date"]%in% mydate ),]

#Creating date time values for x axis
tog<-paste(subset$Date,subset$Time)
acttime<-strptime(tog,format="%Y-%m-%d %H:%M:%S")

#Plotting All four graphs at the same time
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(subset,{
  plot(acttime,subset$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",xlab="")  
  plot(acttime,subset$Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(acttime,subset$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(acttime,subset$Sub_metering_2,col= "red")
  lines(acttime,subset$Sub_metering_3,col="blue")
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(acttime,subset$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})  
dev.off()

