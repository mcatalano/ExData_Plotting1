df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

df2$DateTime <- as.POSIXct(paste(df2$Date, df2$Time), format="%d/%m/%Y %H:%M:%S") 

png(file = "plot3.png")

with(df2, {
    
    plot(DateTime, as.numeric(Sub_metering_1), col = "black", type = "l", 
         ylab = "Energy sub metering", xlab = NA)
    lines(DateTime, as.numeric(Sub_metering_2), col = "red")
    lines(DateTime, as.numeric(Sub_metering_3), col = "blue")
    legend("topright", col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
    
})

dev.off()
