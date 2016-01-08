plot4 <- function() {
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
  gap <- subdat$Global_active_power
  volt <- subdat$Voltage
  grp <- subdat$Global_reactive_power
  
  ## Open peng device
  png(file="plot4.png", width=480, height=480)
  
  par(mfrow=c(2,2))
  #1
  plot(dt,gap, type = "l", xlab = "", ylab = "Global Active Power")
  
  #2
  plot(dt,volt, type = "l", xlab = "", ylab = "Voltage")
  
  #3
  plot(dt,sm1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(dt,sm2, col="red")
  lines(dt,sm3, col="blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         col=c("black","red","blue"), lty=c(1,1,1))
  
  #4
  plot(dt,grp, type = "l", xlab = "", ylab = "Global_reactive_power")
  
  ## Close png device
  dev.off()
}