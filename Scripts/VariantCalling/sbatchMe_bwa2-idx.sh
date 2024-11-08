#!/bin/bash

#SBATCH --job-name=BWA2-Index
#SBATCH --output=logs/BWA2-Index-%j.out          # Output file. %j is replaced with job ID
#SBATCH --error=logs/BWA2-Index-%j.err           # Error file. %j is replaced with job ID
#SBATCH --cpus-per-task=5
#SBATCH --time=5-00
#SBATCH --mem=100G
#SBATCH -p jrw0107_std,general,nova

source /home/gas0042/mambaforge/bin/activate Bwa # bwa-mem2 2.2.1

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
BWAMEM2_DIR="${ROOT_DIR}/data/reference/bwamem2"
GENOME="GCA_949782905.1_mRanTar1.h1.1_genomic.fna"
GENOME_FILE="${ROOT_DIR}/data/reference/${GENOME}"

# Run BWA-MEM2
mkdir -p ${BWAMEM2_DIR}
bwa-mem2 index ${GENOME_FILE} -p ${BWAMEM2_DIR}/${GENOME}