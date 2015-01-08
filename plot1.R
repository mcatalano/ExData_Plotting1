df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = F)

df2 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

png(file = "plot1.png")

with(df2, hist(as.numeric(Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power"))

dev.off()