#!/bin/bash 
#$ -cwd
#$ -l ram.c=15G
#$ -pe pe_slots 32
#$ -M jzz0026@lbl.gov
#$ -m abe
#$ -l h_rt=12:00:00

module load bbtools

#mcs=3 only give OTU clusters with at least 3 reads
#
dedupe.sh in=all_re_filtered.fq csf=91_maq20/stats_all.txt outbest=91_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=91_maq20/all_cluster_%.fq dot=91_maq20/graph_all$ minidentity=91 e=144
dedupe.sh in=all_re_filtered.fq csf=92_maq20/stats_all.txt outbest=92_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=92_maq20/all_cluster_%.fq dot=92_maq20/graph_all$ minidentity=92 e=128
dedupe.sh in=all_re_filtered.fq csf=93_maq20/stats_all.txt outbest=93_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=93_maq20/all_cluster_%.fq dot=93_maq20/graph_all$ minidentity=93 e=112
dedupe.sh in=all_re_filtered.fq csf=94_maq20/stats_all.txt outbest=94_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=94_maq20/all_cluster_%.fq dot=94_maq20/graph_all$ minidentity=94 e=96
dedupe.sh in=all_re_filtered.fq csf=95_maq20/stats_all.txt outbest=95_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=95_maq20/all_cluster_%.fq dot=95_maq20/graph_all$ minidentity=95 e=80
dedupe.sh in=all_re_filtered.fq csf=96_maq20/stats_all.txt outbest=96_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=96_maq20/all_cluster_%.fq dot=96_maq20/graph_all$ minidentity=96 e=64
dedupe.sh in=all_re_filtered.fq csf=97_maq20/stats_all.txt outbest=97_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=97_maq20/all_cluster_%.fq dot=97_maq20/graph_all$ minidentity=97 e=48
dedupe.sh in=all_re_filtered.fq csf=98_maq20/stats_all.txt outbest=98_maq20/best_all.fq qin=33 usejni=t am=f ac=f fo c rnc=f mcs=3 k=27 mo=1400 ow cc pto nam=4 pattern=98_maq20/all_cluster_%.fq dot=98_maq20/graph_all$ minidentity=98 e=32

cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/90_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/91_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/92_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/93_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/94_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/95_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/96_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/97_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/98_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta
cd /global/projectb/scratch/jzz0026/Sorgum_root_microbes_project/Sorgum_root_microbme/run_1_2_cluster5toget/rename_each_sample/99_maq20/ ; cat best_all.fq | awk '{print (NR%4 == 1) ? "@OTU_" ++i-1 : $0}' | paste - - - - | sed 's/^@/>/g'| cut -f1-2 | tr '\t' '\n' > best_all_re.fasta



