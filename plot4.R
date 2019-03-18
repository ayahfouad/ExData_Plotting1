plot4 <- function(){
     
     exdata <- read.table("C:/Users/Magic/Documents/new_repo/ExData_Plotting1/household_power_consumption.txt",header = FALSE ,sep = ";",skip= 66637 ,nrows = 2880,col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    #=================================== 
     exdata$Date <- paste(exdata$Date,exdata$Time,sep = " ")
     as.POSIXlt(strptime(exdata$Date, format= "%d/%m/%Y %H:%M:%S"))  
     exdata$Date <- as.POSIXlt(strptime(exdata$Date, format= "%d/%m/%Y %H:%M"))
     
     Sys.setlocale(category = "LC_TIME",locale = "English")
     
     #====================================
     par(mfrow=c(2,2),mar= c(4,4,2,2))
     
     with(exdata,{
          plot(Date,Global_active_power,type = "n",ylab = "Global Active Power (kilowatts)",xlab = " ")
          lines(Date,Global_active_power,type = "l")
               }
     
          )
     
     with(exdata,{
          plot(Date,Voltage,type = "n",ylab = "Voltage",xlab = "datetime")
          lines(Date,Voltage,type = "l")
               }
          
          )
     
     
     with(exdata,{
          plot(Date,Sub_metering_1,type = "n",ylab = "Energy sub metering",xlab = " ")
          lines(Date,Sub_metering_1,type = "l",col="black")
          lines(Date,Sub_metering_2,type = "l",col="red")
          lines(Date,Sub_metering_3,type = "l",col="blue")
          
          legend("topright",lty = 1, cex = 0.5,
                 col = c("black","red","blue"),
                 legend = c("Sub_metering_1",
                            "Sub_metering_2",
                            "Sub_metering_3"))  
          
     }
          
          
          )
     
     with(exdata,{
          plot(Date,Global_reactive_power,type = "n",ylab = "Global_reactive_power",xlab = "datetime")
          lines(Date,Global_reactive_power,type = "l")
     }
          
          
          )
     
     
     dev.copy(png, file= "plot4.png",width = 480, height = 480)
     dev.off()
}