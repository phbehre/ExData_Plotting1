#load the file data

sourceData <- "~/data/household_power_consumption.txt"
data <- read.table(sourceData, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the data to the timeframe in context
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# review data set
str(subData)

# set Global_Active_Power as numeric
globalActivePower <- as.numeric(subData$Global_active_power)

# create png file with plot
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
