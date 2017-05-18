
pd <- read.csv("C:/Users/opoli/Documents/Data Science/Course/Exploratory Analysis/household_power_consumption.txt",
                      header=T, sep=";", na.strings = "?")

head(pd)

pd$Date <- as.Date(pd$Date, format = "%d/%m/%Y")
#pd$Time <-strptime(pd$Time, format = "%H:%M:%S")

pds <- subset(pd, Date == "2007-02-01" | Date == "2007-02-02")
par(mfrow=c(1,1))

with(pds,
      hist(as.numeric(pds$Global_active_power),
      col="red", 
      main= "Global Active Power",
      xlab = "Global Active Power (kilowatts)"))

dev.copy(png, file="plot1.png",width = 480, height = 480, units = "px") # copy a plot to a PNG device
dev.off() #close the PNG device



