library(dplyr)
library(lubridate)
#read the data frame
epc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
#keep only rows with the right date and add a column Datetime combining the date and time using 
#the dmy_hms function from the lubridate package
epc <- epc %>%
    filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
    mutate(Datetime=dmy_hms(paste(Date, Time)))

png(filename="plot4.png",width=480,height=480)
#set the graphics device to use a 2 by 2 grid
par(mfrow=c(2,2))
#plot 4.1 (=same as plot 2, except for y-axis label)
with(epc,plot(Global_active_power ~ Datetime,type="l", ylab="Global Active Power",xlab=""))
#plot 4.2
with(epc,plot(Voltage ~ Datetime, type="l", xlab="datetime",ylab="Voltage"))
#plot 4.3 (=same as plot 3, except for border around legend)
with(epc,plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy sub metering",xlab=""))
with(epc,lines(Sub_metering_2 ~ Datetime, col="red"))
with(epc,lines(Sub_metering_3 ~ Datetime, col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
#plot 4.4
with(epc,plot(Global_reactive_power ~ Datetime,type="l",xlab="datetime"))
dev.off()