## Reading the data from the given text file

hpcData <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)

library(lubridate)

## fetching the required data forthe dates 2007-02-01 and 2007-02-02, store into a dataset
reqData <- hpcData[dmy(hpcData$Date) >= dmy("1/2/2007") & dmy(hpcData$Date) <= dmy("2/2/2007"),]

rm(hpcData)

## concatenate date and time in "%d/%m/%Y %H:%M:%S" format and add as a column in ReqData
reqData$datetime <- dmy_hms(paste(reqData$Date, reqData$Time))

## Opening a new png file plot3.png 

png("plot3.png", width=480, height=480)

## plotting

plot(reqData$datetime,reqData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(reqData$datetime,reqData$Sub_metering_2,col="red")
lines(reqData$datetime,reqData$Sub_metering_3,col="blue")
legend("topright",  col=c("black","red","blue"),lty=1, lwd=2,c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
dev.off()