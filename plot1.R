## read the data from the file and subset on dates 1/2/2007 and 2/2/2007
power_data <- read.table('data/household_power_consumption.txt', 
                         header=TRUE, sep =';')
power_data2 <- power_data[power_data$Date == "1/2/2007" | 
                              power_data$Date == "2/2/2007",]

## had to double convert or wouldn't get correct decimal values.
global_active_power <- as.numeric(as.character(
    power_data2$Global_active_power))

## plot the histogram and save it to a png file.
png(file='plot1.png')
hist(global_active_power, col='red', main='Gloval Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()