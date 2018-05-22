## preprocessing reads, trim adaptors, rename, incorporate, rm maq=20
bash run_pipline_pacbio_pre-processing.sh
## generate primers
LSU_SSUmCf_transform.sh

## set all reads into one orientation based on primers, trim primers and rm primers in the middle
bash sort_orien_trim_filter.sh

## clustering using both usearch and bbtools
mkdir usearch_analysis

mv UPRASE_usearch_clustering_id91-98.sh ./usearch_analysis

mv plot_91-98id_OTU_UPRASE_Test4-AMFmix-2018.ipynb ./usearch_analysis

mkdir bbtools_analysis

mv Dedupe_bbtools_cluster_id91-98.sh ./bbtools_analysis

mv plot_91-98id_OTU_bbtools_Test4-AMFmix-2018.ipynb ./bbtools_analysis
