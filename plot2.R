## First need to load the data. 
if(!file.exists("./data")){dir.create("./data")}

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="./data/Power.zip")

# Get the names of the files in the zipped data folder
fileName <- unzip("./data/Power.zip")

library(lubridate)

# Store the data we want
power <- read.table(fileName, header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Selecting the Dates We Want
power$FullDate <- dmy_hms(paste(power$Date, power$Time))
power <- power[(power$FullDate >= ymd("2007-02-01")&power$FullDate < ymd("2007-02-03")),]

# Initiate File
png(file = "plot2.png", width = 480, height = 480, units = "px")

# Plot the data
with(power, plot(as.numeric(Global_active_power)~FullDate, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)"))

# Close the file
dev.off()
