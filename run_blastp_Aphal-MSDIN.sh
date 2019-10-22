#!/bin/bash   

#SBATCH -n 1
#SBATCH -t 500
#SBATCH -p serial_requeue
#SBATCH --mem=12000
#SBATCH -o blastp_Aphal-MSDIN_2-5-15.out 
#SBATCH -e blastp_Aphal-MSDIN_2-5-15.err

#A. phalloides, protein query on genomic database (tblastn)
tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Aphal_genome_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Aphal_v_Aphal-MSDIN_BLAST_results

#A. brunnescens, A. inopinata, A. muscaria, A. polypyramis, A. thiersii, and V. volvacea, protein query on protein database (blastp)
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Abrun_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Abrun_v_Aphal-MSDIN_blastp_results
 
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Ainop_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Ainop_v_Aphal-MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Amusc_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Amusc_v_Aphal-MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Apoly_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Apoly_v_Aphal-MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Athier_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Athier_v_Aphal-MSDIN_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Vvolv_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/MSDIN_Aphal.fasta -evalue 10E-5 -culling_limit 20 -out Vvolv_v_Aphal-MSDIN_blastp_results