### vficarrotta, 2024
### Drop sequences less than 200bp long

### Packages
library(stringr)
library(phylotools)

###
setwd()

### Data
dat <- read.fasta('.fa')

### Remove small sequences (<200bp)
new <- data.frame()
for(i in 1:length(dat[,2])){
    if(nchar(dat[i,2]) > 200){
        new <- rbind(new, dat[i,]) 
    }
}

### save output as fasta
dat2fasta(new, '.fa')
