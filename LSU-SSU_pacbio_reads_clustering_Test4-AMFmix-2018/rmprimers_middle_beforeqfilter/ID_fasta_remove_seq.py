from sys import argv
from Bio import SeqIO

script, infilename_ID, infilename_fasta = argv

infile_ID = open(infilename_ID, "r")
all_IDs = infile_ID.read().split("\n")

outfilename = infilename_ID + "_removed.fasta"

outfile = open(outfilename, "w")

for seq_record in SeqIO.parse(infilename_fasta, "fasta"):
	if seq_record.id not in all_IDs:
		outfile.write(">" + str(seq_record.id) + "\n" + str(seq_record.seq) + "\n")
	elif seq_record.id in all_IDs:
		print sorted(str(seq_record.id))
	
		
outfile.close()	
infile_ID.close()
