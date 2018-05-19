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
