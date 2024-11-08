#!/usr/bin/env bash

#SBATCH --job-name=Multiqc
#SBATCH --cpus-per-task=5
#SBATCH --partition=jrw0107_std,general,nova
#SBATCH --time=1:00:00              # Run time (D-HH:MM:SS)
#SBATCH --output=logs/Multiqc-%j.log          # Output file. %j is replaced with job ID

source /mmfs1/home/gas0042/miniforge3/bin/activate Multiqc

ROOT_DIR="/mmfs1/scratch/CaribouProject"

# Define variables

multiqc --outdir ${ROOT_DIR}/analysis/multiqc ${ROOT_DIR}/data/fastp/logs ${ROOT_DIR}/analysis/QC/fastqc/*/*
