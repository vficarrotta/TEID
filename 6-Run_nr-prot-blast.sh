#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --job-name=blast_nr
#SBATCH --error=%j_blast_nr_err
#SBATCH --output=blast_nr_output
#SBATCH --partition=bac0071_amd
#SBATCH -n1 # number of cores
#SBATCH -N1
#SBATCH --mail-type=ALL              # will send email for begin,end,fail
#SBATCH --mail-user=vzf0010@auburn.edu

### https://www.ncbi.nlm.nih.gov/books/NBK569850/

### Load blast module
module load blast/2.12.0

### blast across three reading frames
blastp -query zerene_db-families_200_0frame-prot.fasta -db nr

blastp -query zerene_db-families_200_1frame-prot.fasta -db nr

blastp -query zerene_db-families_200_2frame-prot.fasta -db nr

