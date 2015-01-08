df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

df2$DateTime <- as.POSIXct(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S") 

png(file = "plot4.png")

par(mfrow = c(2,2))

with(df2, {
    
    plot(DateTime, as.numeric(Global_active_power), 
         type = "l", ylab = "Global Active Power", xlab = NA)
    
    plot(DateTime, as.numeric(Voltage), type = "l", ylab = "Voltage", xlab = "datetime")
    
    plot(DateTime, as.numeric(Sub_metering_1), col = "black", type = "l", 
         ylab = "Energy sub metering", xlab = NA)
    lines(DateTime, as.numeric(Sub_metering_2), col = "red")
    lines(DateTime, as.numeric(Sub_metering_3), col = "blue")
    legend("topright", bty = "n", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
    
    plot(DateTime, as.numeric(Global_reactive_power), type = "l", 
         ylab = "Global_reactive_power", xlab = "datetime")
    
})

dev.off()