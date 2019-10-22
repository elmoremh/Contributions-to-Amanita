#!/bin/bash 
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 3000 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=500 #memory requested 
#SBATCH -e BLAST_contamination_multi-thread.err 

python ~/UiO/scripts/BLAST_contamination_multi-thread.py contamination_screen/