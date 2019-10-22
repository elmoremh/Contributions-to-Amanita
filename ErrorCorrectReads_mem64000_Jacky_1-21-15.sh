#!/bin/bash   
#SBATCH -n 8 # Number of cores requested 
#SBATCH -t 200 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=64000
#SBATCH -o ErrorCorrectReads_1-21-15.out # Standard out goes to this file 
#SBATCH -e ErrorCorrectReads_1-21-15.err # Standard err goes to this filehostname

module load centos6/allpathslg-50081

ErrorCorrectReads.pl PHRED_ENCODING= 33 PAIRED_READS_A_IN= /n/home15/elmoremh/For_Anne_Pringle/FC_00952/Sample_LIB009729_GEN00023944/LIB009729_GEN00023944_NoIndex_L001_R1.fastq PAIRED_READS_B_IN= /n/home15/elmoremh/For_Anne_Pringle/FC_00952/Sample_LIB009729_GEN00023944/LIB009729_GEN00023944_NoIndex_L001_R2.fastq READS_OUT= LIB009729_GEN00023944_NoIndex_L001_corrected_1-21-15.fastq MAX_MEMORY_GB=64 THREADS=8