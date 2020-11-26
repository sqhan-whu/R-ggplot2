./intervene/intervene venn -i intervene/example_data/ENCODE_hESC/*.bed

./intervene/intervene upset -i intervene/example_data/ENCODE_hESC/*.bed

./intervene/intervene pairwise -i intervene/example_data/dbSUPER_mm9/*.bed

intervene pairwise  -i *up.bed --filenames --compute frac --htype pie -o $path_DG4R_CG4R/intervene_DG4R
