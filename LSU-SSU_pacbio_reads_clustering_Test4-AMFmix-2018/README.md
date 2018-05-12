## pre-processing PacBio reads with >5 passes
./run_pipline_pacbio_pre-processing.sh 
## generate folders for both bbtools and usearch analysis
mkdir usearch_analysis
mv UPRASE_usearch_clustering_id91-98.sh ./usearch_analysis
mv plot_91-98id_OTU_UPRASE_Test4-AMFmix-2018.ipynb ./usearch_analysis
mkdir bbtools_analysis
mv Dedupe_bbtools_cluster_id91-98.sh ./bbtools_analysis
mv plot_91-98id_OTU_bbtools_Test4-AMFmix-2018.ipynb ./bbtools_analysis

## get into the folder to run scrip

