plot2 <- function() {
  ## Read all data
  dat <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
  ## Subset based on two days
  subdat <- dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007', ]
  
  dates <- as.Date(subdat$Date, format="%d/%m/%Y")
  times <- subdat$Time
  dt <- as.POSIXct(paste(dates, times))
  gap <- subdat$Global_active_power
  
  ## Open peng device
  png(file="plot2.png", width=480, height=480)
  
  plot(dt,gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  ## Close png device
  dev.off()
}