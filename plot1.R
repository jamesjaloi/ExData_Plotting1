plot1 <- function() {
  ## Read all data
  dat <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
  ## Subset based on two days
  subdat <- dat[dat$Date == '1/2/2007' | dat$Date == '2/2/2007', ]
  
  ## Open peng device
  png(file="plot1.png", width=480, height=480)
  
  ## Produce histogram
  hist(as.numeric(subdat$Global_active_power), 
       main="Global Active Power", 
       xlab = "Global Active Power (kilowatts)", 
       col = "red")
  
  ## Close png device
  dev.off()
}