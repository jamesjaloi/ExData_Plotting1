plot3 <- function() {
  ## Read all data
  dat <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
  ## Subset based on two days
  subdat <- dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007', ]
  
  dates <- as.Date(subdat$Date, format="%d/%m/%Y")
  times <- subdat$Time
  dt <- as.POSIXct(paste(dates, times))
  sm1 <- subdat$Sub_metering_1
  sm2 <- subdat$Sub_metering_2
  sm3 <- subdat$Sub_metering_3
  
  ## Open peng device
  png(file="plot3.png", width=480, height=480)
  
  plot(dt,sm1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(dt,sm2, col="red")
  lines(dt,sm3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         col=c("black","red","blue"), lty=c(1,1,1))
  
  ## Close png device
  dev.off()
}