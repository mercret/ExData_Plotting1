library(dplyr)
library(lubridate)
#read the data frame
epc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
#keep only rows with the right date and add a column Datetime combining the date and time using 
#the dmy_hms function from the lubridate package
epc <- epc %>%
    filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
    mutate(Datetime=dmy_hms(paste(Date, Time)))

png(filename="plot2.png",width=480,height=480)
with(epc,plot(Global_active_power ~ Datetime,type="l", ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()