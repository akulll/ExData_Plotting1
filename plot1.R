plot1 <- function()
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
    png(file = "plot1.png")
    with(data, hist(Global_active_power, col = "red",
                    main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)"))
    dev.off()
    return("Plot successful")
}
