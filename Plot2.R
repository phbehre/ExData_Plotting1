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

# create png with plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
