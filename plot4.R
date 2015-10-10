    
data <- read.table("exploratory_data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)



data$Date <- as.Date(data$Date,format='%d/%m/%Y')
rel_data <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]

rel_data$Global_active_power <- as.numeric(rel_data$Global_active_power)


rel_data <- within(rel_data, { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })

rel_data$timestamp <- strptime(rel_data$timestamp,format="%d/%m/%Y %H:%M:%S")   


jpeg("ExData_Plotting1/ExData_Plotting1/plot4.png",width=480,height=480)

par(mfcol=c(2,2))
    
    #(1,1)
plot(rel_data$timestamp,rel_data$Global_active_power,type="l",ylab = "Global Active Power",xlab = "")
    #(2,1)
plot(rel_data$timestamp,rel_data$Global_active_power, xlab = "", ylab = "Energy sub metering",ylim=c(0,40),yaxt='n',las=1 ,type="n")
axis(2,at=seq(from=0,to=30,by=10))
    
lines(rel_data$timestamp,rel_data$Sub_metering_1,col="black")
lines(rel_data$timestamp,rel_data$Sub_metering_2,col="red")
lines(rel_data$timestamp,rel_data$Sub_metering_3,col="blue")

legend("topright",lty=1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),bty='n')


#(1,2)
plot(rel_data$timestamp,rel_data$Voltage,type = 'l',xlab="datetime",ylab = "Voltage")
#(2,2)
plot(rel_data$timestamp,rel_data$Global_reactive_power,type = 'l',xlab="datetime",ylab = "Global_reactive_power")

dev.off()

rm(list=ls())