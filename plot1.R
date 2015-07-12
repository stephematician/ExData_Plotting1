# This script uses data extracted from UC Irvine Machine Learning Repo
# see CP1_data_extract.R for details

local_file <- './data/household_power_twoday_consumption.csv'
png_file <- 'plot1.png'

twoday_data <- read.csv(local_file, na='?')

png(filename = png_file,
    width = 480, height = 480, units='px',
    bg = 'transparent')

hist(twoday_data$Global_active_power, 
     col='red',
     breaks=12,
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')
dev.off()
