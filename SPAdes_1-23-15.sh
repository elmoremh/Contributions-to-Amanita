#!/bin/bash 
#SBATCH -N 1 # Number of nodes requested
#SBATCH -n 16 # Number of cores requested 
#SBATCH -t 3000 # Runtime in minutes 
#SBATCH -p bigmem # Partition to submit to 
#SBATCH --mem=120000 #memory requested 
#SBATCH -e SPAdes_1-23-15.err # Standard err goes to this filehostname

module load centos6/SPAdes-3.1.1

/n/sw/centos6/SPAdes-3.1.1/bin/spades.py -1 ../abyss_1-23-15/LIB009729_GEN00023944_NoIndex_L001.forward_paired.trimmed.fq -2 ../abyss_1-23-15/LIB009729_GEN00023944_NoIndex_L001.reverse_paired.trimmed.fq --memory 120 -o .

#run from /n/regal/pringle_lab/mhelmore/SPAdes_1-23-15

#command that worked on interactive: [elmoremh@holy2a18304 SPAdes_1-23-15]$ spades.py/n/sw/centos6/SPAdes-3.1.1/bin/spades.py -1 ../abyss_1-23-15/LIB009729_
GEN00023944_NoIndex_L001.forward_paired.trimmed.fq -2 ../abyss_1-23-15/LIB009729_GEN00023944_NoIndex_L001.reverse_paire
d.trimmed.fq -o .