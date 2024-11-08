#!/bin/bash

#SBATCH --job-name=Freebayes
#SBATCH --output=logs/Freebayes-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/Freebayes-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=30
#SBATCH --time=5-00
#SBATCH --mem=100G
#SBATCH -p jrw0107_std,general,nova

source /home/gas0042/mambaforge/bin/activate Freebayes

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
GENOME="GCA_949782905.1_mRanTar1.h1.1_genomic.fna"
GENOME_FILE="${ROOT_DIR}/data/reference/${GENOME}"
GENOME_FAI="${ROOT_DIR}/data/reference/${GENOME}.fai"
BAM="${ROOT_DIR}/data/bwamem2/Caribou-Merged.bam"
OUT_VCF="${ROOT_DIR}/data/vcf/Caribou.freebayes.vcf.gz"

mkdir -p ${ROOT_DIR}/data/vcf/

freebayes-parallel <(fasta_generate_regions.py $GENOME_FAI 100000) 30 -f $GENOME_FILE $BAM | bgzip -@ 30 -c > $OUT_VCF

