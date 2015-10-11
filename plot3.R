plot3 <- function()
{
    #reading data ---------------------------------------------------------------
    input <- "household_power_consumption.txt"
    data <- read.table(input, header = TRUE, sep = ";", skip = 0, nrows = 1)
    datanames <- colnames(data)  #save header from the first line
    
    min_in_day = 24*60
    data <- read.table(input, header = FALSE, sep = ";", skip = 66637, nrows = 2*min_in_day)    
    colnames(data) <- datanames  #apply header to the ready database
    rm(datanames)
    rm(input)
    
    #plotting to png-------------------------------------------------------------
    png(file = "plot3.png")
    with(data, plot(Sub_metering_1, type = "l", col = "black", xaxt = "n",
                    xlab = "", ylab = "Energy sub metering"))
    axis(1, at = min_in_day*c(0:2), labels = c("Thu", "Fri", "Sat"))
    with(data, lines(Sub_metering_2, col = "red"))
    with(data, lines(Sub_metering_3, col = "blue"))
    legend("topright", legend = colnames(data)[7:9], col = c("black", "red", "blue"), pch = 151)
    #pch = 151 corresponds to long dash symbol
    dev.off()
    return("Plot successful")
}
