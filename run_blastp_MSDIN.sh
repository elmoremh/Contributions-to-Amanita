#!/bin/bash   

#SBATCH -n 1
#SBATCH -t 500
#SBATCH -p serial_requeue
#SBATCH --mem=12000
#SBATCH -o blastp_MSDIN_2-5-15.out # Standard out goes to this file 
#SBATCH -e blastp_MSDIN_2-5-15.err # Standard err goes to this filehostname  

module load centos6/ncbi-blast-2.2.29+

#A. brunnescens, A. inopinata, A. muscaria, A. polypyramis, A. thiersii, and V. volvacea, protein query on protein database (blastp)
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Abrun_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Hallens_A-bisporigera_MSDIN.fasta -evalue 10E-5 -culling_limit 20 -out Abrun_MSDIN_blastp_results
 
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Ainop_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Hallens_A-bisporigera_MSDIN.fasta -evalue 10E-5 -culling_limit 20 -out Ainop_MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Amusc_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Hallens_A-bisporigera_MSDIN.fasta -evalue 10E-5 -culling_limit 20 -out Amusc_MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Apoly_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Hallens_A-bisporigera_MSDIN.fasta -evalue 10E-5 -culling_limit 20 -out Apoly_MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Athier_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Hallens_A-bisporigera_MSDIN.fasta -evalue 10E-5 -culling_limit 20 -out Athier_MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Vvolv_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Hallens_A-bisporigera_MSDIN.fasta -evalue 10E-5 -culling_limit 20 -out Vvolv_MSDIN_blastp_results