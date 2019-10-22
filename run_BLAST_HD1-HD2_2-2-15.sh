#!/bin/bash   

#SBATCH -n 1
#SBATCH -t 500
#SBATCH -p general
#SBATCH --mem=12000
#SBATCH -o blast_HD1-HD2_2-2-15.out # Standard out goes to this file 
#SBATCH -e blast_HD1-HD2_2-2-15.err # Standard err goes to this filehostname  

#A. phalloides, protein query on genomic database (blastx)
blastx -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Aphal_genome_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Aphal_HD1-HD2_BLAST_results

#A. brunnescens, A. inopinata, A. muscaria, A. polypyramis, A. thiersii, and V. volvacea, protein query on protein database (blastp)
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Abrun_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Abrun_HD1-HD2_blastp_results
 
blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Ainop_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Ainop_HD1-HD2_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Amusc_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Amusc_HD1-HD2_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Apoly_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Apoly_HD1-HD2_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Athier_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Athier_HD1-HD2_blastp_results

blastp -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Vvolv_proteins_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Vvolv_HD1-HD2_blastp_results

#A. brunnescens, A. inopinata, A. muscaria, A. polypyramis, A. thiersii, and V. volvacea, protein query on transcript database (tblastn)
tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Abrun_transcripts_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Abrun_HD1-HD2_blastx_results
 
tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Ainop_transcripts_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Ainop_HD1-HD2_blastx_results

tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Amusc_transcipts_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Amusc_HD1-HD2_blastx_results

tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Apoly_transcripts_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Apoly_HD1-HD2_blastx_results

tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Athier_transcripts_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Athier_HD1-HD2_blastx_results

tblastn -db /n/home15/elmoremh/UiO/A_locus/BLAST/databases/Vvolv_transcripts_db -outfmt '6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore length qseq sseq' -query /n/home15/elmoremh/UiO/A_locus/BLAST/Amusc_HD1-HD2.fasta -evalue 10E-5 -culling_limit 5 -out Vvolv_HD1-HD2_blastx_results