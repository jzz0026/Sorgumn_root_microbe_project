module load bbtools

## generate degenerate_primers
python LSU_SSUmCf_transform.sh

## generate reverse sequences of primers
reformat.sh in=SSUmCf_forword_degenerate_primers.fasta out=SSUmCf_reverse_degenerate_primers.fasta rcomp
sed "s/forword/reverse/g" -i SSUmCf_reverse_degenerate_primers.fasta
reformat.sh in=LSUmCf_forword_degenerate_primers.fasta out=LSUmCf_reverse_degenerate_primers.fasta rcomp
sed "s/forword/reverse/g" -i LSUmCf_reverse_degenerate_primers.fasta

cat LSUmCf_*_degenerate_primers.fasta > LSUmCf_for_rev_degenerate_primers.fasta
cat SSUmCf_*_degenerate_primers.fasta > SSUmCf_for_rev_degenerate_primers.fasta
rm SSUmCf_forword_degenerate_primers.fasta SSUmCf_reverse_degenerate_primers.fasta
rm LSUmCf_forword_degenerate_primers.fasta LSUmCf_reverse_degenerate_primers.fasta

## map primers to amplicon
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=re_all_rl_trimmed_qfilter.fa out=SSUmCf.sam ref=SSUmCf_for_rev_degenerate_primers.fasta rcomp=f

## split forward and reverse
cat SSUmCf.sam | awk -F ":" '$NF > 90' | grep -E "reverse" | awk -F " " '{print $3}' > SSUmCf_rev.list
cat SSUmCf.sam | awk -F ":" '$NF > 90' | grep -E "forword" | awk -F " " '{print $3}' > SSUmCf_for.list


python ID_fasta_extract_seq.py SSUmCf_for.list re_all_rl_trimmed_qfilter.fa
python ID_fasta_extract_seq.py SSUmCf_rev.list re_all_rl_trimmed_qfilter.fa

## reverse orientation of reverse sequences
reformat.sh in=SSUmCf_rev.list_identified_seq_from_ID.fasta out=SSUmCf_rev_rev.list_identified_seq_from_ID.fasta rcomp

## incorporate 
cat SSUmCf_for.list_identified_seq_from_ID.fasta SSUmCf_rev_rev.list_identified_seq_from_ID.fasta > SSUmCf_sorien_detec.fasta

## remove somefiles
rm SSUmCf_for.list_identified_seq_from_ID.fasta SSUmCf_rev.list_identified_seq_from_ID.fasta SSUmCf_rev_rev.list_identified_seq_from_ID.fasta

## got rest of sequences not detected
cat SSUmCf_for.list SSUmCf_rev.list > SSUmCf_for_rev.list
python ID_fasta_remove_seq.py SSUmCf_for_rev.list re_all_rl_trimmed_qfilter.fa

## check LSU primers for rest of sequences
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=SSUmCf_for_rev.list_removed.fasta out=SSUmCf_rest_LSU.sam ref=LSUmCf_for_rev_degenerate_primers.fasta rcomp=f

## get sequences
cat SSUmCf_rest_LSU.sam | awk -F ":" '$NF > 90' | grep "forword" | awk -F " " '{print $3}' > SSUmCf_rest_LSU_for.list
cat SSUmCf_rest_LSU.sam | awk -F ":" '$NF > 90' | grep "reverse" | awk -F " " '{print $3}' > SSUmCf_rest_LSU_rev.list

python ID_fasta_extract_seq.py SSUmCf_rest_LSU_for.list re_all_rl_trimmed_qfilter.fa
python ID_fasta_extract_seq.py SSUmCf_rest_LSU_rev.list re_all_rl_trimmed_qfilter.fa

## reverse SSUmCf_rest_LSU_for.list_identified_seq_from_ID.fasta
reformat.sh in=SSUmCf_rest_LSU_for.list_identified_seq_from_ID.fasta out=SSUmCf_rest_LSU_for_rev.list_identified_seq_from_ID.fasta rcomp

cat SSUmCf_rest_LSU_rev.list_identified_seq_from_ID.fasta SSUmCf_rest_LSU_for_rev.list_identified_seq_from_ID.fasta > SSUmCf_rest_LSU_sorien_detec.fasta
cat SSUmCf_sorien_detec.fasta SSUmCf_rest_LSU_sorien_detec.fasta > SSUmCf_LSUmCf_sorien_detec.fasta
rm SSUmCf_sorien_detec.fasta SSUmCf_rest_LSU_sorien_detec.fasta
rm *_identified_seq_from_ID.fasta
rm *_removed.fasta
rm *.list
rm *.sam
