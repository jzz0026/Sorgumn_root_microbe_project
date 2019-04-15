##
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=re_all-rltrim_qfilter.fasta out=sort_orien_trim_filter/SSUmCf.sam ref=sort_orien_trim_filter/SSU_primers.fasta rcomp=t

cat SSUmCf.sam | awk -F ":" '$NF > 90' | grep -E "r_SSU" | awk -F " " '{print $3}' > SSUmCf_rev.list
cat SSUmCf.sam | awk -F ":" '$NF > 90' | grep -E -v "r_SSU" | awk -F " " '{print $3}' > SSUmCf_for.list

python ID_fasta_extract_seq.py SSUmCf_for.list ../re_all-rltrim_qfilter.fasta &
python ID_fasta_extract_seq.py SSUmCf_rev.list ../re_all-rltrim_qfilter.fasta &

## reverse orientation of reverse sequences
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/reformat.sh in=SSUmCf_rev.list_identified_seq_from_ID.fasta out=SSUmCf_rev_rev.list_identified_seq_from_ID.fasta rcomp

## incorporate 
cat SSUmCf_for.list_identified_seq_from_ID.fasta SSUmCf_rev_rev.list_identified_seq_from_ID.fasta > SSUmCf_sorien_detec.fasta

## got rest of sequences not detected
python ID_fasta_remove_seq.py SSUmCf_for_rev.list ../re_all-rltrim_qfilter.fasta

##
cat SSUmCf_rest_LSU.sam | awk -F ":" '$NF > 90' | grep -E "r_LSU" | awk -F " " '{print $3}' > SSUmCf_rest_LSU_for.list
cat SSUmCf_rest_LSU.sam | awk -F ":" '$NF > 90' | grep -E -v "r_LSU" | awk -F " " '{print $3}' > SSUmCf_rest_LSU_rev.list

##
python ID_fasta_extract_seq.py SSUmCf_rest_LSU_for.list ../re_all-rltrim_qfilter.fasta &
python ID_fasta_extract_seq.py SSUmCf_rest_LSU_rev.list ../re_all-rltrim_qfilter.fasta &

##
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/reformat.sh in=SSUmCf_rest_LSU_for.list_identified_seq_from_ID.fasta out=SSUmCf_rest_LSU_for_rev.list_identified_seq_from_ID.fasta rcomp

##
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=SSUmCf_LSUmCf_sorien_detec.fasta out=SSUmCf.sam ref=SSU_primers.fasta rcomp=t
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/msa.sh in=SSUmCf_LSUmCf_sorien_detec.fasta out=LSUmCf.sam ref=LSU_primers.fasta rcomp=t

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

## get reads without primers in the middle
python ID_fasta_extract_seq.py noprimermiddle.list SSUmCf_LSUmCf_sorien_detec.fasta

## cut off primers
/global/projectb/sandbox/gaag/bbtools/jgi-bbtools/cutprimers.sh in=noprimermiddle.list_identified_seq_from_ID.fasta out=noprimermiddle_rmprimer.fasta sam1=SSUmCf.sam sam2=LSUmCf.sam

## rm chimera using reference
USEARCH=/global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/05072018newsetITS/usearch_analysis/usearch10.0.240_i86linux32
"$USEARCH" -uchime2_ref noprimermiddle_rmprimer.fasta -db /global/projectb/scratch/jzz0026/tools/UNITE-db/uchime_reference_dataset_untrimmed_28.06.2017.udb -notmatched noprimermiddle_nochimeric_uchime_ref.fa -strand plus -mode sensitive
