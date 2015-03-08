#Title: Plot 1
#Author: KJ
#Input: Electricity Data
#Output: Plot 1

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
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white", res = NA, family = "", restoreConsole = TRUE,
    type = c("windows", "cairo", "cairo-png"))
hist(y3$Global_active_power,freq = TRUE,ylim=c(0,1250),axes=TRUE,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
