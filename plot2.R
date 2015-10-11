plot2 <- function()
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
    png(file = "plot2.png")
    with(data, plot(Global_active_power, type = "l", xaxt = "n",
                    xlab = "", ylab = "Global Active Power (kilowatts)"))
    axis(1, at = min_in_day*c(0:2), labels = c("Thu", "Fri", "Sat"))
    dev.off()
    return("Plot successful")
}
