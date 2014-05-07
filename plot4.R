## read the data from the file and subset on dates 1/2/2007 and 2/2/2007
power_data <- read.table('data/household_power_consumption.txt', 
                         header=TRUE, sep =';')
power_data2 <- power_data[power_data$Date == "1/2/2007" | 
                              power_data$Date == "2/2/2007",]

## merge the date and time into date_time
date_time <- paste(power_data2$Date, power_data2$Time)
date_time <- strptime(date_time, '%d/%m/%Y %H:%M:%OS')

## plot four graphs with respect to time.
## Global Active Power
## Sub_metering_1, Sub_metering_2, Sub_metering_3
## Voltage
## Global_reactive_power
png(file='plot4.png')
par(mfcol=c(2, 2))
with(power_data2, {
    plot(date_time, global_active_power, type='l', xlab='', 
         ylab='Global Active Power')
    plot(date_time, as.numeric(as.character(Sub_metering_1)),
         type='l', xlab='', ylab='Energy sub metering')
    lines(date_time, as.numeric(as.character(Sub_metering_2)), col='red')
    lines(date_time, as.numeric(as.character(Sub_metering_3)), col='blue')
    legend('topright', lty=1, col=c('black', 'red', 'blue'), 
           legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
           bty='n')
    plot(date_time, Voltage, type='l', xlab='datetime')
    plot(date_time, Global_reactive_power, type='l', xlab='datetime')
})

dev.off()