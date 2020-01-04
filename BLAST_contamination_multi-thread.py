# run the new BLAST to output tax info at the same time

import os
import time

from subprocess import *

from Bio import SeqIO

def write_batch_script(outfile, num_proc, r_time, queue ,memory, cmd):

    fp_out = open(outfile,"w")
    fp_out.write("#!/bin/bash\n\n")
    fp_out.write("#SBATCH -n "+str(num_proc)+"\n")
    fp_out.write("#SBATCH -t "+str(r_time)+"\n")
    fp_out.write("#SBATCH -p "+str(queue)+"\n")
    fp_out.write("#SBATCH -N "+str(1)+"\n")
    fp_out.write("#SBATCH --mem="+str(memory)+"\n\n")
    fp_out.write(cmd+"\n")
    fp_out.close()

def monitor_job_list(job_list, interval, max_len=0):

    import time

    while len(job_list) > int(max_len):
        time.sleep(int(interval))
        for job_id in job_list:
            try:
                cmd = "sacct -j "+job_id
                output = Popen(cmd,stdout=PIPE,shell=True)
                status = output.stdout.readlines()[2].split()[5]

                if status == "RUNNING":
                    pass
                elif status == "PENDING":
                    pass
                elif status == "COMPLETING":
                    pass
                elif status == "SUSPENDED":
                    pass
                else:
                    job_list.remove(job_id)
                    if status != "COMPLETED":
                            print "Exited with status: "+status
            except:
                print "something went wrong!"
                job_list.remove(job_id)
    
    return 1
    
def create_data_directory(scaffold_fasta, outdir):

    if not os.path.exists(outdir):
        os.mkdir(outdir)

    fp_in = open(scaffold_fasta, "r")
    seqs = list(SeqIO.parse(fp_in,"fasta"))

    scaffold_index = {}
    chunk_index = 1
    # chunk up scaffolds > 10000
    for seq in seqs:
        if len(seq.seq) > 10000:
            s_index = 0
            while s_index < len(seq.seq)-10000:
                new_seq = str(seq.seq)[s_index:s_index+10000]
                fp_out = open(outdir+"chunk_"+str(chunk_index)+".fa","w")
                fp_out.write(">"+"chunk_"+str(chunk_index)+"\n")
                fp_out.write(new_seq+"\n")
                fp_out.close()
                scaffold_index[chunk_index] = [seq.id,str(s_index),str(s_index+10000)]
                chunk_index += 1
                s_index += 9000
            if s_index < len(seq.seq):
                new_seq = str(seq.seq)[s_index:]
                fp_out = open(outdir+"chunk_"+str(chunk_index)+".fa","w")
                fp_out.write(">"+"chunk_"+str(chunk_index)+"\n")
                fp_out.write(new_seq+"\n")
                fp_out.close()
                scaffold_index[chunk_index] = [seq.id,str(s_index),str(-1)]
                chunk_index += 1
                
        else:
            fp_out = open(outdir+"chunk_"+str(chunk_index)+".fa","w")
            fp_out.write(">"+"chunk_"+str(chunk_index)+"\n")
            fp_out.write(str(seq.seq)+"\n")
            fp_out.close()
            scaffold_index[chunk_index] = [seq.id,str(0),str(-1)]
            chunk_index += 1

    fp_out = open(outdir+"scaffold_map.txt","w")
    for chunk in scaffold_index.keys():
        fp_out.write(str(chunk)+"\t"+"\t".join(scaffold_index[chunk])+"\n")
    fp_out.close()
	
def blastx(inp_file, output_file):

    cmd = "blastx -query "+inp_file+" -db nr -out "+output_file+" -evalue 10e-10 -culling_limit 1 -outfmt '6 qseqid sseqid slen pident length mismatch gapopen qstart qend sstart send evalue bitscore staxids sscinames sskingdoms' -seg yes -num_threads 8"
    write_batch_script(inp_file.strip(".fa")+"_runBLAST.sh", 8, 120, "serial_requeue" ,16000, cmd)
    output = Popen("sbatch "+inp_file.strip(".fa")+"_runBLAST.sh",stdout=PIPE,shell=True)
    job_id = output.stdout.readline().split()[-1].strip("\n")

    return job_id
	
def run_blastx_search(chunk_dir):

    seq_files = os.listdir(chunk_dir)

    job_ids = []
    
    for seq_file in seq_files:
        if seq_file.endswith(".fa") and not os.path.exists(chunk_dir+seq_file.split(".")[0]+".blast_out"):
            while len(job_ids) > 200:
                monitor_job_list(job_ids, 120, 180)
            job_ids.append(blastx(chunk_dir+seq_file, chunk_dir+seq_file.split(".")[0]+".blast_out"))
            
if __name__ == '__main__':

    import sys

    if len(sys.argv) == 3:
        create_data_directory(sys.argv[1], sys.argv[2])
    elif len(sys.argv) == 2:
        run_blastx_search(sys.argv[1])
    else:
        print "create_data_directory(scaffold_fasta, outdir)"
        print "run_blastx_search(chunk_dir)"
       
