#Read data into R as "HousePower"
HousePower <- read.table(file="./household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?", stringsAsFactors=FALSE)

#Convert Date from character to date
HousePower$Date <- as.Date(HousePower$Date, format="%d/%m/%Y")

#Subset data between 2007-02-01 to 2007-02-02
SubHousePower <- subset(HousePower, Date >= "2007-02-01" & Date<="2007-02-02")

#Open graphic device png
png("plot1.png", width=480, height=480)

#Plot histogram for Global Active Power
hist(SubHousePower$Global_active_power, col="red", main="Global Active Power", xlab= "Global Active Power (kilowatts)")

#Device off
dev.off()
