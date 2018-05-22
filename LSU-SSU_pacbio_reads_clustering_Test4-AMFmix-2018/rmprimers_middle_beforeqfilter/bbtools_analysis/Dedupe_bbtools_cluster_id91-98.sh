## mkdir a new directory to put dedupe results

dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=91_maq20/stats_all.txt outbest=91_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=91_maq20/all_cluster_%.fq dot=91_maq20/graph_all$ minidentity=91 e=113
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=92_maq20/stats_all.txt outbest=92_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=92_maq20/all_cluster_%.fq dot=92_maq20/graph_all$ minidentity=92 e=100
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=93_maq20/stats_all.txt outbest=93_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=93_maq20/all_cluster_%.fq dot=93_maq20/graph_all$ minidentity=93 e=88
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=94_maq20/stats_all.txt outbest=94_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=94_maq20/all_cluster_%.fq dot=94_maq20/graph_all$ minidentity=94 e=75
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=95_maq20/stats_all.txt outbest=95_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=95_maq20/all_cluster_%.fq dot=95_maq20/graph_all$ minidentity=95 e=63
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=96_maq20/stats_all.txt outbest=96_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=96_maq20/all_cluster_%.fq dot=96_maq20/graph_all$ minidentity=96 e=50
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=97_maq20/stats_all.txt outbest=97_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=97_maq20/all_cluster_%.fq dot=97_maq20/graph_all$ minidentity=97 e=38
dedupe.sh in=../Test4_AMFmix_2018-filtered-nochimera.fastq csf=98_maq20/stats_all.txt outbest=98_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1250 ow cc pto nam=4 pattern=98_maq20/all_cluster_%.fq dot=98_maq20/graph_all$ minidentity=98 e=25

## rename best reads into OTU
for i in $(ls $PWD/9*_maq20 -d) ; do (cd ${i} ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > ${i}/best_all_re.fasta) ; done

## run sintax usearch
USEARCH=~/tools/USEARCH/usearch10.0.240_i86linux32
REF1=~/tools/USEARCH/usearch_db/unite.7.2.udb
REF2=~/tools/USEARCH/usearch_db/unite.7.2_rm_unidentifiedG.udb

for i in $(ls 9*_maq20 -d) ; do "$USEARCH" -sintax ${i}/best_all_re.fasta -db "$REF1" -strand both -tabbedout ${i}/best_all_sintax_rm.txt ; done
for i in $(ls 9*_maq20 -d) ; do "$USEARCH" -sintax ${i}/best_all_re.fasta -db "$REF2" -strand both -tabbedout ${i}/best_all_sintax_rm_unidentifiedG.txt ; done

