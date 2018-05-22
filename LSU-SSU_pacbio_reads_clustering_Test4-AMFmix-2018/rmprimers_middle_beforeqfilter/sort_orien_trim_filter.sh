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

## map SSUmCf and LSUmCf to SSUmCf_LSUmCf_sorien_detec.fasta
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=SSUmCf_LSUmCf_sorien_detec.fasta out=SSUmCf.sam ref=SSUmCf_for_rev_degenerate_primers.fasta rcomp=f
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=SSUmCf_LSUmCf_sorien_detec.fasta out=LSUmCf.sam ref=LSUmCf_for_rev_degenerate_primers.fasta rcomp=f

## get length
cat SSUmCf_LSUmCf_sorien_detec.fasta | awk '$0 ~ ">" {print c; c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' > SSUmCf_LSUmCf_sorien_detec.length

## join LSU.sam and length
join -1 3 -2 1 LSUmCf.sam SSUmCf_LSUmCf_sorien_detec.length > LSUmCf_2.sam

## get list of read with no SSU in the middle
cat SSUmCf.sam | awk -F ":" '$NF > 90' | awk -F " " '$4 < 1000' | awk -F " " '{print $3}' |sort > noSSU_middle.list

## get list of read with no LSU in the middle
cat LSUmCf_2.sam | awk 'NR == 1 { $14 = "diff." } NR >= 3 { $14 = $13 - $4 } 1' | awk -F " " '$NF < 1000' | awk -F " " '{print $1}'|sort > noLSU_middle.list

## get reads existed in both noSSU_middle.list and noLSU_middle.list
comm -12 noSSU_middle.list noLSU_middle.list > noprimermiddle.list
python ID_fasta_extract_seq.py noprimermiddle.list SSUmCf_LSUmCf_sorien_detec.fasta


## cut primers using sam file
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/cutprimers.sh in=noprimermiddle.list_identified_seq_from_ID.fasta out=noprimermiddle_rmprimer.fasta sam1=SSUmCf.sam sam2=LSUmCf.sam

## using uchime to remove chimera based on ref
USEARCH=/global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/05072018newsetITS/usearch_analysis/usearch10.0.240_i86linux32

"$USEARCH" -uchime2_ref noprimermiddle_rmprimer.fasta -db /global/projectb/scratch/jzz0026/tools/UNITE-db/uchime_reference_dataset_untrimmed_28.06.2017.udb -notmatched 
noprimermiddle_nochimeric_uchime_ref.fa -strand plus -mode sensitive


