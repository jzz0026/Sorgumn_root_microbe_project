## clustering using id 91 to 98

./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 2 -uparseout all_re_filtered_lensort_OTU_id98.txt -otus all_re_filtered_lensort_OTU_id98.fasta
./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 4 -uparseout all_re_filtered_lensort_OTU_id96.txt -otus all_re_filtered_lensort_OTU_id96.fasta
./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 5 -uparseout all_re_filtered_lensort_OTU_id95.txt -otus all_re_filtered_lensort_OTU_id95.fasta
./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 6 -uparseout all_re_filtered_lensort_OTU_id94.txt -otus all_re_filtered_lensort_OTU_id94.fasta
./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 7 -uparseout all_re_filtered_lensort_OTU_id93.txt -otus all_re_filtered_lensort_OTU_id93.fasta
./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 8 -uparseout all_re_filtered_lensort_OTU_id92.txt -otus all_re_filtered_lensort_OTU_id92.fasta
./usearch8.0.1623_i86linux32 -cluster_otus all_re_filtered_trim1250_lensort_drep_sortadun.fasta -relabel OTU_ -otu_radius_pct 9 -uparseout all_re_filtered_lensort_OTU_id91.txt -otus all_re_filtered_lensort_OTU_id91.fasta


## map reads back to quantity 
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id100.fasta -strand plus -id 1.0 -uc all_re_filtered_lensort_OTU_id100.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id99.fasta -strand plus -id 0.99 -uc all_re_filtered_lensort_OTU_id99.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id98.fasta -strand plus -id 0.98 -uc all_re_filtered_lensort_OTU_id98.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id96.fasta -strand plus -id 0.96 -uc all_re_filtered_lensort_OTU_id96.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id95.fasta -strand plus -id 0.95 -uc all_re_filtered_lensort_OTU_id95.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id94.fasta -strand plus -id 0.94 -uc all_re_filtered_lensort_OTU_id94.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id93.fasta -strand plus -id 0.93 -uc all_re_filtered_lensort_OTU_id93.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id92.fasta -strand plus -id 0.92 -uc all_re_filtered_lensort_OTU_id92.uc
./usearch8.0.1623_i86linux32 -usearch_global all_re_filtered_trim1250_lensort.fasta -db all_re_filtered_lensort_OTU_id91.fasta -strand plus -id 0.91 -uc all_re_filtered_lensort_OTU_id91.uc

## run sintax usearch
#USEARCH=../../../usearch10.0.240_i86linux32
#REF1=~/tools/USEARCH/usearch_db/unite.7.2.udb
#REF2=~/tools/USEARCH/usearch_db/unite.7.2_rm_unidentifiedG.udb

USEARCH=../../../usearch10.0.240_i86linux32
REF1=/global/projectb/scratch/jzz0026/tools/UNITE-db/unite.7.2.udb
REF2=/global/projectb/scratch/jzz0026/tools/UNITE-db/unite.7.2_rm_unidentifiedG.udb

for i in $(ls all_re_filtered_lensort_OTU_id*.fasta| cut -d "." -f 1) ; do "$USEARCH" -sintax ${i}.fasta -db "$REF1" -strand both -tabbedout ${i}_sintax_rm.txt ; done
for i in $(ls all_re_filtered_lensort_OTU_id*.fasta| cut -d "." -f 1) ; do "$USEARCH" -sintax ${i}.fasta -db "$REF2" -strand both -tabbedout ${i}_sintax_rm_unidentifiedG.txt ; done
