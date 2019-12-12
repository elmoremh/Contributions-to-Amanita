#!/bin/bash

#SBATCH -n 1
#SBATCH -t 500
#SBATCH -p general
#SBATCH --mem=12000

blastn -db ~/BLAST/Abrun_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/Alignments/MIP_query.fasta -evalue 10E-5 -culling_limit 5 -out Abrun_MIP_BLAST_results
blastn -db ~/BLAST/Ainop_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/Alignments/MIP_query.fasta -evalue 10E-5 -culling_limit 5 -out Ainop_MIP_BLAST_results
blastn -db ~/BLAST/Ajack_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/Alignments/MIP_query.fasta -evalue 10E-5 -culling_limit 5 -out Ajack_MIP_BLAST_results
blastn -db ~/BLAST/Amusc_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/Alignments/MIP_query.fasta -evalue 10E-5 -culling_limit 5 -out Amusc_MIP_BLAST_results
blastn -db ~/BLAST/Apoly_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/Alignments/MIP_query.fasta -evalue 10E-5 -culling_limit 5 -out Apoly_MIP_BLAST_results
blastn -db ~/BLAST/Athier_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/Alignments/MIP_query.fasta -evalue 10E-5 -culling_limit 5 -out Athier_MIP_BLAST_results
