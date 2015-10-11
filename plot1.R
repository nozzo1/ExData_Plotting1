# Plot 1
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
# Use hist to plot data the same as the example
hist(householdDateRange$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
# copy screen device to png file
dev.copy(png,file="plot1.png", width=480,height=480)
# close device
dev.off()
# end