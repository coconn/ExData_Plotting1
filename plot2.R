# plot2.r
# make plot 2 from first course assignment
# 
# CS O'Connell, UMN EEB/IonE


#####################################################################
# plot2.r

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


## make plot2

# where to save
filesave <- "~/Documents/GITHUB/CourseraMaterials/ExData_Plotting1/plot2.png"

# make the fig
png(filename=filesave, width=480, height=480, bg="transparent")   # choose device.. 
plot(dat$DateTime, dat$V3, type="n", xlab = "", ylab = "Global Active Power (kilowatts)", main= "")
lines(dat$DateTime, dat$V3)
dev.off() 


