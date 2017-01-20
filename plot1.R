library(dplyr)
library(lubridate)
#read the data frame
epc <- read.csv("household_power_consumption.txt",header = TRUE,sep=";",na.strings="?")
#keep only rows with the right date and add a column Datetime combining the date and time using 
#the dmy_hms function from the lubridate package
epc <- epc %>%
    filter(Date=="1/2/2007" | Date=="2/2/2007") %>%
    mutate(Datetime=dmy_hms(paste(Date, Time)))

png(filename="plot1.png",width=480,height=480)
hist(epc$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()