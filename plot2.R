## read the data from the file and subset on dates 1/2/2007 and 2/2/2007
power_data <- read.table('data/household_power_consumption.txt', 
                         header=TRUE, sep =';')
power_data2 <- power_data[power_data$Date == "1/2/2007" | 
                              power_data$Date == "2/2/2007",]

## had to double convert or wouldn't get correct decimal values.
global_active_power <- as.numeric(as.character(
    power_data2$Global_active_power))

## merge the date and time into date_time
date_time <- paste(power_data2$Date, power_data2$Time)
date_time <- strptime(date_time, '%d/%m/%Y %H:%M:%OS')

## plot a line graph global active power relative to date and save it to a png
## file.
png(file='plot2.png')
plot(date_time, global_active_power, type='l', xlab='', 
     ylab='Global Active Power (kilowatts)')
dev.off()