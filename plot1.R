

data <- read.table("exploratory_data/exdata-data-household_power_consumption/household_power_consumption.txt",sep=";",header=T,stringsAsFactors = FALSE)

#save csv version
#write.csv(data,file="ass_1.csv")

data$Date <- as.Date(data$Date,format='%d/%m/%Y')
rel_data <- data[data$Date >= as.Date('2007-02-01') & data$Date <= as.Date('2007-02-02'), ]


rel_data$Time <- strptime(rel_data$Time,"%H:%M:%S")

rel_data$Global_active_power <- as.numeric(rel_data$Global_active_power)


jpeg("ExData_Plotting1/ExData_Plotting1/plot1.png",width=480,height=480)

hist(rel_data$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)",ylim=c(range(0,1200,by=200)))

dev.off()


rm(list=ls())


