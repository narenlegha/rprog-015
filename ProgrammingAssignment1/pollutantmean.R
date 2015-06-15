pollutantmean <- function(directory, pollutant, id = 1:332){
        
        old <- getwd()
        setwd(directory)
        
        all_files <- data.frame()
        for( i in id){
                j <- sprintf("%03d", i)
                infile <- paste(j, ".csv", sep="")
                
                read_file <- read.csv(infile)
                #read_file <- read_file[complete.cases(read_file),]
                #read_file <- read_file[, c(pollutant)]
                #read_file <- read_file[complete.cases(read_file)]
                
                #mean_file <- mean(read_file, na.rm = T)
                #print(mean_file)
                #mean_all <- c(mean_all, mean_file)
                all_files <- rbind(all_files, read_file)
        }
        
        setwd(old)
        all_files <- all_files[,c(pollutant)]
        mean(all_files, na.rm = T)
}
