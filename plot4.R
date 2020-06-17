library(dplyr)

df = read.csv("household_power_consumption.txt",
              header = TRUE, sep = ";")
df1 = df %>%
  filter((Date == "1/2/2007") | (Date == "2/2/2007"))

date_time = strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap = as.numeric(df1$Global_active_power)
volt = as.numeric(df1$Voltage)
sub1 = as.numeric(df1$Sub_metering_1)
sub2 = as.numeric(df1$Sub_metering_2)
sub3 = as.numeric(df1$Sub_metering_3)
grp = as.numeric(df1$Global_reactive_power)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

## plot1
plot(date_time, gap,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

## plot2
plot(date_time, volt,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

## plot3
plot(date_time, sub1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(date_time, sub2, type = "l", col = "red")
lines(date_time, sub3, type = "l", col = "blue")
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot4
plot(date_time, grp,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
