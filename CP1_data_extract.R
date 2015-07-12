# This is a script to extract two days of the power data from UC Irvine's
# machine learning repository, and outputs it as a .csv file

power_data_url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
local_archive <- './data/household_power_consumption.zip'
local_data <- './data/household_power_consumption.txt'
twoday_file <- './data/household_power_twoday_consumption.csv'

start_date <- '2007-02-01'
end_date <- '2007-02-02'


if (!file.exists('data')) {
    dir.create('data')
}

# method = 'curl' on OSX or Ubuntu/Linux
if (!file.exists(local_archive)) {
    download.file(power_data_url,
                 local_archive,
                method='curl')
    sink('./data/download_date.txt', append=FALSE, split=FALSE)
    print(date())
    sink()
}

unzip(local_archive, overwrite = TRUE, junkpaths = FALSE, exdir = "./data/")

# Extract two days of data
full_data <- read.table(local_data, sep=';',
                        na.strings='?',
                        header=TRUE,
                        quote='')

full_data$Date <- as.Date(full_data$Date,'%d/%m/%Y')

twoday_data <- subset(full_data, (as.Date(start_date) <= Date) &
                                 (Date<=as.Date(end_date)))


write.csv(twoday_data, twoday_file, na='?', row.names=FALSE)
