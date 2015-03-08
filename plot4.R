#Title: Plot 4
#Author: KJ
#Input: Electricity Data
#Output: Plot 4

library(dplyr)
path<-"C:/Users/Jarugumilli/Documents/WORK/Coursera/ExploratoryDataAnalysis/CourseProject1"
setwd(path)

#Read Data
y2<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE,colClasses="character")

#Formating the date
y2$Date <- as.Date(y2$Date, "%d/%m/%Y")
#Subsetting dates
y3<-y2[y2$Date %in% as.Date(c('2007-02-02', '2007-02-01')),]
y3$DateTime<-as.POSIXct(paste(y3$Date, y3$Time), format="%Y-%m-%d %H:%M:%S")
y3[,3]=as.numeric(y3[,3])

#Checking Information
head(y2$Date)
class(y2$Date)

y3[,3]=as.numeric(y3[,3])
class(y3$Global_active_power)
names(y3)

#Plot
png(filename = "Plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
#splitting the plot page in 2x2
par(mfrow=c(2,2))
#Plot 1
plot(y3$DateTime,y3$Global_active_power,ylab="Global Active Power",type="l",xlab="")
#Plot 2
plot(y3$DateTime,y3$Voltage,ylab="Voltage",type="l",xlab="datetime")
#Plot 3
plot(y3$DateTime,y3$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(y3$DateTime,y3$Sub_metering_2,type="l",xlab="",col="red")
lines(y3$DateTime,y3$Sub_metering_3,type="l",xlab="",col="blue")
labels<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",labels,col=c("black","red","blue"),lty=c(1,1,1),cex=1,bty="n")

#Plot 4
plot(y3$DateTime,y3$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")

dev.off()
