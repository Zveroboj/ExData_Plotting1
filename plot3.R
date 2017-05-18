pd <- read.csv("C:/Users/opoli/Documents/Data Science/Course/Exploratory Analysis/household_power_consumption.txt",
               header=T, sep=";", na.strings = "?")


pd$Date <- as.Date(pd$Date, format = "%d/%m/%Y")

pds2 <- subset(pd, Date == "2007-02-01" | Date == "2007-02-02" | Date == "2007-02-03")

pds2$days <- paste(pds2$Date,pds2$Time)
pds2$days <-strptime(pds2$days, format = "%Y-%m-%d %H:%M:%S")


par(mfrow=c(1,1))
with(subset(pds2, days <= "2007-02-03 00:00:00 EST"),     {
     plot(days, as.numeric(Sub_metering_1), 
          type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")

     lines(days, as.numeric(Sub_metering_1))
     lines(days, as.numeric(Sub_metering_2),col="red")
     lines(days, as.numeric(Sub_metering_3), col="blue")
     legend("topright", lty=1, col=c("black", "red", "blue"),
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})



dev.copy(png, file="plot3.png",width = 480, height = 480, units = "px") # copy a plot to a PNG device
dev.off() #close the PNG device
