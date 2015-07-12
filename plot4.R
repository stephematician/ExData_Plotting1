local_file <- './data/household_power_twoday_consumption.csv'
png_file <- 'plot4.png'

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

par(mfrow = c(2,2)) #, mar=c(4,4,2,2))

with(twoday_data,
     plot(TStamp,
          Global_active_power,
          'l',
          main='',
          ylab='Global Active Power',
          xlab=''))

with(twoday_data,
     plot(TStamp,
          Voltage,
          'l',
          main='',
          ylab='Voltage',
          xlab='datetime'))

with(twoday_data, plot(TStamp, Sub_metering_1, 'n', xlab='', ylab='Energy sub metering'))
with(twoday_data, lines(TStamp, Sub_metering_1, 'l'))
with(twoday_data, lines(TStamp, Sub_metering_2, 'l', col='red'))
with(twoday_data, lines(TStamp, Sub_metering_3, 'l', col='blue'))

legend('topright',
       c('Sub_metering_1',
         'Sub_metering_2',
         'Sub_metering_3'), 
       col=c('black','red','blue'),
       lwd=1,
       bty='n',
       pch=NA)

with(twoday_data,
     plot(TStamp,
          Global_reactive_power,
          'l',
          main='',
          ylab='GLobal_reactive_power',
          xlab='datetime'))

dev.off()

