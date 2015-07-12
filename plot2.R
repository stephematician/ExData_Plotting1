local_file <- './data/household_power_twoday_consumption.csv'
png_file <- 'plot2.png'

twoday_data <- read.csv(local_file, na='?',
                        colClasses=c('character','character',rep('numeric',7)))

twoday_data$TStamp <- strptime(sapply(1:nrow(twoday_data),
                                      function(x) {
                                          paste(twoday_data$Date[x],
                                                twoday_data$Time[x])
                                      }),
                               '%Y-%m-%d %H:%M:%S')

png(filename = png_file,
    width = 480, height = 480, units='px',
    bg = 'transparent')

plot(twoday_data$TStamp,
     twoday_data$Global_active_power,
     'l',
     main='',
     ylab='Global Active Power (kilowatts)',
     xlab='')
dev.off()
