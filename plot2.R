df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

df2$DateTime <- as.POSIXct(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S") 

png(file = "plot2.png")

with(df2, plot(DateTime, as.numeric(Global_active_power), 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA))

dev.off()