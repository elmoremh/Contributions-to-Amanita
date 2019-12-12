#!/bin/bash

#SBATCH -n 1
#SBATCH -t 500
#SBATCH -p general
#SBATCH --mem=12000

tblastn -db ~/BLAST/Abrun_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/A_locus_query_AAseqs.fasta -evalue 10E-5 -culling_limit 5 -out Abrun_A-locus_BLAST_results
tblastn -db ~/BLAST/Ainop_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/A_locus_query_AAseqs.fasta -evalue 10E-5 -culling_limit 5 -out Ainop_A-locus_BLAST_results
tblastn -db ~/BLAST/Ajack_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/A_locus_query_AAseqs.fasta -evalue 10E-5 -culling_limit 5 -out Ajack_A-locus_BLAST_results
tblastn -db ~/BLAST/Amusc_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/A_locus_query_AAseqs.fasta -evalue 10E-5 -culling_limit 5 -out Amusc_A-locus_BLAST_results
tblastn -db ~/BLAST/Apoly_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/A_locus_query_AAseqs.fasta -evalue 10E-5 -culling_limit 5 -out Apoly_A-locus_BLAST_results
tblastn -db ~/BLAST/Athier_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/Analysis/A_locus_query_AAseqs.fasta -evalue 10E-5 -culling_limit 5 -out Athier_A-locus_BLAST_results
