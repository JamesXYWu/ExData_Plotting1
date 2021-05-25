pwr_cns <- read.table("./household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")
pwr_cns$Date <- as.Date(pwr_cns$Date,format="%d/%m/%Y")
pwr_usage <- subset(pwr_cns, Date == "2007-02-01" | Date == "2007-02-02")
pwr_usage <- mutate(pwr_usage,DateTime= ymd_hms(paste(Date,Time)) )

library(lubridate)
library(dplyr)

png("plot1.png",width = 480, height = 480)
with(pwr_usage,plot(DateTime, Global_active_power,type = "l",lty=1,xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
