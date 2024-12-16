#!/bin/bash
#SBATCH --time=7-00:00:00
#SBATCH --job-name=Repmod2
#SBATCH --error=%j_RepMod_err
#SBATCH --output=RepMod2_output
#SBATCH --partition=bac0071_amd
#SBATCH -n20 # number of cores
#SBATCH -N1
#SBATCH --mail-type=ALL              # will send email for begin,end,fail
#SBATCH --mail-user=vzf0010@auburn.edu

module load repeatmodeler/2.0.1

##########
# MAKE DATABASE
# Must build database from genome file then repeatmodeler will use the output files
# Directories are created during database construction.


# BuildDatabase -name phoebis_db GCA_001586405.1_3314_assembly_v1_genomic.fa

##########

# Run repeat modeler
RepeatModeler -engine NCBI -pa 20 -database phoebis_db -LTRStruct

