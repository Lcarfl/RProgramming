complete <- function(directory, id=1:332) {
        ##'directory is a character vector of length 1   
        ## indicating the location of the CSV files
        if(grepl(directory,getwd()) == F){
                setwd(directory)
        }
        MyFiles <- list.files()[id]
        
        nobs<-numeric(0)
        
        for(i in 1:length(id)){
                MyData <- read.csv(file = MyFiles[i])
                nobs <- c(nobs,sum(complete.cases(MyData)))
        }
        
        MyFrame <- data.frame(id=id, nobs=nobs)
        setwd("..")
        print(MyFrame)
        
        ##'id' is an integer vector indicating the monitor
        ## ID numbers to be used
        
        ## Return a data from of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs'
        ## is the number of complete cases
}