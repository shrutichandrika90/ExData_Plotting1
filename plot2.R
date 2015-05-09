file<-"C:\\Users\\SHRUTI\\Desktop\\household_power_consumption.txt"
library(sqldf)
mydata<-read.csv(file,sep=";",na.strings="?")
mydata[,1]<-as.Date(mydata[,1],"%d/%m/%Y")
mydate<-as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")

# Creating subset
subset<-mydata[which(mydata[,"Date"]%in% mydate ),] 

#Creating required date and time values for x axis
tog<-paste(subset$Date,subset$Time) 
acttime<-strptime(tog,format="%Y-%m-%d %H:%M:%S")
#Plotting Global Active Power vs datetime
png("plot2.png",width=480,height=480)
plot(acttime,subset$Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",xlab="")
dev.off()