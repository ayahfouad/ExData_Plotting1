plot3 <- function(){
     
     exdata <- read.table("C:/Users/Magic/Documents/new_repo/ExData_Plotting1/household_power_consumption.txt",header = FALSE ,sep = ";",skip= 66637 ,nrows = 2880,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
     
     
     exdata$Date <- paste(exdata$Date,exdata$Time,sep = " ")
     as.POSIXlt(strptime(exdata$Date, format= "%d/%m/%Y %H:%M:%S"))  
     exdata$Date <- as.POSIXlt(strptime(exdata$Date, format= "%d/%m/%Y %H:%M"))
     
     Sys.setlocale(category = "LC_TIME",locale = "English")
     par(mfrow=c(1,1))
     
     
     plot(exdata$Date,exdata$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = " ")
     plot(exdata$Date,exdata$Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = " ")
     lines(exdata$Date,exdata$Sub_metering_1,type = "l",col="black")
     lines(exdata$Date,exdata$Sub_metering_2,type = "l",col="red")
     lines(exdata$Date,exdata$Sub_metering_3,type = "l",col="blue")
     
     legend("topright",lty = 1,
            col = c("black","red","blue"),
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
     
     dev.copy(png, file= "plot3.png",width = 480, height = 480)
     dev.off()
     
     
}