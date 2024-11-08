#!/bin/bash

#SBATCH --job-name=Samtools-Faidx
#SBATCH --output=logs/Samtools-Faidx-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/Samtools-Faidx-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=5
#SBATCH --time=5-00
#SBATCH --mem=10G
#SBATCH -p jrw0107_std,general,nova

source /home/gas0042/mambaforge/bin/activate Samtools

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
GENOME="GCA_949782905.1_mRanTar1.h1.1_genomic.fna"
GENOME_FILE="${ROOT_DIR}/data/reference/${GENOME}"

samtools faidx ${GENOME_FILE} --fai-idx ${GENOME_FILE}.fai

