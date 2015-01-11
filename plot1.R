##########################
##########################
##########################


# read text file and quick check

household_power_consumption <- read.csv("~/Documents/Anna/SysMic/Coursera/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

dim(mydata)
head(mydata)

# connect date with time
household_power_consumption$DateTime <- paste(household_power_consumption$Date, household_power_consumption$Time)
## read in date/time info in format 'd/m/y hr:min:sec'
household_power_consumption$DateTime  <- strptime(household_power_consumption$DateTime, "%d/%m/%Y %H:%M:%S" )

# convert date variable from factor to date format:
household_power_consumption$Date <- as.Date (household_power_consumption$Date, "%d/%m/%Y")

# subset the data for the dates 2007-02-01 and 2007-02-02
subsetData3 <- subset(household_power_consumption, household_power_consumption$Date == "2007-02-01" | household_power_consumption$Date == "2007-02-02")

# Histogram
hist(subsetData3$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

# png file for histogram"
png(filename = "~/Documents/Anna/SysMic/Coursera/plot1.png", width=480, height=480, units="px")
hist(subsetData3$Global_active_power,col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()



