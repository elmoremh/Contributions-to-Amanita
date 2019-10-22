#!/usr/env/python

# Run Assemblathon script and CEGMA pipeline in order to assess the quality of each assembly
# Also trim the scaffolds file to include only sequeces > 1000

import os
import time

from subprocess import *

from Bio import SeqIO

def rename_sequences(fasta_in, fasta_out):

    fp_in = open(fasta_in)
    seqs = list(SeqIO.parse(fp_in, "fasta"))
    fp_in.close()

    new_seqs = []
    fp_out = open(fasta_out, "w")
    
    for seq in seqs:
        if not seq.id.startswith("seq"):
            fp_out.write(">seq_"+seq.id+"\n")
        else:
            fp_out.write(seq.id+"\n")
        fp_out.write(str(seq.seq)+"\n")
    fp_out.close()

    
def trim_fasta(fasta_in, fasta_out, min_len):
    
    fp_in = open(fasta_in)
    seqs = list(SeqIO.parse(fp_in, "fasta"))
    fp_in.close()

    new_seqs = []
    for seq in seqs:
        if len(seq) >= int(min_len):
            new_seqs.append(seq)
    
    fp_out = open(fasta_out,"w")
    SeqIO.write(new_seqs, fp_out, "fasta")
    fp_out.close()


def run_cegma(fasta_file, outdir):

    if not os.path.exists(outdir):
        os.mkdir(outdir)

    cwd = os.getcwd()

    os.chdir(outdir)
    
    outfile = open("run_cegma.sh","w")
    
    cmd = "#!/bin/bash\n\n"
    cmd += "#SBATCH -n 8\n"
    cmd += "#SBATCH --ntasks-per-node=8\n"
    cmd += "#SBATCH -t 500\n"
    cmd += "#SBATCH --account=uio\n"
    cmd += "#SBATCH --mem-per-cpu=500\n\n"
        
    
    cmd += "cegma -T 16 --max_intron 250 -g "+fasta_file+" -o "+fasta_file.split("/")[-1].split(".")[0]
    
    outfile.write(cmd)
    outfile.close()

    call("sbatch run_cegma.sh",shell=True)

    os.chdir(cwd)

def run_assemblathon_script(fasta_file, output_file):

    cmd = "perl ~/Code/GenomeAssembly/assemblathon_stats.pl "+fasta_file+" > "+output_file

    call(cmd, shell=True)


def run_evaluation_ABYSS(assembly_dir, name):

    # run evaluation steps on ABYSS directory with kmer subdirectories

    kmers = os.listdir(assembly_dir)

    for kmer in kmers:
        if os.path.exists(assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds.fa"):

            # rename sequences
            rename_sequences(assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds.fa", assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds_rn.fa")
            
            # trim to 1000 nt or larger
            trim_fasta(assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds_rn.fa", assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds_1000.fa", 1000)

            # run stats
            run_assemblathon_script(assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds_1000.fa", assembly_dir+kmer+"/"+name+"_"+kmer+"-assemblathon.txt")
            
            run_cegma(assembly_dir+kmer+"/"+name+"_"+kmer+"-scaffolds_1000.fa", assembly_dir+kmer+"/cegma/")


def get_min_length(fasta_file):

    min_len = 100000

    seqs = list(SeqIO.parse(fasta_file, "fasta"))

    for seq in seqs:
        if len(seq) < min_len:
            min_len = len(seq)
    print min_len


if __name__ == '__main__':

    import sys

    if len(sys.argv) == 3:
        run_evaluation_ABYSS(sys.argv[1], sys.argv[2])
    elif len(sys.argv) == 4:
        trim_fasta(sys.argv[1], sys.argv[2], sys.argv[3])
    elif len(sys.argv) == 2:
        get_min_length(sys.argv[1]) 
    else:
        print "run_evaluation_ABYSS(assembly_dir, name)"
        print "trim_fasta(fasta_in, fasta_out, min_len)"
        print "get_min_length(fasta_file)"



    
