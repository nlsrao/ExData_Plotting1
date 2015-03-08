## Reading the data from the given text file

hpcData <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)

library(lubridate)

## fetching the required data forthe dates 2007-02-01 and 2007-02-02, store into a dataset
reqData <- hpcData[dmy(hpcData$Date) >= dmy("1/2/2007") & dmy(hpcData$Date) <= dmy("2/2/2007"),]

rm(hpcData)

## Opening a new png file plot1.png 

png("plot1.png", width=480, height=480)

## plotting histogram
hist(reqData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red" )
dev.off()