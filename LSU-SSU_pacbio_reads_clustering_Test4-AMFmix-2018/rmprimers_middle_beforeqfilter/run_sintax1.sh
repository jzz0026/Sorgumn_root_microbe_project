USEARCH=/global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/05072018newsetITS/usearch_analysis/usearch10.0.240_i86linux32
REF1=/global/projectb/scratch/jzz0026/tools/UNITE-db/unite.7.2.udb
REF2=/global/projectb/scratch/jzz0026/tools/UNITE-db/unite.7.2_rm_unidentifiedG.udb

"$USEARCH" -sintax noprimermiddle.list_identified_seq_from_ID.fasta -db "$REF1" -strand both -tabbedout noprimermiddle_sintax_rm.txt
