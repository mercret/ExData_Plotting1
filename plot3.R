library(dplyr)
library(lubridate)
#read the data frame
epc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
#keep only rows with the right date and add a column Datetime combining the date and time using 
#the dmy_hms function from the lubridate package
epc <- epc %>%
    filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
    mutate(Datetime=dmy_hms(paste(Date, Time)))

png(filename="plot3.png",width=480,height=480)
with(epc,plot(Sub_metering_1 ~ Datetime, type="l", ylab="Energy sub metering",xlab=""))
with(epc,lines(Sub_metering_2 ~ Datetime, col="red"))
with(epc,lines(Sub_metering_3 ~ Datetime, col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()