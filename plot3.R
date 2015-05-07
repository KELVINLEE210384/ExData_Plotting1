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
png("plot3.png", width=480, height=480)

#Plot Global active power against Date and Time
with(SubHousePower, {
     plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
     lines(DateTime, Sub_metering_2, col="red")
     lines(DateTime, Sub_metering_3, col="blue")
     })
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col= c("black", "red", "blue"),
       lty=1, lwd=2.5)

#Device off
dev.off()