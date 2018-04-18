#!/bin/bash
#$ -cwd
#$ -l ram.c=7g 
#$ -pe pe_slots 32 
#$ -M superjohnlove@gmail.com 
#$ -m abe
#$ -l h_rt=12:00:00
cat 2565956580_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2565956580_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2565956580_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2565956580_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2565956580_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2565956580_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2565956580_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2565956580_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2565956580_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2565956580_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2565956580_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2565956580_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2619619019_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2619619019_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2619619019_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2619619019_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2619619019_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2619619019_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2619619019_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2619619019_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2619619019_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2619619019_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2619619019_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2619619019_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2636416004_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416004_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2636416004_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416004_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2636416004_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416004_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2636416004_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416004_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2636416004_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416004_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2636416004_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416004_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2636416065_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416065_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2636416065_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416065_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2636416065_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416065_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2636416065_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416065_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2636416065_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416065_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2636416065_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416065_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2636416188_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416188_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2636416188_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416188_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2636416188_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416188_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2636416188_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416188_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2636416188_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416188_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2636416188_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2636416188_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2639762506_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762506_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2639762506_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762506_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2639762506_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762506_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2639762506_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762506_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2639762506_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762506_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2639762506_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762506_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2639762618_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762618_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2639762618_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762618_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2639762618_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762618_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2639762618_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762618_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2639762618_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762618_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2639762618_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2639762618_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2654587828_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2654587828_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2654587828_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2654587828_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2654587828_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2654587828_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2654587828_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2654587828_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2654587828_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2654587828_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2654587828_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2654587828_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2663762789_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2663762789_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2663762789_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2663762789_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2663762789_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2663762789_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2663762789_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2663762789_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2663762789_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2663762789_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2663762789_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2663762789_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2671181093_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2671181093_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2671181093_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2671181093_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2671181093_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2671181093_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2671181093_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2671181093_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2671181093_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2671181093_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2671181093_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2671181093_Sorghum_microbiome_072115-40_1_per_distri.txt
cat 2687453597_Sorghum_microbiome_072115-103_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2687453597_Sorghum_microbiome_072115-103_1_per_distri.txt
cat 2687453597_Sorghum_microbiome_072115-104_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2687453597_Sorghum_microbiome_072115-104_1_per_distri.txt
cat 2687453597_Sorghum_microbiome_072115-113_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2687453597_Sorghum_microbiome_072115-113_1_per_distri.txt
cat 2687453597_Sorghum_microbiome_072115-129_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2687453597_Sorghum_microbiome_072115-129_1_per_distri.txt
cat 2687453597_Sorghum_microbiome_072115-187_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2687453597_Sorghum_microbiome_072115-187_1_per_distri.txt
cat 2687453597_Sorghum_microbiome_072115-40_1.sam | grep -n "YI:f:" | awk -F 'YI:f:' '{print $2}' | cut -d "." -f 1 | sort -n | uniq -c > 2687453597_Sorghum_microbiome_072115-40_1_per_distri.txt
