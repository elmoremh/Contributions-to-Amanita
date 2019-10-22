#!/bin/bash   
#SBATCH -n 8 # Number of cores requested 
#SBATCH -t 200 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16000 
#SBATCH -e trimmomatic_1-21-15.err # Standard err goes to this filehostname

module load centos6/Trimmomatic-0.32

java -jar $TRIMMOMATIC/trimmomatic-0.32.jar PE -threads 8 -phred33 -trimlog trimlog_1-22-15 ./LIB009729_GEN00023944_NoIndex_L001_R1.fastq ./LIB009729_GEN00023944_NoIndex_L001_R2.fastq LIB009729_GEN00023944_NoIndex_L001.forward_paired.trimmed.fq LIB009729_GEN00023944_NoIndex_L001.forward_unpaired.trimmed.fq LIB009729_GEN00023944_NoIndex_L001.reverse_paired.trimmed.fq LIB009729_GEN00023944_NoIndex_L001.reverse_unpairedtrimmed.fq ILLUMINACLIP:$TRIMMOMATIC/adapters/TruSeq3-SE.fa:2:30:10 LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50