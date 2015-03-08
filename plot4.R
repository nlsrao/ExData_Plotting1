## Reading the data from the given text file

hpcData <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)

library(lubridate)

## fetching the required data forthe dates 2007-02-01 and 2007-02-02, store into a dataset
reqData <- hpcData[dmy(hpcData$Date) >= dmy("1/2/2007") & dmy(hpcData$Date) <= dmy("2/2/2007"),]

rm(hpcData)

## concatenate date and time in "%d/%m/%Y %H:%M:%S" format and add as a column in ReqData
reqData$datetime <- dmy_hms(paste(reqData$Date, reqData$Time))

## Opening a new png file plot4.png 

png("plot4.png", width=480, height=480)

## creating plot area to store 4 graphs in 2 rows, 2 in each row
par(mfrow = c(2,2))

with(reqData, { 
        ## plotting graph1 
        plot(datetime,Global_active_power, type="l", ylab="Global Active Power",xlab="")
        ## plotting graph2
        plot(datetime,Voltage,xlab="datetime", ylab="Voltage",type="l")
        ## plotting graph3
        plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
        lines(datetime,Sub_metering_2,col="red")
        lines(datetime,Sub_metering_3,col="blue")
        legend("topright",  col=c("black","red","blue"),lty=1, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
        ## plotting graph4
        plot(datetime,Global_reactive_power,xlab="datetime", ylab="Global_reactive_power",type="l")
})
dev.off()