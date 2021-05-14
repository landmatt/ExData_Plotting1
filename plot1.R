power_url <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.csv", method="curl")
library(readr)
power_use <- read_delim("power.csv", ";", escape_double = FALSE, trim_ws = TRUE)
power_use$Date <- as.Date(power_use$Date, format = "%d / %m / %Y")
power_data <- power_use[power_use$Date >= "2007-02-01" & power_use$Date <= "2007-02-02", ]
Global_Active_Power <- power_data$Global_active_power
hist(Global_Active_Power, main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file= "plot1.png")
dev.off()