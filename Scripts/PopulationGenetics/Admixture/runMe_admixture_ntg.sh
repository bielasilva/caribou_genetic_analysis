#!/bin/bash

source /mmfs1/home/gas0042/mambaforge/bin/activate Admixture

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
IN_FILE="${ROOT_DIR}/analysis/admixture/plink/Caribou.ntg.bed"

for K in {1..5}; do
sbatch <<- EOF
#!/bin/bash

#SBATCH --job-name=Admx.ntg_K${k}
#SBATCH --output=logs/Admixture.ntg_K${k}-%j.out
#SBATCH --error=logs/Admixture.ntg_K${k}-%j.err
#SBATCH --cpus-per-task=20
#SBATCH --mem=50G
#SBATCH --partition=jrw0107_std,general,nova
#SBATCH --time=7-00

admixture -j20 -B1000 --cv $IN_FILE $K

mv ${ROOT_DIR}/run/PopulationGenetics/Admixture/Caribou.ntg.${K}* ${ROOT_DIR}/analysis/admixture/ntg/
EOF
done

