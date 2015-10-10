
#Sys.setlocale("LC_TIME", "English")
data <- read.table("exploratory_data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date,format='%d/%m/%Y')
rel_data <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]


rel_data <- within(rel_data, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })

rel_data$timestamp <- strptime(rel_data$timestamp,format="%d/%m/%Y %H:%M:%S")



#rel_data$Time <- strptime(rel_data$Time,"%H:%M:%S")

rel_data$Global_active_power <- as.numeric(rel_data$Global_active_power)





jpeg("ExData_Plotting1/ExData_Plotting1/plot2.png",width=480,height=480)

plot(rel_data$timestamp,rel_data$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")

dev.off()


rm(list=ls())




