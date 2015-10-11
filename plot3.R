# Plot 3
# For Exploratory Data Analysis Week 1
# Step1 - read the data
householdDataRaw <- read.table("./household_power_consumption.txt"
                               ,header=T
                               ,sep=";"
                               ,na.strings = "?"
                               )
# remove any NA (set to ? in previous statement)
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
plot(householdDateRange$Sub_metering_1~householdDateRange$DateAndTime, type="n" ,xlab="",ylab="Energy Sub metering")
lines(householdDateRange$Sub_metering_1~householdDateRange$DateAndTime, col="black")
lines(householdDateRange$Sub_metering_2~householdDateRange$DateAndTime, col="red")
lines(householdDateRange$Sub_metering_3~householdDateRange$DateAndTime, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.8)
# copy screen device to png file
dev.copy(png,file="plot3.png", width=480,height=480)
# close device
dev.off()
# end