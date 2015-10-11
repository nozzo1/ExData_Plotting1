# Plot 4
# For Exploratory Data Analysis Week 1
# Step1 - read the data
householdDataRaw <- read.table("./household_power_consumption.txt"
                               , header=T
                               ,sep=";"
                               ,na.strings = "?"
                               )
# remove any NA
householdData <- na.omit(householdDataRaw)
# Use date range to create the subset
householdDateRange<-subset(householdData,Date=="1/2/2007"|Date=="2/2/2007")
# the next few steps manipulates the date and time and creates a new column called DateAndTime
householdDateRange$Date <- as.Date(householdDateRange$Date
                                   ,format="%d/%m/%Y")
householdDateRange$DateAndTime <- paste(householdDateRange$Date
                           ,householdDateRange$Time)
householdDateRange$DateAndTime <- as.POSIXct(householdDateRange$DateAndTime)
# now plot data the same as the example
# first adjust par to squeeze all 4 plus axis labels in the 480x480 PNG file space.
par(mfcol=c(2,2), mar=c(5,4,1,1), ps=12)
# plot top left
plot(householdDateRange$Global_active_power~householdDateRange$DateAndTime, type="l" ,xlab="",ylab="Global Active Power")
# plot bottom left
plot(householdDateRange$Sub_metering_1~householdDateRange$DateAndTime, type="n" ,xlab="",ylab="Energy Sub metering")
lines(householdDateRange$Sub_metering_1~householdDateRange$DateAndTime, col="black")
lines(householdDateRange$Sub_metering_2~householdDateRange$DateAndTime, col="red")
lines(householdDateRange$Sub_metering_3~householdDateRange$DateAndTime, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
#plot top right
plot(householdDateRange$Voltage~householdDateRange$DateAndTime, type="l" ,xlab="datetime",ylab="Voltage")
#plot botton right
plot(householdDateRange$Global_reactive_power~householdDateRange$DateAndTime, type="l",xlab="datetime")
# copy screen device to png file
dev.copy(png,file="plot4.png", width=480,height=480)
# close device
dev.off()
# end