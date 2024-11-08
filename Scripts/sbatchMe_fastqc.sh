#!/usr/bin/env bash

#SBATCH --job-name=FastQC
#SBATCH --cpus-per-task=30
#SBATCH --partition=jrw0107_std,general,nova
#SBATCH --time=1:00:00              # Run time (D-HH:MM:SS)
#SBATCH --output=logs/FastQC-%j.log         # Output file. %j is replaced with job ID

source /mmfs1/home/gas0042/miniforge3/bin/activate Fastqc

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables
RAW_DIR="/mmfs1/home/gas0042/Andrea_caribou/raw/Willoughby_Project_*"
FASTP_DIR="${ROOT_DIR}/data/fastp"

mkdir -p ${ROOT_DIR}/analysis/QC/fastqc/{raw,fastp}

fastqc -o ${ROOT_DIR}/analysis/QC/fastqc/raw --threads 30 ${RAW_DIR}/*.fastq.gz

fastqc -o ${ROOT_DIR}/analysis/QC/fastqc/fastp --threads 30 ${FASTP_DIR}/*.fq.gz
