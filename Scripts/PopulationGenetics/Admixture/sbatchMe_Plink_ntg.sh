#!/bin/bash

#SBATCH --job-name=Plink_ntg
#SBATCH --output=logs/Plink_ntg-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/Plink_ntg-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=2
#SBATCH --time=5-00
#SBATCH --mem=10G
#SBATCH -p jrw0107_std,general,nova

source /home/gas0042/mambaforge/bin/activate Admixture

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
IN_VCF="${ROOT_DIR}/data/vcf/Caribou.filtered.ntg.vcf.gz"
OUTPUT="${ROOT_DIR}/analysis/admixture/plink/Caribou.ntg"

# Generate the input file in plink format
plink --vcf $IN_VCF --make-bed --out $OUTPUT --allow-extra-chr

# ADMIXTURE does not accept chromosome names that are not human chromosomes. We will thus just exchange the first column by 0
awk '{$1="0";print $0}' $OUTPUT.bim > $OUTPUT.bim.tmp
mv $OUTPUT.bim.tmp $OUTPUT.bim
