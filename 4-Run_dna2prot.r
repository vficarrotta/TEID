### vficarrotta 2024
### translate amino acids into polypeptide seqs

### library
library('seqinr')
library('phylotools')

### Workding dir
setwd()

### Data
dat <- read.fasta('.fasta')

headers <- dat[,1]

### Special loop for s2c function
# Vector of characters rather than vector of single, long string
s2c_dat <- list()
for(i in 1:length(dat[,2])){
    s2c_dat[[i]] <- s2c(dat[i,2])        
}
names(s2c_dat) <- headers

### translate dna to protein
# This is for the 3 forward reading frmaes
datf0 <- lapply(s2c_dat, FUN=translate, frame=0, ambiguous=T)
datf1 <- lapply(s2c_dat, FUN=translate, frame=1, ambiguous=T)
datf2 <- lapply(s2c_dat, FUN=translate, frame=2, ambiguous=T)

### concatenate the sequences into a single string from a vector of chars
# opposite of s2c function, creates single, long string
datf0 <- lapply(datf0, FUN=paste0, collapse='')
datf1 <- lapply(datf1, FUN=paste0, collapse='')
datf2 <- lapply(datf2, FUN=paste0, collapse='')

### convert list structure to dataframe and add col names
datf0_f <- do.call(rbind.data.frame, datf0); datf0_f <- cbind(headers, datf0_f)
datf1_f <- do.call(rbind.data.frame, datf1); datf1_f <- cbind(headers, datf1_f)
datf2_f <- do.call(rbind.data.frame, datf2); datf2_f <- cbind(headers, datf2_f)

### column names must be as shown for dat2fasta function to work
# modify header row of dataframe. wont convert to fasta file otherwise usign dat2fasta function below
names(datf0_f) <- c('seq.name', 'seq.text')
names(datf1_f) <- c('seq.name', 'seq.text')
names(datf2_f) <- c('seq.name', 'seq.text')

### save as fasta files
dat2fasta(datf0_f, 'C:/Users/Brin/Documents/TEs/zerene_db-families_200_0frame-prot.fasta')
dat2fasta(datf1_f, 'C:/Users/Brin/Documents/TEs/zerene_db-families_200_1frame-prot.fasta')
dat2fasta(datf2_f, 'C:/Users/Brin/Documents/TEs/zerene_db-families_200_2frame-prot.fasta')
