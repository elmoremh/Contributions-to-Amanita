#!/bin/bash   
#SBATCH -n 1 # Number of cores requested 
#SBATCH -t 100 # Runtime in minutes 
#SBATCH -p general # Partition to submit to 
#SBATCH --mem=16000 
#SBATCH -o makeblastdb_2-2-15.out # Standard out goes to this file 
#SBATCH -e makeblastdb_2-2-15.err # Standard err goes to this filehostname

module load centos6/ncbi-blast-2.2.29+

#Got all these updated assemblies and gene models from Jacky. All made in maker. 
#A. brunnescens
makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_brunnescens/Abrun_final.assembly.maker.combined.proteins.fa -dbtype prot -title Abrun_proteins_db -parse_seqids -out Abrun_proteins_db.db -logfile Abrun_proteins_db_2-2-15

makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_brunnescens/Abrun_final.assembly.maker.combined.transcripts.fa -dbtype nucl -title Abrun_transcripts_db -parse_seqids -out Abrun_transcripts_db.db -logfile Abrun_transcripts_db_2-2-15

#A. inopinata
makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_inopinata/Ainop_final.assembly.maker.combined.proteins.fa -dbtype prot -title Ainop_proteins_db -parse_seqids -out Ainop_proteins_db.db -logfile Ainop_proteins_2-2-15

makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_inopinata/Ainop_final.assembly.maker.combined.transcripts.fa -dbtype nucl -title Ainop_transcripts_db -parse_seqids -out Ainop_transcripts_db.db -logfile Ainop_transcripts_2-2-15

#A. muscaria
makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_muscaria/Amusc_final.assembly.maker.combined.proteins.fa -dbtype prot -title Amusc_proteins_db -parse_seqids -out Amusc_proteins_db.db -logfile Amusc_proteins_db_2-2-15

makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_muscaria/Amusc_final.assembly.maker.combined.transcripts.fa -dbtype nucl -title Amusc_transcripts_db -parse_seqids -out Amusc_transcripts_db.db -logfile Amusc_transcripts_db_2-2-15

#A. polypyramis
makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_polypyramis/Apoly_final.assembly.maker.combined.proteins.fa -dbtype prot -title Apoly_proteins_db -parse_seqids -out Apoly_proteins_db.db -logfile Apoly_proteins_db_2-2-15

makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_polypyramis/Apoly_final.assembly.maker.combined.transcripts.fa -dbtype nucl -title Apoly_transcripts_db -parse_seqids -out Apoly_transcripts_db.db -logfile Apoly_transcripts_db_2-2-15

#A. thiersii
makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_thiersii/Athier_final.assembly.maker.combined.proteins.fa -dbtype prot -title Athier_proteins_db -parse_seqids -out Athier_proteins_db.db -logfile Athier_proteins_db_2-2-15

makeblastdb -in /n/home15/elmoremh/UiO/seqs/A_thiersii/Athier_final.assembly.maker.combined.transcripts.fa -dbtype nucl -title Athier_transcripts_db -parse_seqids -out Athier_transcripts_db.db -logfile Athier_transcripts_db_2-2-15

#V. volvacea
makeblastdb -in /n/home15/elmoremh/UiO/seqs/V_volvacea/Vvolv_final.assembly.maker.combined.proteins.fa -dbtype prot -title Vvolv_proteins_db -parse_seqids -out Vvolv_proteins_db.db -logfile Vvolv_proteins_db_2-2-15 

makeblastdb -in /n/home15/elmoremh/UiO/seqs/V_volvacea/Vvolv_final.assembly.maker.combined.transcripts.fa -dbtype nucl -title Vvolv_transcripts_db -parse_seqids -out Vvolv_transcripts_db.db -logfile Vvolv_transcripts_db_2-2-15 
