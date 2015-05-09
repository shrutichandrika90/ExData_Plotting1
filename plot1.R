file<-"C:\\Users\\SHRUTI\\Desktop\\household_power_consumption.txt"
mydata<-read.csv(file,sep=";",na.strings="?")
mydata[,1]<-as.Date(mydata[,1],"%d/%m/%Y")
mydate<-as.Date(c("01/02/2007","02/02/2007"),"%d/%m/%Y")
subset<-mydata[which(mydata[,"Date"]%in% mydate ),] # subset of data with required dates

#Plotting the required graph, Global Active Power Histogram
png("plot1.png",width=480,height=480)
hist(subset$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylim=c(0,1200))
dev.off()