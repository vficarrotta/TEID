### vficarrotta
### find ORFs of multi fasta
####################################

### Libraries
library('phylotools')
library('ORFhunteR')

### working dir
setwd()

### Data
dat <- loadTrExper('.fasta')
dat1 <- read.fasta('.fasta')

### use ORFhunteR
orf_dat <-lapply(X=dat, FUN=findORFs)

### save output; save conscience 
saveRDS(orf_dat, '.rds')

### Strip the longest ORF sequence per entry
pred_orf <- vector()
for(i in 1:length(orf_dat)){
    hh <- which.max(nchar(orf_dat[[i]][,4]))
    gg <- orf_dat[[i]][hh, 4]
    pred_orf <- rbind(pred_orf, gg)
}

### Set aside sequence headers
headers <- dat1[,1]

### Create final dataframe
orf_final <- cbind(headers, pred_orf)

### Rename header file for dat2fasta function
names(orf_final) <- c('seq.name', 'seq.text')

### Final ORF output to fasta
dat2fasta(orf_final, '.fa')