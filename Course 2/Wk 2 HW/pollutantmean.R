
pollutantmean <- function(specdata, pollutant, id = 1:332){
  data = numeric() ##data is designated as numeric
  for (i in id){
    newRead = read.csv(paste(formatC(i, width = 3, flag = "0"), 
                             ".csv", sep = "")) ##renames csv file to be readable
    ## width must = 3 for this because file is 001.csv with 3 referring 
    ## to 001. Any other number will return an error because it cant read
    ## anything more or less than the three digits
    ### flag = "0" pads the zeros in 001.csv so that they do not disapprear
    
    data = c(data, newRead[[pollutant]]) ## pollutant is a character
    ## of length 1 indicating the name of the pollutant (nitrate or
    ## sulfate) for which the mean is calculated 
  }
  return(mean(data, na.rm = TRUE))
}
pollutantmean("specdata", "sulfate", 1:10)



?formatC
?data
view(newRead)

