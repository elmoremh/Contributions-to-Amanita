#!/bin/bash   

#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 500
#SBATCH -p serial_requeue
#SBATCH --mem=12000
#SBATCH -o Abisp_queries_v_others_3-4-15.out 
#SBATCH -e Abisp_queries_v_others_3-4-15.err

#A. phalloides, protein query on genomic database (tblastn)
tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Aphal_genome_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out tblastn_Abisp_v_Aphal

#A. brunnescens, A. inopinata, A. muscaria, A. polypyramis, A. thiersii, and V. volvacea, protein query on protein database (blastp)
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Abrun_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out blastp_Abisp_v_Abrun
 
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Ainop_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out blastp_Abisp_v_Ainop

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Amusc_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out blastp_Abisp_v_Amusc

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Apoly_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out blastp_Abisp_v_Apoly

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Athier_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out blastp_Abisp_v_Athier

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Vvolv_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/toxins/Abisp_queries_AA.fasta -evalue 10E-5 -culling_limit 20 -out blastp_Abisp_v_Vvolv