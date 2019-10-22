#!/bin/bash 
#SBATCH -n 8 # Number of cores requested
#SBATCH -N 1 
#SBATCH -t 500 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16000 #memory requested 
#SBATCH -e cegma_SPAdes_1-23-15.err

module load centos6/cegma-2.5

cegma -g scaffolds.trimmed.fasta --max_intron 200 -o cegma_SPAdes_1-23-15 --threads 8

#command that seemed to be working on interactive node:[elmoremh@holy2a18308 SPAdes_1-23-15]$ cegma -g scaffolds.trimmed.fasta --max_intron 200 -o cegma_SPAdes_1-23-15