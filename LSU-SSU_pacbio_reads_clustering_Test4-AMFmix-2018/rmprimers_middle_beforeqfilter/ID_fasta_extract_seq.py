from sys import argv
from Bio import SeqIO

script, infilename_ID, infilename_fasta = argv

infile_ID = open(infilename_ID, "r")
all_IDs = infile_ID.read().split("\n")

outfilename = infilename_ID + "_identified_seq_from_ID.fasta"

outfile = open(outfilename, "w")

for seq_record in SeqIO.parse(infilename_fasta, "fasta"):
	print seq_record.id
	if seq_record.id.strip(" ") in all_IDs:
		outfile.write(">" + str(seq_record.id) + "\n" + str(seq_record.seq) + "\n")
		
outfile.close()	
infile_ID.close()
		

