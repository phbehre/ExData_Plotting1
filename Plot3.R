# read source data 
sourceData <- "~/data/household_power_consumption.txt"
data <- read.table(sourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# set time context for the exercise
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# review data set
str(subData)

# convert datetime
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# set Global_Active_Power as numeric
globalActivePower <- as.numeric(subData$Global_active_power)

# convert metering data to numeric
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

# create png with plot
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()