#!/bin/bash   
#SBATCH -n 8 # Number of cores requested 
#SBATCH -t 200 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem-per-cpu=64000 
#SBATCH -o bowtie2_1-20-15.out # Standard out goes to this file 
#SBATCH -e bowtie2_1-20-15.err # Standard err goes to this filehostname

bowtie2 -q -x Abrun -1 /n/home15/elmoremh/For_Anne_Pringle/FC_00952/Sample_LIB009729_GEN00023944/LIB009729_GEN00023944_NoIndex_L001_R1.fastq -2 /n/home15/elmoremh/For_Anne_Pringle/FC_00952/Sample_LIB009729_GEN00023944/LIB009729_GEN00023944_NoIndex_L001_R2.fastq -S Aphal_to_Abrun_bowtie2