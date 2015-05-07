#Read data into R as "HousePower"
HousePower <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", stringsAsFactors=FALSE)

#Convert Date from character to date
HousePower$Date <- as.Date(HousePower$Date, format="%d/%m/%Y")

#Subset data between 2007-02-01 to 2007-02-02
SubHousePower <- subset(HousePower, Date >= "2007-02-01" & Date<="2007-02-02")

#Combine Date and Time into one column as numeric
SubHousePower$DateTime <- paste(SubHousePower$Date, SubHousePower$Time)

#Covert the DateTime from character to date and time
SubHousePower$DateTime <- strptime(SubHousePower$DateTime, "%Y-%m-%d %H:%M:%S")

#Open graphic device png
png("plot2.png", width=480, height=480)

#Plot Global Active Power against Date and Time
with(SubHousePower, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

#Device off
dev.off()