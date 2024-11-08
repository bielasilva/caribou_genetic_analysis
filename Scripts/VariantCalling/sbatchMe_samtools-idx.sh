#!/bin/bash

#SBATCH --job-name=Samtools-idx
#SBATCH --output=logs/Samtools-idx-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/Samtools-idx-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=20
#SBATCH --time=5-00
#SBATCH --mem=80G
#SBATCH -p jrw0107_std,general,nova

source /home/gas0042/mambaforge/bin/activate Samtools

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
GENOME="GCA_949782905.1_mRanTar1.h1.1_genomic.fna"
GENOME_FILE="${ROOT_DIR}/data/reference/${GENOME}"
BAM="${ROOT_DIR}/data/bwamem2/Caribou-Merged.bam"
BAI="${BAM}.bai"

samtools index -@ 20 --bai --output $BAI $BAM
