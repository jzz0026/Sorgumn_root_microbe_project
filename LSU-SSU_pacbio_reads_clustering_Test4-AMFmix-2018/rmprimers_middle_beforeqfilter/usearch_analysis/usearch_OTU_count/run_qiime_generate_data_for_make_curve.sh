source activate qiime1
## convert to biom
for i in $(ls usearch_OTU_id9*_count.txt | cut -d "." -f 1); do biom convert -i ${i}.txt -o ${i}.biom --to-hdf5 --table-type="OTU table" ; done

## qiime rarefaction curve
multiple_rarefactions.py -i usearch_OTU_id93_count.biom -m 0 -x 1600 -s 10 -n 50 -o 93_rare_20-100/
alpha_diversity.py -i 93_rare_20-100/ -o 93_alpha_rare/  -m observed_species
collate_alpha.py -i 93_alpha_rare/ -o 93_alpha_collated/
