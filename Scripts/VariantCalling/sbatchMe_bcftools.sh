#!/bin/bash

#SBATCH --job-name=Bcftools
#SBATCH --output=logs/Bcftools-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/Bcftools-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=20
#SBATCH --time=5-00
#SBATCH --mem=50G
#SBATCH -p jrw0107_std,general,nova

source /home/gas0042/mambaforge/bin/activate Bcftools

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
IN_VCF="${ROOT_DIR}/data/vcf/Caribou.freebayes.vcf.gz"
OUT_VCF="${ROOT_DIR}/data/vcf/Caribou.filtered.vcf.gz"
NTG_VCF="${ROOT_DIR}/data/vcf/Caribou.filtered.ntg.vcf.gz"


# Remove low quality variants (QUAL < 30), low minor allele frequency (MAF < 0.01), and monomorphic sites (AC=0) and missing data (F_MISSING>0)
# Also, prune the variants to remove those that are in linkage disequilibrium (LD) with each other

# Filtered LD based on https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1009974
# 50kb window, 0.5 r2 threshold

bcftools view --threads 20 --exclude 'QUAL<30 || MAF<0.01 || F_MISSING>0' $IN_VCF | bcftools +prune -m 0.5 -w 50000 -Ov -o $OUT_VCF

bgzip --threads 20 -k -d -f $OUT_VCF

# Remove the Togiak samples

bcftools view --threads 20 --samples "^TOG_2022-01,TOG_2022-02,TOG_2022-03,TOG_2022-04,TOG_2022-05,TOG_2022-06,TOG_2022-07,TOG_2022-09" $OUT_VCF -Ov -o $NTG_VCF

bgzip  --threads 20 -k -d -f $NTG_VCF

