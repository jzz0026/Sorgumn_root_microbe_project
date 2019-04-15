## decomplexity
mkdir decomplexity
/global/projectb/scratch/jzz0026/tools/bbmap/seal.sh in=GGAAA_2_5_passes.fasta pattern=decomplexity/out_%.fq ref=barcodes.fasta k=16 edist=2 restrictleft=40

## trim ends
mkdir trim
for i in $(ls decomplexity/out_bc10*.fq| awk -F "." '{print $1}'|awk -F "/" '{print $2}') ; do (/global/projectb/scratch/jzz0026/tools/bbmap/bbduk.sh in=decomplexity/$i.fq out=trim/$i-r-trim.fq k=16 ktrim=r edist=2 restrictright=40 ref=barcodes.fasta) ; done

## rename header of each barcoded_seq file
for i in $(ls trim/out_bc10*-rltrim.fq| awk -F "/" '{print $2}' | awk -F "-" '{print $1}'); do echo "cat trim/$i-rltrim.fq | awk '{print (NR%4 == 1) ? \"@$i-_\" ++i-1 : \$0}' > trim/re_$i-rltrim.fq" >> rename_script.sh; done
bash rename_script.sh

## incorporate all renamed files
cat trim/re_out_bc10*.fq > re_all-rltrim.fq
