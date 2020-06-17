library(dplyr)

df = read.csv("household_power_consumption.txt",
              header = TRUE, sep = ";")
df1 = df %>%
  filter((Date == "1/2/2007") | (Date == "2/2/2007"))

date_time = strptime(paste(df1$Date, df1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap = as.numeric(df1$Global_active_power)

png("plot2.png", width=480, height=480)

plot(date_time, gap,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
