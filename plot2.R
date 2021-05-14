power_url <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.csv", method="curl")
library(readr)
power_use <- read_delim("power.csv", ";", escape_double = FALSE, trim_ws = TRUE)
power_use$Date <- as.Date(power_use$Date, format = "%d / %m / %Y")
power_data <- power_use[power_use$Date >= "2007-02-01" & power_use$Date <= "2007-02-02", ]
Global_Active_Power <- power_data$Global_active_power
power_data$DateTime <- paste(power_data$Date, power_data$Time)
power_data$DateTime <- as.POSIXct(power_data$DateTime)
plot(power_data$DateTime, power_data$Global_active_power, type = "l", xlab = "", ylab = "Global Acive Power (kilowatts)")
dev.copy(png, file= "plot2.png")
dev.off()