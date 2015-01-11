# plot4.r
# make plot 4 from first course assignment
# 
# CS O'Connell, UMN EEB/IonE


#####################################################################
# plot4.r

## read in data

# csv info
filepath <- "~/Documents/GITHUB/CourseraMaterials/ExData_Plotting1/data/household_power_consumption.txt"

# csv is big - load in faster using colclasses
# This was messing up stringsAsFactors = FALSE
#tab5rows <- read.table(filepath, header = TRUE, nrows = 5, sep=";")
#classes <- sapply(tab5rows, class)

# how many rows to read in? (skip and nrows)
# 69518 - 66637 = 2881, so use 2880
dat <- read.table(filepath, skip=66637, nrows=2880, sep=";", na.strings = "?", stringsAsFactors = FALSE)
#head(dat)
#tail(dat)

## make date and time cols nicer
Dates <- as.Date(dat$V1, format="%d/%m/%Y")
Times <- dat$V2
DateTime <- as.POSIXct(paste(as.character(Dates),as.character(Times)))
dat$DateTime <- DateTime


## make plot4

# where to save
filesave <- "~/Documents/GITHUB/CourseraMaterials/ExData_Plotting1/plot4.png"

# make the fig
png(filename=filesave, width=480, height=480, bg="transparent")   # choose device.. 

# quadrants
par(mfrow=c(2,2))

# global active power
# V3
plot(dat$DateTime, dat$V3, type="n", xlab = "", ylab = "Global Active Power", main= "")
lines(dat$DateTime, dat$V3)

# voltage
# V5
plot(dat$DateTime, dat$V5, type="n", xlab = "datetime", ylab = "Voltage", main= "")
lines(dat$DateTime, dat$V5)

# sub metering
# V7-9
plot(dat$DateTime, dat$V7, type="n", xlab = "", ylab = "Energy Sub Metering", main= "")
lines(dat$DateTime, dat$V7)
lines(dat$DateTime, dat$V8, col="red")
lines(dat$DateTime, dat$V9, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"), bty="n") 

# global reactive pwower
# V4
plot(dat$DateTime, dat$V4, type="n", xlab = "datetime", ylab = "Global_reactive_power", main= "")
lines(dat$DateTime, dat$V4)

# end graphics device
dev.off() 


