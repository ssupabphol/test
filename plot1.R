library(dplyr)

df = read.csv("household_power_consumption.txt",
              header = TRUE, sep = ";")
df1 = df %>%
  filter((Date == "1/2/2007") | (Date == "2/2/2007"))

gap = as.numeric(df1$Global_active_power)
hist(gap,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     )

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
