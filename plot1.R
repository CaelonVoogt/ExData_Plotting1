## Load the data set from the txt file 
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data$Date <- as.Date(data$Date, format="%d/%m/%Y") 

## Subet the data to include only the required date range 
data2 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(data)

## Converting dates 
datetime <- paste(as.Date(data2$Date), data2$Time) 
data2$Datetime <- as.POSIXct(datetime) 

## Create the Plot 
hist(data2$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", col="Red") 

## Export the Plot to PNG file
dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off()